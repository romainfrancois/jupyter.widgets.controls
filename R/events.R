#' @include generated-DOM.R
NULL

jupyter.widget.Button$set("private", "before_comm_open", function() {
  self$on("custom", function(content) {
    if (content$event == "click") {
      private$handle("click")
    }
  })
})
