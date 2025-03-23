#' @include accepted.R
NULL

#' Button widget
#'
#' @rdname Button
#' @export
jupyter.widget.Button <- R6Class("jupyter.widget.Button", inherit = jupyter.widget.DOMWidget,
  public = list(

    #' @param description description
    #' @param disabled is the Box disabled
    #' @param button_style "", "primary", "success", "info", "warning" or "danger"
    #' @param icon name of a font-awesome icon, see [fontawesome::fa()] or "" for no icon (default)
    #'
    #' @param style inherited from [jupyter.widgets.base::DOMWidget]. Must inherit from [jupyter.widget.ButtonStyle]
    #' @param ... See [jupyter.widgets.base::DOMWidget]
    #' @param error_call see [rlang::args_error_context()]
    #'
    #' @return a new `jupyter.widget.Widget` object
    initialize = function(
      # Button
      description = "Click Me",
      disabled = FALSE,
      button_style = "",
      icon = "",

      # DOM Widget
      style = ButtonStyle(),

      ...,
      error_call = caller_env()
    ) {
      # set initial state
      private$state_ <- update_list(private$state_,
        description  = unbox(ensure(description, is.string)),
        disabled     = unbox(ensure(disabled, rlang::is_scalar_logical)),
        button_style = unbox(arg_match_or_empty(button_style, values = accepted_button_style, error_call = error_call)),
        icon         = unbox(arg_match_or_empty(icon, values = fa_metadata()$icon_names, error_call = error_call))
      )

      super$initialize(
        # DOMWidget
        style   = ensure(style, inherits, "jupyter.widget.ButtonStyle"),

        # Widget
       `_model_module` = '@jupyter-widgets/controls',
       `_model_name` = "ButtonModel",
       `_view_module` = '@jupyter-widgets/controls',
       `_view_name` = "ButtonView",

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

    #' @title setup a handler for when the button is clicked
    #'
    #' @param handler handler function to call when the button is clicked
    on_click = function(handler = NULL) {
      private$handlers_[["custom/click"]] <- handler
    }
  ),

  active = list(
    #' @field description
    #' description
    description            = function(x) if (missing(x)) private$state_[["description"]] else self$update(description = unbox(x)),

    #' @field disabled
    #' disabled
    disabled               = function(x) if (missing(x)) private$state_[["disabled"]] else self$update(disabled = unbox(x)),

    #' @field button_style
    #' button style. "", "primary", "success", "info", "warning" or "danger"
    button_style           = function(x) if (missing(x)) private$state_[["button_style"]] else {
      self$update(button_style = unbox(arg_match_or_empty(x, values = accepted_button_style)))
    },

    #' @field icon
    #' name of a font-awesome icon, see [fontawesome::fa()] or "" for no icon (default)
    icon                   = function(x) if (missing(x)) private$state_[["icon"]] else {
      self$update(icon = unbox(arg_match_or_empty(x, fa_metadata()$icon_names)))
    }
  )
)

#' Button widget
#'
#' @param ... See constructor for `jupyter.widgets.Button`
#' @inheritParams rlang::args_error_context
#'
#' @return a [jupyter.widget.Button] object
#'
#' @export
Button <- factory(jupyter.widget.Button)

