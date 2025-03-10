jupyter.widget.IntSliderStyle <- R6Class("jupyter.widget.IntSliderStyle", inherit = jupyter.widget.Style,
    public = list(
      initialize = function(
        description_width = "",
        handle_color = NULL,
        ...,
        error_call = caller_env()
      ) {

        private$state_ <- update_list(private$state_,
          description_width = ensure(description_width, is.string),
          handle_color      = ensure(handle_color, null_or(is.string)),

          "_model_name" = "SliderStyleModel"
        )

        super$initialize(
          ...,
          comm_description = "slider style",
          error_call = error_call
        )
      }
    )
)

#' Style for the IntSlider widget
#'
#' @param description_width description width
#' @param handle_color css color for the handle
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @export
IntSliderStyle <- function(description_width = "", handle_color = NULL, ..., error_call = current_env()) {
  jupyter.widget.IntSliderStyle$new(
    description_width = description_width,
    handle_color = handle_color,
    ...,
    error_call = error_call
  )
}

jupyter.widget.IntSlider <- R6Class("jupyter.widget.IntSlider", inherit = jupyter.widget.DOMWidget,
  public = list(
    initialize = function(
      layout = Layout(),
      style = IntSliderStyle(),
      min = 0,
      max = 100,
      value = 0,
      behavior = c("drag-tap", "drag", "release", "throttle"),
      continuous_update = TRUE,
      description = "",
      description_allow_html = FALSE,
      disabled = FALSE,
      orientation = c("horizontal", "vertical"),
      readout = TRUE,
      readout_format = "d",
      ...,
      error_call = caller_env()
    ) {

      private$state_ <- update_list(private$state_,
        "_view_name" = "IntSliderView",
        "_model_name" = "IntSliderModel"
      )

      super$initialize(
        layout = layout,
        style = style,
        ...,
        error_call = error_call
      )
    },

    mime_bundle = function() {
      data <- list(
        "text/plain" = unbox(
          glue("<IntSlider id = {self$comm$id} value={self$state('value')})>")
        ),
        "application/vnd.jupyter.widget-view+json" = list(
          "version_major" = unbox(2L),
          "version_minor" = unbox(0L),
          "model_id" = unbox(self$comm$id)
        )
      )
      list(data = data, metadata = namedlist())
    },

    update = function(...) {
      self$model$update(...)
    }
  )
)

#' Int slider
#'
#' @param layout See [Layout()]
#' @param style See [IntSliderStyle()]
#'
#' @param min,max minimum and maximum value for the slider
#' @param step step
#' @param value initial value
#' @param behavior determines how the slider interacts with changes in its value
#' @param continuous_update if TRUE (default) the value updates as the slider is dragged, otherwise only when released
#' @param description descrption
#' @param description_allow_html whether the description allows html
#' @param disabled TRUE if the slider is disabled
#' @param orientation "horizontal" (default) or "vertical"
#' @param readout the value is displayed next to the slider if TRUE
#' @param readout_format with this format, e.g. ".2f"
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @export
IntSlider <- function(
    layout = Layout(),
    style = IntSliderStyle(),
    min = 0,
    max = 100,
    step = 1,
    value = 0,
    behavior = c("drag-tap", "drag", "release", "throttle"),
    continuous_update = TRUE,
    description = "",
    description_allow_html = FALSE,
    disabled = FALSE,
    orientation = c("horizontal", "vertical"),
    readout = TRUE,
    readout_format = "d",
    ...,
    error_call = current_env()
) {
  jupyter.widget.IntSlider$new(
    layout = layout,
    style = style,

    min = min,
    max = max,
    step = step,
    behavior = behavior,
    continuous_update = continuous_update,
    description = description,
    description_allow_html = description_allow_html,
    disabled = disabled,
    orientation = orientation,
    readout = readout,
    readout_format = readout_format,
    ...,
    error_call = error_call
  )
}
