#' @include Box-generated.R
NULL

jupyter.widget.Box$set("private", "children_", list())

# hack to put children first
formals_Box <- formals(Box)
formals(Box) <- rlang::pairlist2(
  children = formals_Box$children,
  !!!formals_Box[names(formals_Box) != "children"]
)
