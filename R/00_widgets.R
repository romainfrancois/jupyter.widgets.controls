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

#' @importFrom hera mime_types
#' @export
mime_types.jupyter.widget.DOMWidget <- function(x) {
  c("application/vnd.jupyter.widget-view+json")
}

#' @importFrom hera mime_bundle
#' @export
mime_bundle.jupyter.widget.DOMWidget <- function(x, mimetypes = mime_types(x), ...) {
  x$mime_bundle()
}
