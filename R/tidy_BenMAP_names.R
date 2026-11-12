#' tidy_BenMAP_names
#'
#' @param input_data (tabular) as from a CSV exported by BenMAP
#' @param codec (character) key to renaming columns
#' @param verbose (logical)
#'
#' @importFrom dplyr rename select
#' @importFrom tidyselect any_of
#'
#' @return same data, new column names
#'
#' @export
tidy_BenMAP_names <- function (
    input_data,
    codec = c(
      "BM_col"      = "Col",
      "BM_col"      = "COL",
      "BM_row"      = "Row",
      "BM_row"      = "ROW",
      "BM_endpt_h1" = "Endpoint Group",
      "BM_endpt_h2" = "Endpoint",
      "BM_auth"     = "Author",
      "BM_dx"       = "Delta",
      "BM_dy"       = "Point Estimate",
      "BM_y0"       = "Baseline",
      "BM_pop_qty"  = "Population",
      "BM_geo_id"   = "GEOID",
      "BM_geo_id"   = "GEOID10",
      "BM_pop_sex"  = "Sex",
      "BM_pop_race" = "Race",
      "BM_pop_eth"  = "Ethnicity"),
    ...,
    verbose = getOption("verbose", default = FALSE)
) {

  msg <- function (...) if(isTRUE(verbose)) message("[tidy_BenMAP_names] ", ...)

  tidied_data <-
    dplyr::rename(
      input_data,
      tidyselect::any_of(codec))

  if (all(c("Start Age", "End Age") %in% names(input_data))) {
    tidied_data <-
      tidyr::unite(
        tidied_data, BM_pop_age, `Start Age`, `End Age`, sep = " to ")
  }

  tidied_data <-
    dplyr::select(
      tidied_data,
      tidyr::any_of(names(codec)),
      everything())

  if (any(duplicated(names(tidied_data)))) {
    stop("[tidy_BenMAP_names] non-unique names")
  }

  return(tidied_data)

}
