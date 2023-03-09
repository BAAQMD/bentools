test_that("recode_BenMAP_race() works", {

  result <- recode_BenMAP_race(c("B", "N", "A", "W"))
  expect_true(is.factor(result))
  expect_setequal(levels(result), c("White", "Asian", "Black", "NatAmer"))
  expect_equal(as.character(result), c("Black", "NatAmer", "Asian", "White"))

})
