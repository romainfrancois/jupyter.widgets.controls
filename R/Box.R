jupyter.widget.Box <- R6Class("jupyter.widget.Box", inherit = jupyter.widget.DOMWidget,
  public = list(
    initialize = function(
      children = list(),
      layout = Layout(),

      box_style = "",
      description = "",
      disabled = FALSE,
      ...,
      error_call = caller_env()
    ) {

      # set initial state
      accepted_box_style <- c('success', 'info', 'warning', 'danger', 'primary')
      private$state_ <- update_list(private$state_,
        children     = map_chr(children, \(kid) {
          assert_that(inherits(kid, "jupyter.widget.DOMWidget"), msg = "All children must be DOM widgets")
          kid$comm$id
        }),
        box_style    = unbox(arg_match_or_empty(box_style, values = accepted_box_style, error_call = error_call)),
        description  = unbox(ensure(description, is.string)),
        disabled     = unbox(ensure(disabled, rlang::is_scalar_logical)),

        `_model_name` = unbox("BoxModel"),
        `_view_name`  = unbox("BoxView"),

        # TODO: these probably need to move higher up
        `_view_module` = unbox('@jupyter-widgets/controls'),
        `_view_module_version` = unbox("2.0.0")
      )

      super$initialize(
        layout = layout,
        ...,
        error_call = error_call
      )

    },

    mime_bundle = function() {
      data <- list(
        "text/plain" = unbox(
          glue("<Box id = {self$comm$id} >{length(private$children_)} children</Box>")
        ),
        "application/vnd.jupyter.widget-view+json" = list(
          "version_major" = unbox(2L),
          "version_minor" = unbox(0L),
          "model_id"      = unbox(self$comm$id)
        )
      )
      list(data = data, metadata = namedlist())
    }
  ),

  active = list(
    box_style   = function(x) if (missing(x)) private$state_[["box_style"]] else self$update(box_style = x),
    description = function(x) if (missing(x)) private$state_[["description"]] else self$update(description = x),
    disabled    = function(x) if (missing(x)) private$state_[["disabled"]] else self$update(disabled = x),
    children    = function(x) if (missing(x)) private$children_ else {
      private$children_ = x
      self$update(children = x)
    }
  ),

  private = list(
    children_ = list()
  )
)


#' Box
#'
#' @param layout a [Layout()]
#' @param box_style box style. empty (default) or one of 'success', 'info', 'warning', 'danger', 'primary'.
#' @param description text description of the button
#' @param disabled TRUE if the Button is disabled
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @export
Box <- function(
    children = list(),
    layout = Layout(),

    box_style = "",
    description = "Click Me",
    disabled = FALSE,
    ...,
    error_call = current_env()
  ) {

  jupyter.widget.Box$new(
    children = children,
    layout = layout,

    box_style = box_style,
    description = description,
    disabled = disabled,
    ...,
    error_call   = error_call
  )
}
