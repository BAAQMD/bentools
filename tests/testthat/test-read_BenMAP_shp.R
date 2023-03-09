test_that("read_BenMAP_shp() works", {

  #
  # NOTE: this example data only covers ~1M residents
  #
  path <-
    system.file(
      "extdata",
      "CALPUFF_Chevron_block_20201130",
      "Combined_block_population",
      "combined_block_WGS1984_pop_2020.zip",
      package = "bentools")

  expect_true(file.exists(path))

  result <-
    read_BenMAP_shp(path)

  expect_s3_class(result, "sf")

  expect_true(
    all(c("BenMAP_col", "BenMAP_row") %in% names(result)))

})
