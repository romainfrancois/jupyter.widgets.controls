jupyter.widget.DOMWidget <- R6Class("jupyter.widget.DOMWidget",
  inherit = jupyter.widget.CoreWidget,

  public = list(
    initialize = function(
      layout = Layout(),
      style = NULL,
      tabbable = FALSE,
      tooltip = "",
      ...,
      comm_description = "",
      error_call = caller_env()
    ) {
      private$layout_ <- layout
      private$style_  <- style

      private$state_ <- update_list(private$state_,
        tabbable = unbox(isTRUE(tabbable)),
        tooltip  = unbox(ensure(tooltip, null_or(is.string))),
        layout   = unbox(glue("IPY_MODEL_{layout$comm$id}"))
      )

      if (!is.null(style)) {
        private$state_$style <- unbox(glue("IPY_MODEL_{style$comm$id}"))
      }

      super$initialize(
        ...,
        comm_description = comm_description,
        error_call = error_call
      )
    }
  ),

  active = list(
    layout = function() layout_,
    style  = function() style_,

    tabbable = function(x) if (missing(x)) private$state_[["tabbable"]] else self$update(tabbable = x),
    tooltip  = function(x) if (missing(x)) private$state_[["tooltip"]] else self$update(tooltip = x)
  ),

  private = list(
    layout_ = NULL,
    style_  = NULL
  )
)

#' A DOM Widget
#'
#' @param layout a [Layout()]
#' @param style a [Style()]
#'
#' @param tabbable is the widget tabbable
#' @param tooltip tooltip
#'
#' @inheritParams CoreWidget
#'
#' @export
DOMWidget <- function(
    # COMWidget
    layout = Layout(),
    style = NULL,
    tabbable = FALSE,
    tooltip = "",

    # CoreWidget
    `_model_module` = "@jupyter-widgets/controls",
    `_model_module_version` = "2.0.0",

    ...,
    error_call = caller_env()
  ) {
  jupyter.widget.DOMWidget$new(
    # DOMWidget
    layout = layout,
    style = style,
    tabbable = tabbable,
    tooltip = tooltip,

    # CoreWidget
    `_model_module` = `_model_module`,
    `_model_module_version` = `_model_module_version`,

    # Widget
    ...,
    error_call = error_call
  )
}
