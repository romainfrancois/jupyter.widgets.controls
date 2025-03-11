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

jupyter.widget.CoreWidget <- R6Class("jupyter.widget.CoreWidget",
  inherit = jupyter.widget.Widget,

  public = list(
    initialize = function(
      `_model_module` = "@jupyter-widgets/controls",
      `_model_module_version` = "2.0.0",
      ...,
      comm_description = "",
      error_call = caller_env()
    ) {

      private$handlers_ <- new.env()
      private$state_ <- update_list(private$state_,
        `_model_module`         = `_model_module`,
        `_model_module_version` = `_model_module_version`
      )
      super$initialize(..., error_call = error_call)

      private$comm_ <- comm <- CommManager$new_comm("jupyter.widget", description = comm_description)
      comm$on_message(function(request) {
        data <- request$content$data
        method <- data$method

        switch(
          method,
          update = {
            state <- data$state
            private$state_ <- replace(private$state_, names(state), state)

            private$handle("update", state)

            comm$send(
              data = list(
                method = "echo_update", state = state, buffer_paths = list()
              )
            )
          },

          custom = {
            private$handle("custom", data$content)
          })

        })

      comm$on_close(function(request) {
        private$handle("on_close", data$content)
      })

      comm$open(
        data = list(state = private$state_, buffer_paths = list()),
        metadata = list(version = "2.1.0")
      )
    },

    state = function(what) {
      private$state_[[what]]
    },

    on_update = function(handler) {
      private$handlers_[["update"]] <- handler
    },

    on_custom = function(handler) {
      private$handlers_[["custom"]] <- handler
    }
  ),

  active = list(
    comm = function() private$comm_,

    `_model_name`  = function() private$state_[["_model_name"]],
    `_dom_classes` = function() private$state_[["_dom_classes"]]
  ),

  private = list(
    comm_ = NULL,
    handlers_ = NULL,

    handle = function(name, ...) {
      handler <- private$handlers_[[name]]
      if (!is.null(handler)) {
        handler(...)
      }
    }

  )
)

jupyter.widget.Style <- R6Class("jupyter.widget.Style", inherit = jupyter.widget.CoreWidget,
  public = list(
    initialize = function(..., comm_description = "", error_call = caller_env()) {
      private$state_ <- update_list(private$state_,
        "_view_count"          = NULL,
        "_view_module"         = "@jupyter-widgets/base",
        "_view_module_version" = "2.0.0"
      )
      super$initialize(..., comm_description = comm_description, error_call = error_call)
    }
  )
)

jupyter.widget.DOMWidget <- R6Class("jupyter.widget.DOMWidget",
  inherit = jupyter.widget.CoreWidget,

  public = list(
    initialize = function(layout = Layout(), style = NULL, tabbable = NULL, tooltip = "", ..., comm_description = "", error_call = caller_env()) {
      private$layout_ <- layout
      private$style_  <- style

      private$state_ <- update_list(private$state_,
        tabbable = tabbable,
        tooltip  = ensure(tooltip, null_or(is.string)),
        layout   = glue("IPY_MODEL_{layout$comm$id}"),
        style    = glue("IPY_MODEL_{style$comm$id}")
      )

      super$initialize(
        ...,
        comm_description = comm_description,
        error_call = error_call
      )
    }
  ),

  active = list(
    layout = function() layout_,
    style  = function() style_,

    tabbable = function() private$state_[["tabbable"]],
    tooltip  = function() private$state_[["tooltip"]]
  ),

  private = list(
    layout_ = NULL,
    style_  = NULL
  )
)

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
