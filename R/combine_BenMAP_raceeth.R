#' combine_BenMAP_raceeth
#'
#' @param race (character) as in [recode_BenMAP_race()]
#' @param eth (character) as in [recode_BenMAP_ethnicity()]
#' @param levels (character) shouldn't need to change
#' @param verbose (logical)
#'
#' @importFrom dplyr if_else
#' @importFrom strtools str_csv
#'
#' @return factor
#'
#' @export
combine_BenMAP_raceeth <- function (
  race,
  eth,
  levels = c("White", "Hispanic", "Asian", "Black", "NatAmer"),
  verbose = getOption("verbose", default = TRUE)
) {

  msg <- function (...) if(isTRUE(verbose)) {
    message("[combine_BenMAP_raceeth] ", ...)
  }

  combined <-
    dplyr::if_else(
      eth == "Hispanic",
      true = "Hispanic",
      false = race)

  msg("setting levels: ", strtools::str_csv(levels))

  recoded <-
    factor(combined, levels = levels)

  return(recoded)

}
