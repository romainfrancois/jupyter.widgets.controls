jupyter.widget.ButtonStyle <- R6Class("jupyter.widget.ButtonStyle", inherit = jupyter.widget.Style,
  public = list(
    initialize = function(
      # ButtonStyle
      button_color = NULL,
      font_family = NULL,
      font_size = NULL,
      font_style = NULL,
      font_variant = NULL,
      font_weight = NULL,
      text_color = NULL,
      text_decoration = NULL,

      # Widget
      `_model_module` = '@jupyter-widgets/controls',
      `_model_module_version` = "2.0.0",
      `_model_name` = "ButtonStyleModel",
      `_view_module` = '@jupyter-widgets/base',
      `_view_count` = NULL,
      `_view_module_version` = "2.0.0",
      `_view_name` = "StyleView",

      ...,
      error_call = caller_env()
    ) {

      accepted_font_style <- c("normal", "italic", "oblique")
      accepted_font_variant <- c("normal", "small-caps", "all-small-caps", "petite-caps", "all-petite-caps", "unicase", "titling-caps")
      accepted_font_weight <- c("normal", "bold", "lighter", "bolder")
      accepted_text_decoration <- c("none", "underline", "overline", "line-through", "blink")

      private$state_ <- update_list(private$state_,
        button_color = unbox(ensure(button_color, null_or(is.string))),
        font_family  = unbox(ensure(font_family, null_or(is.string))),
        font_size    = unbox(ensure(font_size, null_or(is.string))),
        font_style   = if (is.null(font_style)) NULL else unbox(rlang::arg_match(font_style, values = accepted_font_style, error_call = error_call)),
        font_variant = if (is.null(font_variant)) NULL else unbox(rlang::arg_match(font_variant, values = accepted_font_variant, error_call = error_call)),
        font_weight  = {
          # TODO: extract into a function for clarity
          if (is.null(font_weight)) {
            NULL
          } else if (is.string(font_weight)) {
             unbox(rlang::arg_match(font_weight, values = accepted_font_weight, error_call = error_call))
          } else if (is.numeric(font_weight) && font_weight >= 100 && font_weight <= 900) {
            unbox(as.character(round(font_weight)))
          } else {
            cli_abort(c(
              "{.arg font_weight} is not supported.",
              i = "{.arg font_weight} can be one of {.val {accepted_font_weight}}.",
              i = "or a number between 100 and 900."
            ), call = error_call)
          }
        },
        text_color = unbox(ensure(text_color, null_or(is.string))),
        text_decoration = if (is.null(text_decoration)) NULL else unbox(rlang::arg_match(text_decoration, values = accepted_text_decoration, error_call = error_call)),
      )

      super$initialize(
        # Widget
        `_model_module` = `_model_module`,
        `_model_module_version` = `_model_module_version`,
        `_model_name` = `_model_name`,
        `_view_module` = `_view_module`,
        `_view_count` = `_view_count`,
        `_view_module_version` = `_view_module_version`,
        `_view_name` = `_view_name`,

        ...,
        error_call = error_call
      )
    }
  ),

  active = list(
    button_color     = function(x) if (missing(x)) private$state_[["button_color"]] else self$update(button_color = unbox(x)),
    font_family      = function(x) if (missing(x)) private$state_[["font_family"]] else self$update(font_family = unbox(x)),
    font_size        = function(x) if (missing(x)) private$state_[["font_size"]] else self$update(font_size = unbox(x)),
    font_style       = function(x) if (missing(x)) private$state_[["font_style"]] else self$update(font_style = unbox(x)),
    font_variant     = function(x) if (missing(x)) private$state_[["font_variant"]] else self$update(font_variant = unbox(x)),
    text_color       = function(x) if (missing(x)) private$state_[["text_color"]] else self$update(text_color = unbox(x)),
    text_decoration  = function(x) if (missing(x)) private$state_[["text_decoration"]] else self$update(text_decoration = unbox(x))
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
#' @inheritParams Style
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

    # Widget
    `_model_module` = '@jupyter-widgets/controls',
    `_model_module_version` = "2.0.0",
    `_model_name` = "ButtonStyleModel",
    `_view_module` = '@jupyter-widgets/base',
    `_view_count` = NULL,
    `_view_module_version` = "2.0.0",
    `_view_name` = "StyleView",

    ...,
    error_call = current_env()
) {
  jupyter.widget.ButtonStyle$new(
    # ButtonStyle
    button_color    = button_color,
    font_family     = font_family,
    font_size       = font_size,
    font_style      = font_style,
    font_variant    = font_variant,
    font_weight     = font_weight,
    text_color      = text_color,
    text_decoration = text_decoration,

    # Widget
    `_model_module` = `_model_module`,
    `_model_module_version` = `_model_module_version`,
    `_model_name` = `_model_name`,
    `_view_module` = `_view_module`,
    `_view_count` = `_view_count`,
    `_view_module_version` = `_view_module_version`,
    `_view_name` = `_view_name`,

    ...,
    error_call = error_call
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

#' Button
#'
#' @param description text description of the button
#' @param disabled TRUE if the Button is disabled
#' @param button_style "", "primary", "success", "info", "warning" or "danger"
#' @param icon name of a font-awesome icon, see [fontawesome::fa()] or "" for no icon (default)
#'
#' @inheritParams DOMWidget
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
