BENMAP_ETHNICITY_LEVELS <- c(
  "N" = "Non-Hispanic",
  "H" = "Hispanic")

#' recode_BenMAP_ethnicity
#'
#' @param x (character) as in `BENMAP_ETHNICITY_LEVELS`
#' @param codec (character) named lookup
#' @return factor
#'
#' @export
recode_BenMAP_ethnicity <- function (
    x,
    codec = BENMAP_ETHNICITY_LEVELS
) {

  recoded <- factor(x, levels = names(codec), labels = codec)
  return(recoded)

}
