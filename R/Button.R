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

        accepted_font_style <- c("normal", "italic", "oblique")
        accepted_font_variant <- c("normal", "small-caps", "all-small-caps", "petite-caps", "all-petite-caps", "unicase", "titling-caps")
        accepted_font_weight <- c("normal", "bold", "lighter", "bolder")
        accepted_text_decoration <- c("none", "underline", "overline", "line-through", "blink")

        private$state_ <- update_list(private$state_,
          button_color = ensure(button_color, null_or(is.string)),
          font_family  = ensure(font_family, null_or(is.string)),
          font_size    = ensure(font_size, null_or(is.string)),
          font_style   = if (is.null(font_style)) NULL else rlang::arg_match(font_style, values = accepted_font_style, error_call = error_call),
          font_variant = if (is.null(font_variant)) NULL else rlang::arg_match(font_variant, values = accepted_font_variant, error_call = error_call),
          font_weight  = {
            # TODO: extract into a function for clarity
            if (is.null(font_weight)) {
              NULL
            } else if (is.string(font_weight)) {
               rlang::arg_match(font_weight, values = accepted_font_weight, error_call = error_call)
            } else if (is.numeric(font_weight) && font_weight >= 100 && font_weight <= 900) {
              as.character(round(font_weight))
            } else {
              cli_abort(c(
                "{.arg font_weight} is not supported.",
                i = "{.arg font_weight} can be one of {.val {accepted_font_weight}}.",
                i = "or a number between 100 and 900."
              ), call = error_call)
            }
          },
          text_color = ensure(text_color, null_or(is.string)),
          text_decoration = if (is.null(text_decoration)) NULL else rlang::arg_match(text_decoration, values = accepted_text_decoration, error_call = error_call),

          `_model_name` = "ButtonStyleModel"
        )

        super$initialize(..., comm_description = "button style", error_call = error_call)
      }
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

jupyter.widget.Button <- R6Class("jupyter.widget.Button", inherit = jupyter.widget.DOMWidget,
  public = list(
    initialize = function(
      layout = Layout(),
      style = ButtonStyle(),

      description = "Click Me",
      disabled = FALSE,
      button_style = "",
      icon = "",
      ...,
      error_call = caller_env()
    ) {
      # set initial state
      private$state_ <- update_list(private$state_,
        description  = ensure(description, is.string),
        disabled     = ensure(disabled, rlang::is_scalar_logical),
        button_style = rlang::arg_match(button_style, error_call = error_call),
        icon         = if (identical(icon, "")) "" else {
          arg_match(icon, values = fa_metadata()$icon_names, error_call = error_call)
        },

        `_model_name` = "ButtonModel",
        `_view_name`  = "ButtonView"
      )

      super$initialize(
        layout = layout,
        style = ensure(style, inherits, "jupyter.widget.ButtonStyle"),
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

    mime_bundle = function() {
      data <- list(
        "text/plain" = unbox(
          glue("<Button id = {self$comm$id} >")
        ),
        "application/vnd.jupyter.widget-view+json" = list(
          "version_major" = unbox(2L),
          "version_minor" = unbox(0L),
          "model_id"      = unbox(self$comm$id)
        )
      )
      list(data = data, metadata = namedlist())
    },

    on_click = function(handler = NULL) {
      private$handlers[["custom/click"]] <- handler
    }
  )
)

#' Button
#'
#' @param layout a [Layout()]
#' @param style a [ButtonStyle()]
#'
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
Button <- function(
    layout = Layout(),
    style = ButtonStyle(),
    description = "Click Me",
    disabled = FALSE,
    button_style = "",
    icon = "",
    tooltip = NULL,
    ...,
    error_call = current_env()
  ) {

  jupyter.widget.Button$new(
    layout = layout,
    style = style,

    description  = description,
    disabled     = disabled,
    button_style = button_style,
    icon         = icon,
    tooltip      = tooltip,
    ...,
    error_call   = error_call
  )
}
