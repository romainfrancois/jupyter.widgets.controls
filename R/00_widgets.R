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

Widget <- R6Class("jupyter.widget.Widget")

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
