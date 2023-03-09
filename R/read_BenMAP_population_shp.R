#' read_BenMAP_population_shp
#'
#' @param path
#' @param crs
#' @param verbose
#'
#' @importFrom tibble tibble
#' @importFrom units set_units
#' @importFrom tidyr pivot_longer
#' @importFrom sf st_drop_geometry
#' @importFrom dplyr filter mutate
#'
#' @return
#' @export
#'
#' @examples
read_BenMAP_population_shp <- function (
    path,
    crs = NULL,
    verbose = getOption("verbose")
) {

  msg <- function (...) if(isTRUE(verbose)) {
    message("[read_BenMAP_population_shp] ", ...)
  }

  shp_geodata <-
    read_BenMAP_shp(
      path,
      crs = crs,
      verbose = verbose)

  wide_data <-
    sf::st_drop_geometry(shp_geodata)

  long_data <-
    tidyr::pivot_longer(
      wide_data,
      cols = -c(BenMAP_col, BenMAP_row),
      names_to = c("BenMAP_race", "BenMAP_eth", "BenMAP_sex", "BenMAP_age"),
      names_sep = "_",
      values_to = "pop_qty",
      values_drop_na = TRUE)

  filtered_data <-
    dplyr::filter(long_data, pop_qty > 0)

  msg("dropped ", nrow(long_data) - nrow(filtered_data),
      " rows where pop_qty == 0")

  recoded_data <-
    dplyr::mutate(
      filtered_data,
      BenMAP_race = recode_BenMAP_race(BenMAP_race),
      BenMAP_eth = recode_BenMAP_ethnicity(BenMAP_eth),
      BenMAP_sex = recode_BenMAP_sex(BenMAP_sex),
      BenMAP_age = recode_BenMAP_age_5yr(BenMAP_age))

  # This helps to ignore, e.g., `Total_Pop`
  pruned_data <-
    dplyr::filter(
      recoded_data,
      dplyr::if_all(
        matches("BenMAP_"),
        function (x) !is.na(x)))

  tidied_data <-
    dplyr::mutate(
      pruned_data,
      pop_qty = unittools::as_person(pop_qty))

  comment(tidied_data) <-
    path

  return(tidied_data)

}
