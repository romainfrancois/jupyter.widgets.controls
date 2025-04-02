check_state_children <- function(value, widget) {
  walk(value, \(kid){
    assert_that(inherits(kid, "jupyter.widget.DOMWidget"), msg = "All children must be DOM widgets")
  })
  widget$.__enclos_env__$private$children_ <- value
  map_chr(value, \(kid){
    glue("IPY_MODEL_{kid$comm$id}")
  })
}

check_any_or_number <- function(value, widget) {
  if (identical(value, "any")) {
    unbox("any")
  } else if (is_scalar_integer(value)) {
    unbox(value)
  } else {
    cli::cli_abort('{.arg value} must be a scalar integer or "any"')
  }
}

check_state_range_slider_value <- function(value, widget) {
  c(value[[1]], value[[2]])
}

accepted_font_weight <- c("normal", "bold", "lighter", "bolder")
check_state_font_weight <- function(value, widget) {
  if (is.null(value)) {
    NULL
  } else if (is.string(value)) {
     unbox(rlang::arg_match(value, values = accepted_font_weight))
  } else if (is.numeric(value) && value >= 100 && value <= 900) {
    unbox(as.character(round(value)))
  } else {
    cli::cli_abort(c(
      "{.arg value} is not supported.",
      i = "{.arg value} can be one of {.val {accepted_font_weight}}.",
      i = "or a number between 100 and 900."
    ))
  }
}

check_state_titles <- function(value, widget) {
  # TODO: check length consistency with children
  value
}
