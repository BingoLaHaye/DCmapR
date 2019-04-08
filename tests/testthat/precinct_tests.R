context("get_Precinct Test")
library(DCmapR)
test_that("When dataframe is called it produces one", {
  expect_is(get_Precinct(dataframe = TRUE), "data.frame")
  expect_is(get_Precinct(dataframe = FALSE), "SpatialPolygonsDataFrame")
  expect_is(get_Precinct(), "data.frame")
})
test_that("When people put random stuff it throws an error", {
  expect_error(get_Precinct(mtcars))
  expect_error(get_Precinct(dataframe = FALSE, mtcars))
  expect_error(get_Precinct(dataframe = FALSE, 2))
})
