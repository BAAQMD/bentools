read_BenMAP_shp <- function (
    path,
    crs = NULL,
    verbose = getOption("verbose", default = FALSE)
) {

  msg <- function (...) if(isTRUE(verbose)) {
    message("[read_BenMAP_shp] ", ...)
  }

  if (isFALSE(file.exists(path))) {
    stop("[read_BenMAP_shp] file not found: ", path)
  }

  shp_geodata <-
    shptools::read_shp(
      path,
      crs = crs,
      verbose = verbose)

  geo_id_var <-
    names(shp_geodata) %>%
    purrr::keep(str_detect, "GEOID")

  if (length(geo_id_var) > 0) {
    msg("geo_id_var is: ", geo_id_var)
  }

  selected_geodata <-
    dplyr::select(
      shp_geodata,
      BenMAP_row = "ROW",
      BenMAP_col = "COL",
      any_of(
        c(geo_id = geo_id_var)),
      any_of(c(
        land_km2 = "ALAND",
        water_km2 = "AWATER")),
      everything())

  m2_to_km2 <- function (x) {
    units::set_units(units::as_units(x, "m^2"), "km^2")
  }

  tidied_geodata <-
    selected_geodata %>%
    mutate(across(
      any_of(c("BenMAP_row", "BenMAP_col")),
      as.integer)) %>%
    mutate(across(
      any_of(c("land_km2", "water_km2")),
      m2_to_km2))

  return(tidied_geodata)

}
