recode_BenMAP_sex <- 
  purrr::partial(
    dplyr::recode, 
    "M" = "Male", 
    "F" = "Female")
