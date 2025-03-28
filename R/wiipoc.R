#' @include generated-Accordion.R
#' @include generated-BoundedFloatText.R
#' @include generated-BoundedIntText.R
#' @include generated-Box.R
#' @include generated-Button.R
#' @include generated-ButtonStyle.R
#' @include generated-Checkbox.R
#' @include generated-CheckboxStyle.R
#' @include generated-ColorsInput.R
#' @include generated-Combobox.R
#' @include generated-DatePicker.R
#' @include generated-CheckboxStyle.R
#' @include generated-IntSlider.R
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

Checkbox <- reformals(Checkbox, "value")
ColorPicker <- reformals(ColorPicker, "value")
ColorsInput <- reformals(ColorsInput, c("value", "description", "description_allow_html", "placeholder"))
Box <- reformals(Box, "children")
Accordion <- reformals(Accordion, "children")
BoundedFloatText <- reformals(BoundedFloatText, c("min", "max", "value", "step"))
BoundedIntText <- reformals(BoundedIntText, c("min", "max", "value", "step"))
Combobox <- reformals(Combobox, c("value"))
DatePicker <- reformals(DatePicker, c("value", "min", "max", "step"))

#' @export
#' @rdname SliderStyle
IntSliderStyle <- SliderStyle
