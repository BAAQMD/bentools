BENMAP_RACE_LEVELS <- c(
  "W" = "White",
  "A" = "Asian",
  "B" = "Black",
  "N" = "NatAmer")

#' recode_BenMAP_ethnicity
#'
#' @param x (character) as in `BENMAP_RACE_LEVELS`
#' @param codec (character) named lookup
#' @return factor
#'
#' @export
recode_BenMAP_race <- function (
    x,
    codec = BENMAP_RACE_LEVELS
) {

  recoded <- factor(x, levels = names(codec), labels = codec)
  return(recoded)

}
