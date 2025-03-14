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

arg_match_or_empty <- function(x, values, ..., error_arg = caller_arg(arg), error_call = caller_env()) {
  if (identical(x, "")) "" else {
    rlang::arg_match(x, values = values, ..., error_arg = error_arg, error_call = error_call)
  }
}

ensure <- function(x, fun = assertthat::is.string, ..., msg = NULL) {
  assert_that(fun(x, ...), msg = msg)

  x
}
