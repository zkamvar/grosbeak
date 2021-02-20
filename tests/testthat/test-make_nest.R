test_that("flat to template nesting is possible", {
  
  skip_if_not_installed("jsonlite")
  payload <- paste0("Payload#", 0:6)
  template <- system.file("extdata", "template1.json", package = "grosbeak")
  expected <- system.file("extdata", "expected1.json", package = "grosbeak")
  expected <- jsonlite::read_json(expected)
  template <- jsonlite::read_json(template)
  out <- make_nest(payload, template, "Payload#")
  expect_equal(expected, out)

})
