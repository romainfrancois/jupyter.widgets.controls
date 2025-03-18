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
        `_model_module`         = unbox(`_model_module`),
        `_model_module_version` = unbox(`_model_module_version`)
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
            # TODO: handle change in $children because we would only get the id

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

      data <- list(state = private$state_, buffer_paths = list())
      if (isTRUE(getOption("comm.verbose"))) {
        print(jsonlite::toJSON(data))
      }
      comm$open(
        data = data,
        metadata = list(version = "2.1.0")
      )
    },

    state = function(what) {
      private$state_[[what]]
    },

    update = function(...) {
      state <- list2(...)

      # special case for children
      if ("children" %in% names(state)) {
        state$children <- map_chr(children, \(kid) kid$comm$id)
      }

      private$comm_$send(
        data = list(method = "update", state = state, buffer_paths = list())
      )
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

#' Core Widget
#'
#' @param `_model_module` name of the model module
#' @param `_model_module_version` version of the model module
#'
#' @inheritParams Widget
#'
#' @export
CoreWidget <- function(
  `_model_module` = "@jupyter-widgets/controls",
  `_model_module_version` = "2.0.0",
  ...,
  error_call = caller_env()
) {
  jupyter.widget.CoreWidget$new(
    `_model_module` = `_model_module`,
    `_model_module_version` = `_model_module_version`,
    ...,
    error_call = error_call
  )
}
