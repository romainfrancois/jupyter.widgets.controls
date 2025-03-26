#' @include generated-Button.R
#' @include generated-Box.R
#' @include generated-SliderStyle.R
#' @include tools.R
NULL

jupyter.widget.Button$set("private", "before_comm_open", function() {
  self$on("custom", function(content) {
    if (content$event == "click") {
      private$handle("click")
    }
  })
})

jupyter.widget.Box$set("private", "children_", list())
jupyter.widget.Accordion$set("private", "children_", list())

Box <- reformals(Box, "children")
Accordion <- reformals(Accordion, "children")
BoundedFloatText <- reformals(BoundedFloatText, c("min", "max", "value", "step"))

#' @export
#' @rdname SliderStyle
IntSliderStyle <- SliderStyle
