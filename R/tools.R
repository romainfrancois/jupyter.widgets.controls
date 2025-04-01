reformals <- function(fun, names, error_call = current_env()) {
  old <- formals(fun)
  all_names <- names(old)

  if (!all(names %in% all_names)) {
    fun_name <- deparse(substitute(fun))
    not <- names[!names %in% all_names]

    cli::cli_abort(call = error_call, c(
      "All names must be in formals({fun_name}).",
      x = "There are not: {.val {not}}"
    ))
  }

  formals(fun) <- pairlist2(
    !!!old[names],
    !!!old[setdiff(all_names, names)]
  )

  fun
}
