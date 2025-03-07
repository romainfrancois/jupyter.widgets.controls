jupyter.widget.ButtonStyle <- R6Class("jupyter.widget.ButtonStyle", inherit = jupyter.widget.Style,

    public = list(
      initialize = function(
        button_color = NULL,
        font_family = NULL,
        font_size = NULL,
        font_style = NULL,
        font_variant = NULL,
        font_weight = NULL,
        text_color = NULL,
        text_decoration = NULL,
        ...,
        comm_description = "button style",
        error_call = caller_env()
      ) {

        if (!is.null(button_color)) {
          private$state_$button_color  <- ensure(button_color, is.string)
        }
        if (!is.null(font_family)) {
          private$state_$font_family  <- ensure(font_family, is.string)
        }
        if (!is.null(font_size)) {
          private$state_$font_size  <- ensure(font_size, is.string)
        }
        if (!is.null(font_style)) {
          accepted_font_style <- c("normal", "italic", "oblique")
          private$state_$font_style  <- rlang::arg_match(font_style, values = accepted_font_style, error_call = error_call)
        }
        if (!is.null(font_variant)) {
          accepted_font_variant <- c("normal", "small-caps", "all-small-caps", "petite-caps", "all-petite-caps", "unicase", "titling-caps")
          private$state_$font_variant  <- rlang::arg_match(font_variant, values = accepted_font_variant, error_call = error_call)
        }
        if (!is.null(font_weight)) {
          accepted_font_weight <- c("normal", "bold", "lighter", "bolder")
          if (is.string(font_weight)) {
            private$state_$font_weight<- rlang::arg_match(font_weight, values = accepted_font_weight, error_call = error_call)
          } else if (is.numeric(font_weight) && font_weight >= 100 && font_weight <= 900) {
            private$state_$font_weight <- as.character(round(font_weight))
          } else {
            cli_abort(c(
              "{.arg font_weight} is not supported.",
              i = "{.arg font_weight} can be one of {.val {accepted_font_weight}}.",
              i = "or a number between 100 and 900."
            ), call = error_call)
          }
        }
        if (!is.null(text_color)) {
          private$state_$text_color  <- ensure(text_color, is.string)
        }
        if (!is.null(text_decoration)) {
          accepted_text_decoration <- c("none", "underline", "overline", "line-through", "blink")
          private$state_$text_decoration  <- rlang::arg_match(text_decoration, values = accepted_text_decoration, error_call = error_call)
        }

        super$initialize(
          comm_description = "button style",
          error_call = error_call
        )
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
#' Configure the appearance of a [Button()]
#'
#' @param button_color A valid css color, e.g. "red" or "#ff0000"
#' @param font_family css "font-family" value, e.g. "monospace", "Times New Roman", "Georgia, 'Times New Roman', serif", ...
#' @param font_size css "font-size" value, e.g. "small", "large", "16px", "2em", "80%"
#' @param font_style "normal", "italic" or "oblique"
#' @param font_variant text formatting variations, e.g. "normal", "small-caps", ...
#' @param font_weight boldness of the text, either one of "normal", "bold", "lighter", and "bolder" or a number between 100 and 900
#' @param text_color A valid css color for the text of the Button.
#' @param text_decoration text styling effects, e.g. "underline, "overline", "line-through" or "blink"
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @export
ButtonStyle <- function(
    button_color = NULL,
    font_family = NULL,
    font_size = NULL,
    font_style = NULL,
    font_variant = NULL,
    font_weight = NULL,
    text_color = NULL,
    text_decoration = NULL,
    ...,
    error_call = current_env()
) {
  jupyter.widget.ButtonStyle$new(
    button_color    = button_color,
    font_family     = font_family,
    font_size       = font_size,
    font_style      = font_style,
    font_variant    = font_variant,
    font_weight     = font_weight,
    text_color      = text_color,
    text_decoration = text_decoration,
    ...,
    error_call = error_call
  )
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
      tooltip          = NULL,
      ...,
      error_call       = caller_env(),
      comm_description = "button model"
    ) {

      # set initial state
      private$state_$description  <- ensure(description, is.string)
      private$state_$disabled     <- ensure(disabled, rlang::is_scalar_logical)
      private$state_$button_style <- arg_match(button_style, error_call = error_call)
      if (!identical(icon, "")) {
        private$state_$icon <- arg_match(icon, values = fa_metadata()$icon_names, error_call = error_call)
      }
      private$state_$tooltip  <- ensure(tooltip, null_or(is.string))

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
        disabled     = disabled,
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
