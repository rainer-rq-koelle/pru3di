test_that("Say hi to friends", {
  expect_equal(xhello("Rainer"), "Greetings Rainer")
  expect_error(xhello(42))
})
