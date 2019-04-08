context("get_Ward Test")
library(DCmapR)
test_that("When dataframe is called it produces one", {
  expect_is(get_Ward(dataframe = TRUE), "data.frame")
  expect_is(get_Ward(dataframe = FALSE), "SpatialPolygonsDataFrame")
  expect_is(get_Ward(), "data.frame")
})
test_that("When people put random stuff it throws an error", {
  expect_error(get_Ward(mtcars))
  expect_error(get_Ward(dataframe = FALSE, mtcars))
  expect_error(get_Ward(dataframe = FALSE, 2))
})
