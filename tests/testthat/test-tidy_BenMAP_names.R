test_that("tidy_BenMAP_names (row and col)", {

  expected <- c("BM_row", "BM_col")

  df <- tibble(Col = 1:3, Row = 1:3)
  expect_setequal(names(tidy_BenMAP_names(df)), expected)

  df <- tibble(ROW = 1:3, COL = 1:3)
  expect_setequal(names(tidy_BenMAP_names(df)), expected)

})


test_that("tidy_BenMAP_names (geoid)", {

  expected <- c("BM_geo_id")

  df <- tibble(GEOID10 = 1:3)
  expect_setequal(names(tidy_BenMAP_names(df)), expected)

  df <- tibble(GEOID = 1:3)
  expect_setequal(names(tidy_BenMAP_names(df)), expected)

})
