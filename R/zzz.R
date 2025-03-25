#' @import jupyter.widgets.base
#' @import R6
#' @import glue
#' @import assertthat
#' @importFrom purrr map_chr walk
#' @importFrom rlang current_env caller_env arg_match
#' @importFrom fontawesome fa_metadata
#' @importFrom cli cli_abort
#' @importFrom jsonlite unbox
NULL

.onLoad <- function(libname, pkgname) {
  set_widget_state_check("jupyter.widget.Button", "button_style", jupyter.widgets.base::unbox_one_of(accepted_button_style, allow_empty = TRUE))
  set_widget_state_check("jupyter.widget.Button", "icon"        , jupyter.widgets.base::unbox_one_of(fa_metadata()$icon_names, allow_empty = TRUE))

  set_widget_state_check("jupyter.widget.ButtonStyle", "font_style", jupyter.widgets.base::unbox_one_of(accepted_font_style, allow_null = TRUE))
  set_widget_state_check("jupyter.widget.ButtonStyle", "font_variant", jupyter.widgets.base::unbox_one_of(accepted_font_variant, allow_null = TRUE))
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
  set_widget_state_check("jupyter.widget.ButtonStyle", "text_decoration", jupyter.widgets.base::unbox_one_of(accepted_text_decoration, allow_null = TRUE))

  set_widget_state_check("jupyter.widget.IntSlider", "orientation", jupyter.widgets.base::unbox_one_of(accepted_orientation))

  set_widget_state_check("jupyter.widget.Box", "children", function(value, widget) {
    walk(value, \(kid){
      assert_that(inherits(kid, "jupyter.widget.DOMWidget"), msg = "All children must be DOM widgets")
    })
    widget$.__enclos_env__$private$children_ <- value
    map_chr(value, \(kid){
      glue("IPY_MODEL_{kid$comm$id}")
    })
  })
}
