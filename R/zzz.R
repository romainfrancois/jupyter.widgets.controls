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
accepted_text_decoration <- c("none", "underline", "overline", "line-through", "blink")

.onLoad <- function(libname, pkgname) {
  rlang::run_on_load()

  set_widget_state_check("jupyter.widget.Button", "icon"        , unbox_one_of(fa_metadata()$icon_names, allow_empty = TRUE))

  set_widget_state_check("jupyter.widget.ButtonStyle", "font_style", unbox_one_of(accepted_font_style, allow_null = TRUE))
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
