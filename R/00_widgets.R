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

jupyter.widget.Widget <- R6Class("jupyter.widget.Widget",
  public = list(
    initialize = function(..., error_call = caller_env()) {
      rlang::check_dots_empty(error_call = error_call)
    }
  )
)

jupyter.widget.CoreWidget <- R6Class("jupyter.widget.CoreWidget",
  inherit = jupyter.widget.Widget,

  public = list(
    initialize = function(..., error_call = caller_env()) {
      super$initialize(..., error_call = error_call)
    }
  )
)

read_only_state <- function(name) {
  function() {
    private$state[[name]]
  }
}

jupyter.widget.DOMWidget <- R6Class("jupyter.widget.DOMWidget",
  inherit = jupyter.widget.CoreWidget,

  public = list(
    initialize = function(layout = Layout(), model_name, dom_classes, tabbable, tooltip, ..., error_call = caller_env()) {
      private$layout <- layout
      private$state[c("_model_name", "_dom_classes", "tabbable", "tooltip")] <- list(model_name, dom_classes, tabbable, tooltip)
      super$initialize(..., error_call = error_call)
    }
  ),

  active = list(
    model_name = private$read_only_state("_model_name"),
    dom_classes = read_only_state("_dom_classes"),
    tabbable = read_only_state("tabbable"),
    tooltip = read_only_state("tooltip")
  ),

  private = list(
    layout = NULL,

    state = list(
      "_model_name"  = character(),
      "_dom_classes" = character(),
      tabbable       = logical(),
      tooltip        = character()
    )
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
