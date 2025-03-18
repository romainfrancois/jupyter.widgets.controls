jupyter.widget.Box <- R6Class("jupyter.widget.Box", inherit = jupyter.widget.DOMWidget,
  public = list(
    initialize = function(
      children = list(),
      box_style = "",
      description = "",
      disabled = FALSE,

      # DOM Widget
      layout = Layout(),
      style = NULL,
      tabbable = FALSE,
      tooltip = "",
      `_dom_classes` = character(),

      # Widget
      `_model_module` = '@jupyter-widgets/controls',
      `_model_module_version` = "2.0.0",
      `_model_name` = "BoxModel",
      `_view_module` = '@jupyter-widgets/controls',
      `_view_count` = NULL,
      `_view_module_version` = "2.0.0",
      `_view_name` = "BoxView",

      ...,
      error_call = caller_env()
    ) {

      private$children_ <- children

      # set initial state
      accepted_box_style <- c('success', 'info', 'warning', 'danger', 'primary')
      private$state_ <- update_list(private$state_,
        children     = map_chr(children, \(kid) {
          assert_that(inherits(kid, "jupyter.widget.DOMWidget"), msg = "All children must be DOM widgets")
          kid$comm$id
        }),
        box_style    = unbox(arg_match_or_empty(box_style, values = accepted_box_style, error_call = error_call)),
        description  = unbox(ensure(description, is.string)),
        disabled     = unbox(ensure(disabled, rlang::is_scalar_logical))
      )

      super$initialize(
        # DOMWidget
        layout  = layout,
        style   = style,
        tabbable = tabbable,
        tooltip = tooltip,
        `_dom_classes` = `_dom_classes`,

        # Widget
        `_model_module` = unbox(`_model_module`),
        `_model_module_version` = unbox(`_model_module_version`),
        `_model_name` = unbox(`_model_name`),
        `_view_module` = unbox(`_view_module`),
        `_view_count` = `_view_count`,
        `_view_module_version` = unbox(`_view_module_version`),
        `_view_name` = unbox(`_view_name`),

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
      private$children_ <- x
      self$update(children = x)
    }
  ),

  private = list(
    children_ = list()
  )
)


#' Box
#'
#' @param children children widgets
#' @param box_style box style. empty (default) or one of 'success', 'info', 'warning', 'danger', 'primary'.
#' @param description text description of the button
#' @param disabled TRUE if the Button is disabled
#'
#' @inheritParams DOMWidget
#'
#' @export
Box <- function(
    # Box
    children = list(),
    box_style = "",
    description = "Click Me",
    disabled = FALSE,

    # DOMWidget
    layout = Layout(),
    style = NULL,
    tabbable = FALSE,
    tooltip = "",
    `_dom_classes` = character(),

    # Widget
    `_model_module` = '@jupyter-widgets/controls',
    `_model_module_version` = "2.0.0",
    `_model_name` = "BoxModel",
    `_view_module` = '@jupyter-widgets/controls',
    `_view_count` = NULL,
    `_view_module_version` = "2.0.0",
    `_view_name` = "BoxView",

    ...,
    error_call = current_env()
  ) {

  jupyter.widget.Box$new(
    # Box
    children = children,
    box_style = box_style,
    description = description,
    disabled = disabled,

    # DOMWidget
    layout = layout,
    style = style,
    tabbable = tabbable,
    tooltip = tooltip,
    `_dom_classes` = `_dom_classes`,

    # Widget
    `_model_module` = unbox(`_model_module`),
    `_model_module_version` = unbox(`_model_module_version`),
    `_model_name` = unbox(`_model_name`),
    `_view_module` = unbox(`_view_module`),
    `_view_count` = `_view_count`,
    `_view_module_version` = unbox(`_view_module_version`),
    `_view_name` = unbox(`_view_name`),

    ...,
    error_call   = error_call
  )
}
