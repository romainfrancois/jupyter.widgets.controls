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

        initialize = function(layout = Layout(), style = IntSliderStyle(), comm_description = "int slider model", ...) {
            super$initialize(
              layout = layout,
              style = style,
              comm_description = comm_description,
              ...
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

#' IntSlider model
#'
#' @param layout See [Layout()]
#' @param style See [IntSliderStyle()]
#' @param ... additional model parameters
#'
#' @export
IntSliderModel <- function(layout = Layout(), style = IntSliderStyle(), ...) {
  jupyter.widget.IntSliderModel$new(
    layout = layout,
    style = style,
    ...
  )
}

jupyter.widget.IntSlider <- R6Class("jupyter.widget.IntSlider", inherit = jupyter.widget.Widget,
    public = list(
        layout = NULL,
        style = NULL,
        model = NULL,

        initialize = function(layout = Layout(), style = IntSliderStyle(), ...) {
            self$layout <- layout
            self$style  <- style
            self$model  <- IntSliderModel(
              layout = self$layout,
              style = self$style,
              ...
            )
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
#' @inheritParams IntSliderModel
#'
#' @export
IntSlider <- function(layout = Layout(), style = IntSliderStyle(), ...) {
  jupyter.widget.IntSlider$new(
    layout = layout,
    style = style,
    ...
  )
}
