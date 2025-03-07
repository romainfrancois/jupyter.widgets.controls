jupyter.widget.IntSliderStyle <- R6Class("jupyter.widget.IntSliderStyle", inherit = jupyter.widget.Style,
    public = list(
      initialize = function(
        description_width = "",
        handle_color = NULL,
        ...,
        error_call = caller_env()
      ) {
        private$state_$description_width <- ensure(description_width, is.string)
        private$state_$handle_color <- ensure(handle_color, null_or(is.string))

        super$initialize(
          ...,
          comm_description = "slider style",
          error_call = error_call
        )
      }
    ),

    private = list(
      state_ = list(
        "_model_module" = "@jupyter-widgets/controls",
        "_model_module_version" = "2.0.0",
        "_model_name" = "SliderStyleModel",
        "_view_count" = NULL,
        "_view_module" = "@jupyter-widgets/base",
        "_view_module_version" = "2.0.0",
        "_view_name" = "StyleView",
        "description_width" = "",
        "handle_color" = NULL
      )
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

jupyter.widget.IntSliderModel <- R6Class("jupyter.widget.IntSliderModel", inherit = jupyter.widget.Model,
    public = list(
        comm = NULL,

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
          tooltip = NULL,
          ...,
          comm_description = "int slider model",
          error_call = caller_env()
        ) {

            private$state_$min   <- ensure(min  , default_or(0, is_number))
            private$state_$max   <- ensure(max  , default_or(100, is_number))
            private$state_$step  <- ensure(step , default_or(1, is_number))
            private$state_$value <- ensure(value, default_or(0, is_number))

            private$state_$behavior <- rlang::arg_match(behavior, error_call = error_call)
            private$state_$continuous_update <- is_true(continuous_update)
            private$state_$description <- ensure(description, is.string)
            private$state_$description_allow_html <- is_true(description_allow_html)
            private$state_$disabled <- is_true(disabled)
            private$state_$orientation <- rlang::arg_match(orientation, error_call = error_call)
            private$state_$readout <- is_true(readout)
            private$state_$tooltip <- ensure(tooltip, null_or(is.string))

            super$initialize(
              layout = layout,
              style = style,
              ...,
              comm_description = comm_description,
              error_call = error_call
            )
        }
    ),

    private = list(
        state_ = list(
            "_dom_classes" = list(),
            "_model_module" = "@jupyter-widgets/controls",
            "_model_module_version" = "2.0.0",
            "_model_name" = "IntSliderModel",
            "_view_count" = NULL,
            "_view_module" = "@jupyter-widgets/controls",
            "_view_module_version" = "2.0.0",
            "_view_name" = "IntSliderView",
            "behavior" = "drag-tap",
            "continuous_update" = TRUE,
            "description" = "",
            "description_allow_html" = FALSE,
            "disabled" = FALSE,
            "layout" = "IPY_MODEL_{layout$id}",
            "max" = 100,
            "min" = 0,
            "orientation" = "horizontal",
            "readout" = TRUE,
            "readout_format" = "d",
            "step" = 1,
            "style" = "IPY_MODEL_{style$id}",
            "tabbable" = NULL,
            "tooltip" = NULL,
            "value" = 0
        )
    )
)

jupyter.widget.IntSlider <- R6Class("jupyter.widget.IntSlider", inherit = jupyter.widget.Widget,
    public = list(
        layout = NULL,
        style = NULL,
        model = NULL,

        initialize = function(
          layout = Layout(),
          style = IntSliderStyle(),
          model = IntSliderModel(layout = layout, style = style),
          ...,
          error_call = caller_env()
        ) {
            self$layout <- layout
            self$style  <- style
            self$model  <- model

            super$initialize(..., error_call = error_call)
        },

        mime_bundle = function() {
            data <- list(
                "text/plain" = unbox(
                    glue("<IntSlider id = {self$model$comm$id} value={self$model$state('value')})>")
                ),
                "application/vnd.jupyter.widget-view+json" = list(
                    "version_major" = unbox(2L),
                    "version_minor" = unbox(0L),
                    "model_id" = unbox(self$model$comm$id)
                )
            )
            list(data = data, metadata = namedlist())
        },

        state = function(what) {
            self$model$state(what)
        },

        on_update = function(handler) {
            self$model$on_update(handler)
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
  model <- jupyter.widget.IntSliderModel$new(
    layout = layout,
    style  = style,

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
  jupyter.widget.IntSlider$new(
    layout = layout,
    style = style,
    model = model
  )
}
