ensure <- function(x, fun, env = parent.frame(), msg = NULL) {
  assert_that(fun(x), env = env, msg = msg)

  x
}
