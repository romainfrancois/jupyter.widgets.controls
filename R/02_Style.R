jupyter.widget.Style <- R6Class("jupyter.widget.Style",
  public = list(
    comm = NULL,

    initialize = function(..., comm_description, error_call = caller_env()) {
      check_dots_empty(call = error_call)
      comm <- CommManager$new_comm("jupyter.widget", description = comm_description)

      comm$open(
        data = list(state = private$state_, buffer_paths = list()),
        metadata = list(version = "2.1.0")
      )

      self$comm <- comm
    },

    state = function(what) {
      if (missing(what)) {
        private$state_
      } else {
        private$state_[[what]]
      }
    }
  )
)

Style <- function(...) {
  jupyter.widget.Style$new(
    ...
  )
}
