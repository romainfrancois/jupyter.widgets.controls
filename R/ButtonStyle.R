#' @include accepted.R
#' @include ButtonStyle-generated.R
NULL

set_widget_state_check(jupyter.widget.ButtonStyle, "font_style", jupyter.widgets.base::unbox_one_of(accepted_font_style, allow_null = TRUE))
set_widget_state_check(jupyter.widget.ButtonStyle, "font_variant", jupyter.widgets.base::unbox_one_of(accepted_font_variant, allow_null = TRUE))
set_widget_state_check(jupyter.widget.ButtonStyle, "font_weight", function(value) {
  if (is.null(value)) {
    NULL
  } else if (is.string(value)) {
     unbox(rlang::arg_match(value, values = accepted_font_weight))
  } else if (is.numeric(value) && font_weight >= 100 && font_weight <= 900) {
    unbox(as.character(round(value)))
  } else {
    cli_abort(c(
      "{.arg value} is not supported.",
      i = "{.arg value} can be one of {.val {accepted_font_weight}}.",
      i = "or a number between 100 and 900."
    ), call = error_call)
  }
})
set_widget_state_check(jupyter.widget.ButtonStyle, "text_decoration", jupyter.widgets.base::unbox_one_of(accepted_text_decoration, allow_null = TRUE))
