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

set_widget_state_check(jupyter.widget.Button, "button_style", jupyter.widgets.base::unbox_one_of(accepted_button_style))
set_widget_state_check(jupyter.widget.Button, "icon"        , jupyter.widgets.base::unbox_one_of(fa_metadata()$icon_names))
