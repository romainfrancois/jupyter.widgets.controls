#' Box widget
#'
#' @rdname Box
#' @export
jupyter.widget.Box <- R6Class("jupyter.widget.Box", inherit = jupyter.widget.DOMWidget,
  public = list(

    #' @param children list of children widget objects
    #' @param box_style box style
    #' @param description description
    #' @param disabled is the Box disabled
    #'
    #' @param ... See [jupyter.widgets.base::DOMWidget]
    #' @param error_call see [rlang::args_error_context()]
    #'
    #' @return a new `jupyter.widget.Widget` object
    initialize = function(
      children = list(),
      box_style = "",
      description = "",
      disabled = FALSE,

      ...,
      error_call = caller_env()
    ) {

      private$children_ <- children

      # set initial state
      accepted_box_style <- c('success', 'info', 'warning', 'danger', 'primary')
      private$state_ <- update_list(private$state_,
        children     = map_chr(children, \(kid) {
          assert_that(inherits(kid, "jupyter.widget.DOMWidget"), msg = "All children must be DOM widgets")
          glue("IPY_MODEL_{kid$comm$id}")
        }),
        box_style    = unbox(arg_match_or_empty(box_style, values = accepted_box_style, error_call = error_call)),
        description  = unbox(ensure(description, is.string)),
        disabled     = unbox(ensure(disabled, rlang::is_scalar_logical))
      )

      super$initialize(
        # Widget
        `_model_module` = '@jupyter-widgets/controls',
        `_model_name` = "BoxModel",
        `_view_module` = '@jupyter-widgets/controls',
        `_view_name` = "BoxView",

        ...,
        error_call = error_call
      )
    }
  ),

  active = list(

    #' @field box_style
    #' box style
    box_style   = function(x) if (missing(x)) private$state_[["box_style"]] else self$update(box_style = unbox(x)),

    #' @field description
    #' description
    description = function(x) if (missing(x)) private$state_[["description"]] else self$update(description = unbox(x)),

    #' @field disabled
    #' disabled
    disabled    = function(x) if (missing(x)) private$state_[["disabled"]] else self$update(disabled = unbox(x)),

    #' @field children
    #' children dom widgets
    children    = function(x) if (missing(x)) private$children_ else {
      private$children_ <- x
      self$update(children = map_chr(children, \(kid) glue("IPY_MODEL_{kid$comm$id}")))
    }
  ),

  private = list(
    children_ = list()
  )
)

#' Box widget
#'
#' @param ... See constructor for `jupyter.widgets.Box`
#' @inheritParams rlang::args_error_context
#'
#' @return a [jupyter.widget.Box] object
#'
#' @export
Box <- factory(jupyter.widgets.Box)
