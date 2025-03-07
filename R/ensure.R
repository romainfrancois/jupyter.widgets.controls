ensure <- function(x, fun = assertthat::is.string, msg = NULL) {
  assert_that(fun(x), msg = msg)

  x
}
