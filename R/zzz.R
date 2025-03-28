#' @import jupyter.widgets.base
#' @import R6
#' @import glue
#' @import assertthat
#' @importFrom purrr map_chr walk
#' @importFrom rlang current_env caller_env arg_match pairlist2 is_scalar_integer
#' @importFrom fontawesome fa_metadata
#' @importFrom cli cli_abort
#' @importFrom jsonlite unbox
NULL

accepted_button_style <- c("primary", "success", "info", "warning", "danger")
accepted_font_style <- c("normal", "italic", "oblique")
accepted_font_variant <- c("normal", "small-caps", "all-small-caps", "petite-caps", "all-petite-caps", "unicase", "titling-caps")
accepted_font_weight <- c("normal", "bold", "lighter", "bolder")
accepted_text_decoration <- c("none", "underline", "overline", "line-through", "blink")
accepted_orientation <- c("horizontal", "vertical")

check_state_children <- function(value, widget) {
  walk(value, \(kid){
    assert_that(inherits(kid, "jupyter.widget.DOMWidget"), msg = "All children must be DOM widgets")
  })
  widget$.__enclos_env__$private$children_ <- value
  map_chr(value, \(kid){
    glue("IPY_MODEL_{kid$comm$id}")
  })
}

.onLoad <- function(libname, pkgname) {
  set_widget_state_check("jupyter.widget.Button", "button_style", unbox_one_of(accepted_button_style, allow_empty = TRUE))
  set_widget_state_check("jupyter.widget.Button", "icon"        , unbox_one_of(fa_metadata()$icon_names, allow_empty = TRUE))

  set_widget_state_check("jupyter.widget.ButtonStyle", "font_style", unbox_one_of(accepted_font_style, allow_null = TRUE))
  set_widget_state_check("jupyter.widget.ButtonStyle", "font_variant", unbox_one_of(accepted_font_variant, allow_null = TRUE))
  set_widget_state_check("jupyter.widget.ButtonStyle", "font_weight", function(value) {
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
  })
  set_widget_state_check("jupyter.widget.ButtonStyle", "text_decoration", unbox_one_of(accepted_text_decoration, allow_null = TRUE))

  set_widget_state_check("jupyter.widget.IntSlider", "orientation", unbox_one_of(accepted_orientation))

  set_widget_state_check("jupyter.widget.Box", "children", check_state_children)

  set_widget_state_check("jupyter.widget.Accordion", "children", check_state_children)

  set_widget_state_check("jupyter.widget.Accordion", "titles", function(value, widget) {
    # TODO: check length consistency with children
    value
  })

  set_widget_state_check("jupyter.widget.ColorsInput", "value", identity)
  set_widget_state_check("jupyter.widget.ColorsInput", "allowed_tags", identity)

  set_widget_state_check("jupyter.widget.DatePicker", "step", function(value) {
    if (identical(value, "any")) {
      unbox("any")
    } else if (is_scalar_integer(value)) {
      unbox(value)
    } else {
      cli::cli_abort('{.arg value} must be a scalar integer or "any"')
    }
  })

  set_widget_state_check("jupyter.widget.FloatRangeSlider", "value", function(value) {
    c(value[[1]], value[[2]])
  })

  set_widget_state_check("jupyter.widget.IntRangeSlider", "value", function(value) {
    c(value[[1]], value[[2]])
  })

}
