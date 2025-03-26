reformals <- function(fun, names) {
  old <- formals(fun)
  all_names <- names(old)

  formals(fun) <- pairlist2(
    !!!old[names],
    !!!old[setdiff(all_names, names)]
  )

  fun
}
