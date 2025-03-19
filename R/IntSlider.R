#' Int slider
#'
#' @param min,max minimum and maximum value for the slider
#' @param step step
#' @param value initial value
#' @param continuous_update if TRUE (default) the value updates as the slider is dragged, otherwise only when released
#' @param description descrption
#' @param description_allow_html whether the description allows html
#' @param disabled TRUE if the slider is disabled
#' @param orientation "horizontal" (default) or "vertical"
#' @param readout the value is displayed next to the slider if TRUE
#' @param readout_format with this format, e.g. ".2f"
#'
#' @inheritParams jupyter.widgets.base::DOMWidget
#'
#' @export
IntSlider <- function(
    min = 0,
    max = 100,
    step = 1,
    value = 0,
    continuous_update = TRUE,
    description = "",
    description_allow_html = FALSE,
    disabled = FALSE,
    orientation = "horizontal",
    readout = TRUE,
    readout_format = "d",

    # DOMWidget
    layout = Layout(),
    style = IntSliderStyle(),
    tabbable = FALSE,
    tooltip = "",

    ...,
    error_call = current_env()
) {
  jupyter.widget.IntSlider$new(
    # IntSlider
    min = min,
    max = max,
    step = step,
    continuous_update = continuous_update,
    description = description,
    description_allow_html = description_allow_html,
    disabled = disabled,
    orientation = orientation,
    readout = readout,
    readout_format = readout_format,

    # DOMWidget
    layout = layout,
    style = style,
    tabbable = tabbable,
    tooltip = tooltip,

    ...,
    error_call = current_env()
  )
}

jupyter.widget.IntSlider <- R6Class("jupyter.widget.IntSlider", inherit = jupyter.widget.DOMWidget,
  public = list(
    initialize = function(
      min = 0,
      max = 100,
      value = 0,
      step = 1,
      continuous_update = TRUE,
      description = "",
      description_allow_html = FALSE,
      disabled = FALSE,
      orientation = "horizontal",
      readout = TRUE,
      readout_format = "d",

      # DOM Widget
      layout = Layout(),
      style = IntSliderStyle(),
      tabbable = FALSE,
      tooltip = "",
      `_dom_classes` = character(),

      ...,
      error_call = caller_env()
    ) {

      allowed_orientation <- c("horizontal", "vertical")
      private$state_ <- update_list(private$state_,
        min = unbox(min),
        max = unbox(max),
        value = unbox(value),
        step = unbox(step),
        continuous_update = unbox(continuous_update),
        description = unbox(description),
        description_allow_html = unbox(description_allow_html),
        disabled = unbox(disabled),
        orientation = unbox(rlang::arg_match(orientation, values = allowed_orientation, error_call = error_call())),
        readout = unbox(readout),
        readout_format = unbox(readout_format)
      )

      super$initialize(
        # DOMWidget
        layout   = layout,
        style    = ensure(style, inherits, "jupyter.widget.IntSliderStyle"),
        tabbable = tabbable,
        tooltip  = tooltip,
        `_dom_classes` = `_dom_classes`,

        # Widget
        `_model_module` = '@jupyter-widgets/controls',
        `_model_module_version` = "2.0.0",
        `_model_name` = "IntSliderModel",
        `_view_module` = '@jupyter-widgets/controls',
        `_view_count` = NULL,
        `_view_module_version` = "2.0.0",
        `_view_name` = "IntSliderView",

        ...,
        error_call = error_call
      )
    }
  ),

  active = list(
    min                    = function(x) if (missing(x)) private$state_[["min"]] else self$update(min = x),
    max                    = function(x) if (missing(x)) private$state_[["max"]] else self$update(max = x),
    value                  = function(x) if (missing(x)) private$state_[["value"]] else self$update(value = x),
    step                   = function(x) if (missing(x)) private$state_[["step"]] else self$update(step = x),
    continuous_update      = function(x) if (missing(x)) private$state_[["continuous_update"]] else self$update(continuous_update = x),
    description            = function(x) if (missing(x)) private$state_[["description"]] else self$update(description = x),
    description_allow_html = function(x) if (missing(x)) private$state_[["description_allow_html"]] else self$update(description_allow_html = x),
    disabled               = function(x) if (missing(x)) private$state_[["disabled"]] else self$update(disabled = x),
    orientation            = function(x) if (missing(x)) private$state_[["orientation"]] else self$update(orientation = x),
    readout                = function(x) if (missing(x)) private$state_[["readout"]] else self$update(readout = x),
    readout_format         = function(x) if (missing(x)) private$state_[["readout_format"]] else self$update(readout_format = x)
  )
)
