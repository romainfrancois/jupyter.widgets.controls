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

#' @importFrom hera mime_bundle
#' @export
mime_bundle.Widget <- function(obj, mimetypes = c("text/plain", "application/vnd.jupyter.widget-view+json"), ...) {
  obj$mime_bundle()
}
