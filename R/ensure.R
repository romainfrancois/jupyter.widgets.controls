default_or <- function(default, fun) {
  function(x) {
    identical(x, default) || fun(x)
  }
}

null_or <- function(fun) {
  function(x) {
    is.null(x) || fun(x)
  }
}

ensure <- function(x, fun = assertthat::is.string, ..., msg = NULL) {
  assert_that(fun(x, ...), msg = msg)

  x
}
