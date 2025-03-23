#' IntSliderStyle widget
#'
#' @rdname IntSliderStyle
#' @export
jupyter.widget.IntSliderStyle <- R6Class("jupyter.widget.IntSliderStyle", inherit = jupyter.widget.Style,
  public = list(

    #' @param description_width description width
    #' @param handle_color css color for the handle
    #'
    #' @param ... See [jupyter.widgets.base::Style]
    #' @param error_call see [rlang::args_error_context()]
    initialize = function(
      # IntSliderStyle
      description_width = "",
      handle_color = NULL,

      ...,
      error_call = caller_env()
    ) {

      private$state_ <- update_list(private$state_,
        description_width = unbox(ensure(description_width, is.string)),
        handle_color      = unbox(ensure(handle_color, null_or(is.string)))
      )

      super$initialize(
        # Widget
        `_model_module` = '@jupyter-widgets/controls',
        `_model_name` = "IntSliderModel",
        `_view_module` = '@jupyter-widgets/base',
        `_view_name` = "IntSliderView",

        ...,
        error_call = error_call
      )
    }
  ),

  active = list(
    #' @field description_width
    #' description color
    description_width = function(x) if (missing(x)) private$state_[["description_width"]] else self$update(description_width = unbox(x)),

    #' @field handle_color
    #' handle color
    handle_color      = function(x) if (missing(x)) private$state_[["handle_color"]] else self$update(handle_color = unbox(x))
  )
)

#' IntSliderStyle widget
#'
#' @param ... See constructor for `jupyter.widgets.IntSliderStyle`
#' @inheritParams rlang::args_error_context
#'
#' @return a [jupyter.widget.IntSliderStyle] object
#'
#' @export
IntSliderStyle <- factory(jupyter.widget.IntSliderStyle)
