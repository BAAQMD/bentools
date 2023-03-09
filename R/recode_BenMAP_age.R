BENMAP_AGE_LEVELS <- c(
  "0TO0"  = "0",
  "1TO4"  = "1 to 4",
  "5TO9"  = "5 to 9",
  "10TO" = "10 to 14",
  "15TO" = "15 to 19",
  "20TO" = "20 to 24",
  "25TO" = "25 to 29",
  "30TO" = "30 to 34",
  "35TO" = "35 to 39",
  "40TO" = "40 to 44",
  "45TO" = "45 to 49",
  "50TO" = "50 to 54",
  "55TO" = "55 to 59",
  "60TO" = "60 to 64",
  "65TO" = "65 to 69",
  "70TO" = "70 to 74",
  "75TO" = "75 to 79",
  "80TO" = "80 to 84",
  "85UP" = "85 and up")

#' recode_BenMAP_age_5yr
#'
#' @param age (character) as in `BENMAP_AGE_LEVELS`
#' @param codec (character) named lookup
#' @importFrom stringr str_sub
#' @importFrom dplyr recode
#' @return (ordered) factor
#'
#' @export
recode_BenMAP_age_5yr <- function (
    age,
    codec = BENMAP_AGE_LEVELS
) {

  # take only the first 4 characters
  first4char <-
    stringr::str_sub(age, start = 1, end = 4)

  recoded <-
    ordered(first4char, levels = names(codec), labels = codec)

  return(recoded)

}
