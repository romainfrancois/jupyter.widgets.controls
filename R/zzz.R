#' @import jupyter.widgets.base
#' @import R6
#' @import glue
#' @import assertthat
#' @importFrom purrr map_chr walk
#' @importFrom rlang current_env caller_env arg_match pairlist2 is_scalar_integer run_on_load on_load
#' @importFrom fontawesome fa_metadata
#' @importFrom cli cli_abort
#' @importFrom jsonlite unbox
NULL

accepted_font_style <- c("normal", "italic", "oblique")
accepted_font_variant <- c("normal", "small-caps", "all-small-caps", "petite-caps", "all-petite-caps", "unicase", "titling-caps")
accepted_font_weight <- c("normal", "bold", "lighter", "bolder")
accepted_text_decoration <- c("none", "underline", "overline", "line-through", "blink")

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

.onLoad <- function(libname, pkgname) {
  rlang::run_on_load()

  set_widget_state_check("jupyter.widget.Button", "icon"        , unbox_one_of(fa_metadata()$icon_names, allow_empty = TRUE))

  set_widget_state_check("jupyter.widget.ButtonStyle", "font_style", unbox_one_of(accepted_font_style, allow_null = TRUE))
  set_widget_state_check("jupyter.widget.ButtonStyle", "font_variant", unbox_one_of(accepted_font_variant, allow_null = TRUE))
  set_widget_state_check("jupyter.widget.ButtonStyle", "font_weight", check_state_font_weight)
  set_widget_state_check("jupyter.widget.ButtonStyle", "text_decoration", unbox_one_of(accepted_text_decoration, allow_null = TRUE))

  set_widget_state_check("jupyter.widget.FloatRangeSlider", "value", check_state_range_slider_value)
  set_widget_state_check("jupyter.widget.IntRangeSlider"  , "value", check_state_range_slider_value)

  set_widget_state_check("jupyter.widget.Accordion", "titles", check_state_titles)

  set_widget_state_check("jupyter.widget.ColorsInput", "value"       , identity)
  set_widget_state_check("jupyter.widget.ColorsInput", "allowed_tags", identity)

  set_widget_state_check("jupyter.widget.DatePicker", "step", check_any_or_number)
  set_widget_state_check("jupyter.widget.Time"      , "step", check_any_or_number)
}
