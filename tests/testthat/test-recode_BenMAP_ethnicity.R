test_that("recode_BenMAP_ethnicity() works", {

  result <- recode_BenMAP_ethnicity(c("H", "N"))
  expect_true(is.factor(result))
  expect_setequal(levels(result), c("Hispanic", "Non-Hispanic"))
  expect_equal(as.character(result), c("Hispanic", "Non-Hispanic"))

})
