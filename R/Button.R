jupyter.widget.ButtonStyle <- R6Class("jupyter.widget.ButtonStyle", inherit = jupyter.widget.Style,

    public = list(
        initialize = function(...) {
            super$initialize("button style")
        }
    ),

    private = list(
        state_ = list(
            "_model_module" = "@jupyter-widgets/controls",
            "_model_module_version" = "2.0.0",
            "_model_name" = "ButtonStyleModel",
            "_view_count" = NULL,
            "_view_module" = "@jupyter-widgets/base",
            "_view_module_version" = "2.0.0",
            "_view_name" = "StyleView",
            "button_color" = NULL,
            "font_family" = NULL,
            "font_size" = NULL,
            "font_style" = NULL,
            "font_variant" = NULL,
            "font_weight" = NULL,
            "text_color" = NULL,
            "text_decoration" = NULL
        )
    )
)

#' Style for the Button widget
#'
#' @param ... currently unused
#'
#' @export
ButtonStyle <- function(...) {
  jupyter.widget.ButtonStyle$new(...)
}

jupyter.widget.ButtonModel <- R6Class("jupyter.widget.ButtonModel", inherit = jupyter.widget.Model,
  public = list(
    comm = NULL,

    initialize = function(
      layout           = Layout(),
      style            = ButtonStyle(),
      button_style     = c("", "primary", "success", "info", "warning", "danger"),
      description      = "Click Me",
      disabled         = FALSE,
      icon             = "",
      ...,
      error_call       = caller_env(),
      comm_description = "button model"
    ) {

      # set initial state
      private$state_$description  <- ensure(description, is.string)
      private$state_$disabled     <- ensure(disabled, rlang::is_scalar_logical)
      private$state_$button_style <- arg_match(button_style, error_call = error_call)
      private$state_$icon         <- if (identical(icon, "")) "" else {
        arg_match(icon, values = fa_metadata()$icon_names, error_call = error_call)
      }
      if (!is.null(tooltip)) {
        private$state_$tooltip  <- ensure(tooltip, is.string)
      }

      # jupyter.widget.Model
      super$initialize(
        layout           = layout,
        style            = style,
        ...,
        comm_description = comm_description,
        error_call       = error_call
      )

      # setup click handler
      self$on_custom(function(content) {
        if (content$event == "click") {
          click_handler <- private$handlers[["custom/click"]]
          if (!is.null(click_handler)) {
            click_handler()
          }
        }
      })
    },

    on_click = function(handler = NULL) {
      private$handlers[["custom/click"]] <- handler
    }
  ),

  private = list(
    state_ = list(
      "_dom_classes" = list(),
      "_model_module" = "@jupyter-widgets/controls",
      "_model_module_version" = "2.0.0",
      "_model_name" = "ButtonModel",
      "_view_count" = NULL,
      "_view_module" = "@jupyter-widgets/controls",
      "_view_module_version" = "2.0.0",
      "_view_name" = "ButtonView",
      "button_style" = "",
      "description" = "Click Me",
      "disabled" = FALSE,
      "icon" = "",
      "layout" = "IPY_MODEL_{layout}",
      "style" = "IPY_MODEL_{style}",
      "tabbable" = NULL,
      "tooltip" = NULL
    )
  )
)

#' Button Model
#'
#' @param layout a [Layout()]
#' @param style a [ButtonStyle()]
#' @param description text description of the button
#' @param disabled TRUE if the Button is disabled
#' @param button_style "", "primary", "success", "info", "warning" or "danger"
#' @param icon name of a font-awesome icon, see [fontawesome::fa()] or "" for no icon (default)
#' @param tooltip hover message for the button.
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @export
ButtonModel <- function(
    layout       = Layout(),
    style        = ButtonStyle(),
    description  = "Click Me",
    disabled     = FALSE,
    button_style = "",
    icon         = "",
    tooltip      = NULL,
    ...,
    error_call = current_env()
  ) {
  jupyter.widget.ButtonModel$new(
    layout       = layout,
    style        = style,
    description  = description,
    disabled     = disabled,
    button_style = button_style,
    icon         = icon,
    tooltip      = tooltip,
    ...,
    error_call   = error_call
  )
}

jupyter.widget.Button <- R6Class("jupyter.widget.Button", inherit = jupyter.widget.Widget,
  public = list(
    layout = NULL,
    style = NULL,
    model = NULL,

    initialize = function(layout = Layout(), style = ButtonStyle(), description = "Click Me", disabled = FALSE, button_style = "", icon = "", tooltip = NULL, ...) {
      self$layout <- layout
      self$style  <- style
      self$model  <- ButtonModel(
        layout = self$layout,
        style  = self$style,

        # model parameters
        description  = description,
        dsiabled     = disabled,
        button_style = button_style,
        icon         = icon,
        tooltip      = tooltip,
        ...
      )
    },

    mime_bundle = function() {
      data <- list(
        "text/plain" = unbox(
          glue("<Button id = {self$model$comm$id} >")
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

    on_click = function(handler) {
      self$model$on_click(handler)
    }
  )
)

#' Button
#'
#' @inheritParams ButtonModel
#'
#' @export
Button <- function(layout = Layout(), style = ButtonStyle(), description = "Click Me", disabled = FALSE, button_style = "", icon = "", tooltip = NULL, ...) {
  jupyter.widget.Button$new(
    layout = layout,
    style = style,
    description = description,
    disabled = disabled,
    button_style = button_style,
    icon = icon,
    tooltip = tooltip,
    ...
  )
}
