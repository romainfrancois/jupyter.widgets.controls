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

#' @importFrom hera bundle
#' @export
bundle.Widget <- function(obj, mimetypes = getOption("jupyter.display_mimetypes"), ...) {
  obj$bundle()
}
