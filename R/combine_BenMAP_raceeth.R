combine_BenMAP_raceeth <- function (
  race, 
  ethnicity,
  levels = c("White", "Hispanic", "Asian", "Black", "NatAmer"),
  verbose = getOption("verbose", default = TRUE)
) {
  
  msg <- function (...) if(isTRUE(verbose)) message("[combine_BenMAP_raceeth] ", ...)
  
  recoded <- 
    case_when(
      ethnicity == "Hispanic" ~ "Hispanic",
      TRUE ~ race)
  
  msg("setting levels: ", str_csv(levels))
  recoded <-
    factor(
      recoded,
      levels = levels)
  
  return(recoded)
  
}
