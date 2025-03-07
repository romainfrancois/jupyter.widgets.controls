null_or <- function(fun) {
  function(x) {
    is.null(x) || fun(x)
  }
}

ensure <- function(x, fun = assertthat::is.string, msg = NULL) {
  assert_that(fun(x), msg = msg)

  x
}
