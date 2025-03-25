#' @include Button-generated.R
#' @include accepted.R
NULL

jupyter.widget.Button$set("private", "before_comm_open", function() {
  self$on("custom", function(content) {
    if (content$event == "click") {
      private$handle("click")
    }
  })
})

set_widget_state_check(jupyter.widget.Button, "button_style", function(value) {
  unbox(arg_match_or_empty(x, values = accepted_button_style))
})

set_widget_state_check(jupyter.widget.Button, "icon", function(value) {
  unbox(arg_match_or_empty(x, fa_metadata()$icon_names))
})
