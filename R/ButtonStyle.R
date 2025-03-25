#' @include accepted.R
NULL

#' ButtonStyle widget
#'
#' @rdname ButtonStyle
#' @export
jupyter.widget.ButtonStyle <- R6Class("jupyter.widget.ButtonStyle", inherit = jupyter.widget.Style,
  public = list(

    #' @param button_color A valid css color, e.g. "red" or "#ff0000"
    #' @param font_family css "font-family" value, e.g. "monospace", "Times New Roman", "Georgia, 'Times New Roman', serif", ...
    #' @param font_size css "font-size" value, e.g. "small", "large", "16px", "2em", "80%"
    #' @param font_style "normal", "italic" or "oblique"
    #' @param font_variant text formatting variations, e.g. "normal", "small-caps", ...
    #' @param font_weight boldness of the text, either one of "normal", "bold", "lighter", and "bolder" or a number between 100 and 900
    #' @param text_color A valid css color for the text of the Button.
    #' @param text_decoration text styling effects, e.g. "underline, "overline", "line-through" or "blink"
    #'
    #' @param ... See [jupyter.widgets.base::Style]
    #' @param error_call see [rlang::args_error_context()]
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

      ...,
      error_call = caller_env()
    ) {

      private$state_ <- update_list(private$state_,
        button_color = unbox(ensure(button_color, null_or(is.string))),
        font_family  = unbox(ensure(font_family, null_or(is.string))),
        font_size    = unbox(ensure(font_size, null_or(is.string))),
        font_style   = unbox(arg_match_or_null(font_style, values = accepted_font_style, error_call = error_call)),
        font_variant = unbox(arg_match_or_null(font_variant, values = accepted_font_variant, error_call = error_call)),
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
        text_decoration = unbox(arg_match_or_null(text_decoration, values = accepted_text_decoration, error_call = error_call)),
      )

      super$initialize(
        # Widget
        `_model_module` = '@jupyter-widgets/controls',
        `_model_name` = "ButtonStyleModel",
        `_view_module` = '@jupyter-widgets/base',
        `_view_name` = "StyleView",

        ...,
        error_call = error_call
      )
    }
  ),

  active = list(
    #' @field button_color
    #' CSS button color
    button_color     = function(x) if (missing(x)) private$state_[["button_color"]] else self$update(button_color = unbox(x)),

    #' @field font_family
    #' CSS `font-family` property
    font_family      = function(x) if (missing(x)) private$state_[["font_family"]] else self$update(font_family = unbox(x)),

    #' @field font_size
    #' CSS `font-size` property
    font_size        = function(x) if (missing(x)) private$state_[["font_size"]] else self$update(font_size = unbox(x)),

    #' @field font_style
    #' CSS `font-style` property
    font_style       = function(x) if (missing(x)) private$state_[["font_style"]] else {
      self$update(font_style = unbox(arg_match_or_null(font_style, values = accepted_font_style)))
    },

    #' @field font_variant
    #' CSS `font-variant` property
    font_variant     = function(x) if (missing(x)) private$state_[["font_variant"]] else {
      self$update(font_variant = unbox(arg_match_or_null(font_variant, values = accepted_font_variant)))
    },

    #' @field text_color
    #' CSS color for the text
    text_color       = function(x) if (missing(x)) private$state_[["text_color"]] else self$update(text_color = unbox(x)),

    #' @field text_decoration
    #' CSS `text-decoration` property
    text_decoration  = function(x) if (missing(x)) private$state_[["text_decoration"]] else {
      self$update(text_decoration = unbox(arg_match_or_null(text_decoration, values = accepted_text_decoration)))
    }
  )
)

#' Style for the Button widget
#'
#' Configure the appearance of a [jupyter.widget.Button] widget
#'
#' @param ... See constructor for `jupyter.widgets.ButtonStyle`
#' @inheritParams rlang::args_error_context
#'
#' @return a [jupyter.widget.ButtonStyle] object suitable for the
#' `style` argument of [Button()].
#'
#' @export
ButtonStyle <- factory(jupyter.widget.ButtonStyle)
