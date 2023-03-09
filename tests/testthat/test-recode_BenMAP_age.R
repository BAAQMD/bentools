test_that("recode_BenMAP_age_5yr() works", {

  x <- c(
    "75TO79",
    "35TO39",
    "85UP",
    "0TO0")

  result <- recode_BenMAP_age_5yr(x)
  expect_true(is.ordered(result))

  expect_equal(
    as.character(result),
    c("75 to 79", "35 to 39", "85 and up", "0"))

})
