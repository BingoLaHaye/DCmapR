context(desc = "Checking the centroid functions")
test_that(desc = "if it produces the right centroid", {
  expect_is(get_centroid(Ward = TRUE), "data.frame")
  expect_is(get_centroid(Precinct = TRUE), "data.frame")
})
test_that(desc = "Make sure you can't have both in a function", {
  expect_error(get_centroid(Ward = TRUE, Precinct = TRUE))
  expect_error(get_centroid())
  expect_error(get_centroid(Precinct = 2))
})
