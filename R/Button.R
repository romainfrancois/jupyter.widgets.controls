#' Button
#'
#' @param description text description of the button
#' @param disabled TRUE if the Button is disabled
#' @param button_style "", "primary", "success", "info", "warning" or "danger"
#' @param icon name of a font-awesome icon, see [fontawesome::fa()] or "" for no icon (default)
#'
#' @inheritParams jupyter.widgets.base::DOMWidget
#'
#' @export
Button <- function(
    # Button
    description = "Click Me",
    disabled = FALSE,
    button_style = "",
    icon = "",

    # DOMWidget
    layout = Layout(),
    style = ButtonStyle(),
    tabbable = FALSE,
    tooltip = "",

    # Widget
    `_model_module` = '@jupyter-widgets/controls',
    `_model_module_version` = "2.0.0",
    `_model_name` = "ButtonModel",
    `_view_module` = '@jupyter-widgets/controls',
    `_view_count` = NULL,
    `_view_module_version` = "2.0.0",
    `_view_name` = "ButtonView",

    ...,
    error_call = current_env()
  ) {

  jupyter.widget.Button$new(
    # Button
    description  = description,
    disabled     = disabled,
    button_style = button_style,
    icon         = icon,

    # DOMWidget
    layout = layout,
    style = style,
    tabbable = tabbable,
    tooltip = tooltip,

    # Widget
    `_model_module` = `_model_module`,
    `_model_module_version` = `_model_module_version`,
    `_model_name` = `_model_name`,
    `_view_module` = `_view_module`,
    `_view_count` = `_view_count`,
    `_view_module_version` = `_view_module_version`,
    `_view_name` = `_view_name`,

    ...,
    error_call   = error_call
  )
}

jupyter.widget.Button <- R6Class("jupyter.widget.Button", inherit = jupyter.widget.DOMWidget,
  public = list(
    initialize = function(
      description = "Click Me",
      disabled = FALSE,
      button_style = "",
      icon = "",

      # DOM Widget
      layout = Layout(),
      style = ButtonStyle(),
      tabbable = FALSE,
      tooltip = "",
      `_dom_classes` = character(),

      # Widget
      `_model_module` = '@jupyter-widgets/controls',
      `_model_module_version` = "2.0.0",
      `_model_name` = "ButtonModel",
      `_view_module` = '@jupyter-widgets/controls',
      `_view_count` = NULL,
      `_view_module_version` = "2.0.0",
      `_view_name` = "ButtonView",

      ...,
      error_call = caller_env()
    ) {
      # set initial state
      private$state_ <- update_list(private$state_,
        description  = unbox(ensure(description, is.string)),
        disabled     = unbox(ensure(disabled, rlang::is_scalar_logical)),
        button_style = unbox(rlang::arg_match(button_style, error_call = error_call)),
        icon         = if (identical(icon, "")) "" else {
          unbox(arg_match(icon, values = fa_metadata()$icon_names, error_call = error_call))
        }
      )

      super$initialize(
        # DOMWidget
        layout  = layout,
        style   = ensure(style, inherits, "jupyter.widget.ButtonStyle"),
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

      self$on_custom(
        function(content) {
          if (content$event == "click") {
            private$handle("custom/click")
          }
        }
      )
    },

    on_click = function(handler = NULL) {
      private$handlers_[["custom/click"]] <- handler
    }
  ),

  active = list(
    description            = function(x) if (missing(x)) private$state_[["description"]] else self$update(description = unbox(x)),
    disabled               = function(x) if (missing(x)) private$state_[["disabled"]] else self$update(disabled = unbox(x)),
    button_style           = function(x) if (missing(x)) private$state_[["button_style"]] else self$update(button_style = unbox(x)),
    icon                   = function(x) if (missing(x)) private$state_[["icon"]] else self$update(icon = unbox(x))
  )
)
