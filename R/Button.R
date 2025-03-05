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

        initialize = function(layout = Layout(), style = ButtonStyle(), comm_description = "button model", ...) {
            super$initialize(
              layout = layout,
              style = style,
              comm_description = comm_description,
              ...
            )

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
#' @param ... additional model parameters, currently unused
#'
#' @export
ButtonModel <- function(layout = Layout(), style = ButtonStyle(), ...) {
  jupyter.widget.ButtonModel$new(layout = layout, style = style, ...)
}

jupyter.widget.Button <- R6Class("jupyter.widget.Button", inherit = jupyter.widget.Widget,
    public = list(
        layout = NULL,
        style = NULL,
        model = NULL,

        initialize = function(layout = Layout(), style = ButtonStyle(), ...) {
            self$layout <- layout
            self$style  <- style
            self$model  <- ButtonModel(
              layout = self$layout,
              style  = self$style,
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
Button <- function(layout = Layout(), style = ButtonStyle(), ...) {
    jupyter.widget.Button$new(layout = layout, style = style, ...)
}
