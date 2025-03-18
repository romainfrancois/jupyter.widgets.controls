handler_jupyter.widget.control <- function(comm, message) {

  comm$on_message(function(request) {
    data <- request$content$data

    switch(data$method,
      "request_states" = {
        comm$send(
          data = list(
            method = unbox("update_states"),
            state = NULL
          )
        )
      }
    )
  })
}

handler_jupyter.widget <- function(comm, message) {
    comm$on_message(function(request) {

    })
}

update_list <- function(x, ...) {
  dots <- rlang::list2(...)
  x[names(dots)] <- dots
  x
}

jupyter.widget.Widget <- R6Class("jupyter.widget.Widget",
  public = list(
    initialize = function(..., error_call = caller_env()) {
      rlang::check_dots_empty(call = error_call)
    }
  ),

  private = list(
    state_ = list()
  )
)

#' Widget
#'
#' @inheritParams rlang::args_dots_empty
#' @inheritParams rlang::args_error_context
#'
#' @export
Widget <- function(..., error_call = caller_env()) {
  jupyter.widget.Widget$new(..., error_call = error_call)
}

jupyter.widget.Style <- R6Class("jupyter.widget.Style", inherit = jupyter.widget.CoreWidget,
  public = list(
    initialize = function(
      # Style
      `_view_count`          = NULL,
      `_view_module`         = "@jupyter-widgets/base",
      `_view_module_version` = "2.0.0",

      # CoreWidget
      `_model_module` = "@jupyter-widgets/controls",
      `_model_module_version` = "2.0.0",
      ...,
      comm_description = "",
      error_call = caller_env()
    ) {
      private$state_ <- update_list(private$state_,
        `_view_count`          = NULL,
        `_view_module`         = unbox(`_view_module`),
        `_view_module_version` = unbox(`_view_module_version`)
      )
      super$initialize(
        # CoreWidget
        `_model_module` = `_model_module`,
        `_model_module_version` = `_model_module_version`,

        # Widget
        ...,
        comm_description = comm_description,
        error_call = error_call
      )
    }
  )
)

#' Style
#'
#' @param `_view_count` view count
#' @param `_view_module` view module
#' @param `_view_module_version` view module version
#'
#' @inheritParams CoreWidget
#'
#' @export
Style <- function(
  # Style
  `_view_count`          = NULL,
  `_view_module`         = "@jupyter-widgets/base",
  `_view_module_version` = "2.0.0",

  # CoreWidget
  `_model_module` = "@jupyter-widgets/controls",
  `_model_module_version` = "2.0.0",

  # Widget
  ...,
  error_call = caller_env()
){
  jupyter.widget.Style$new(
    `_view_count` = `_view_count`,
    `_view_module` = `_view_module`,
    `_view_module_version` = `_view_module_version`,

    `_model_module` = `_model_module`,
    `_model_module_version` = `_model_module_version`,

    ...,
    error_call = error_call
  )
}

#' @importFrom hera mime_types
#' @export
mime_types.jupyter.widget.Widget <- function(x) {
  c("text/plain", "application/vnd.jupyter.widget-view+json")
}

#' @importFrom hera mime_bundle
#' @export
mime_bundle.jupyter.widget.Widget <- function(x, mimetypes = mime_types(x), ...) {
  x$mime_bundle()
}
