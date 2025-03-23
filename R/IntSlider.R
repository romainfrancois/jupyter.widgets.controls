#' @include accepted.R
NULL

#' Button widget
#'
#' @rdname Button
#' @export
jupyter.widget.IntSlider <- R6Class("jupyter.widget.IntSlider", inherit = jupyter.widget.DOMWidget,
  public = list(

    #' @param min minimum value for the slider
    #' @param max maximum value for the slider
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
    #' @param style inherited from [jupyter.widgets.base::DOMWidget]. Must be a [jupyter.widget.IntSliderStyle] object.
    #'
    #' @param ... forwarded to [jupyter.widgets.base::jupyter.widget.DOMWidget] constructor
    #' @param error_call see [rlang::args_error_context()]
    #'
    #' @return a new `jupyter.widget.IntSlider` widget
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
      style = IntSliderStyle(),

      ...,
      error_call = caller_env()
    ) {

      private$state_ <- update_list(private$state_,
        min = unbox(min),
        max = unbox(max),
        value = unbox(value),
        step = unbox(step),
        continuous_update = unbox(continuous_update),
        description = unbox(description),
        description_allow_html = unbox(description_allow_html),
        disabled = unbox(disabled),
        orientation = unbox(rlang::arg_match(orientation, values = accepted_orientation, error_call = error_call())),
        readout = unbox(readout),
        readout_format = unbox(readout_format)
      )

      super$initialize(
        # DOMWidget
        style    = ensure(style, inherits, "jupyter.widget.IntSliderStyle"),

        # Widget
        `_model_module` = '@jupyter-widgets/controls',
        `_model_name` = "IntSliderModel",
        `_view_module` = '@jupyter-widgets/controls',
        `_view_name` = "IntSliderView",

        ...,
        error_call = error_call
      )
    }
  ),

  active = list(

    #' @field min
    #' min value
    min                    = function(x) if (missing(x)) private$state_[["min"]] else self$update(min = unbox(x)),

    #' @field max
    #' max value
    max                    = function(x) if (missing(x)) private$state_[["max"]] else self$update(max = unbox(x)),

    #' @field value
    #' value
    value                  = function(x) if (missing(x)) private$state_[["value"]] else self$update(value = unbox(x)),

    #' @field step
    #' step
    step                   = function(x) if (missing(x)) private$state_[["step"]] else self$update(step = unbox(x)),

    #' @field continuous_update
    #' continuous update
    continuous_update      = function(x) if (missing(x)) private$state_[["continuous_update"]] else self$update(continuous_update = unbox(x)),

    #' @field description
    #' description
    description            = function(x) if (missing(x)) private$state_[["description"]] else self$update(description = unbox(x)),

    #' @field description_allow_html
    #' description_allow_html
    description_allow_html = function(x) if (missing(x)) private$state_[["description_allow_html"]] else self$update(description_allow_html = unbox(x)),

    #' @field disabled
    #' disabled
    disabled               = function(x) if (missing(x)) private$state_[["disabled"]] else self$update(disabled = unbox(x)),

    #' @field orientation
    #' orientation
    orientation            = function(x) if (missing(x)) private$state_[["orientation"]] else self$update(orientation = unbox(x)),

    #' @field readout
    #' readout
    readout                = function(x) if (missing(x)) private$state_[["readout"]] else self$update(readout = unbox(x)),

    #' @field readout_format
    #' readout format
    readout_format         = function(x) if (missing(x)) private$state_[["readout_format"]] else self$update(readout_format = unbox(x))
  )
)

#' IntSlider widget
#'
#' @param ... See constructor for `jupyter.widgets.IntSlider`
#' @inheritParams rlang::args_error_context
#'
#' @return a [jupyter.widget.IntSlider] object
#'
#' @export
IntSlider <- factory(jupyter.widget.IntSlider)
