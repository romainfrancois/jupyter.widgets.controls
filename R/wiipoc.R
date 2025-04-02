#' @include generated-DOM.R
#' @include generated-Style.R
NULL

jupyter.widget.Button$set("private", "before_comm_open", function() {
  self$on("custom", function(content) {
    if (content$event == "click") {
      private$handle("click")
    }
  })
})

Checkbox           <- reformals(Checkbox, "value")
ColorPicker        <- reformals(ColorPicker, "value")
ColorsInput        <- reformals(ColorsInput, c("value", "description", "description_allow_html", "placeholder"))
Box                <- reformals(Box, "children")
HBox               <- reformals(HBox, "children")
VBox               <- reformals(VBox, "children")
GridBox            <- reformals(GridBox, "children")
Tab                <- reformals(Tab, "children")
Stack              <- reformals(Stack, "children")

Accordion          <- reformals(Accordion, "children")
BoundedFloatText   <- reformals(BoundedFloatText, c("min", "max", "value", "step"))
Combobox           <- reformals(Combobox, c("value"))
DatePicker         <- reformals(DatePicker, c("value", "min", "max", "step"))
Datetime           <- reformals(Datetime, c("value", "min", "max"))
NaiveDatetime      <- reformals(NaiveDatetime, c("value", "min", "max"))

IntSlider          <- reformals(IntSlider, c("value", "min", "max", "step"))
FloatSlider        <- reformals(FloatSlider, c("value", "min", "max", "step"))
FloatLogSlider     <- reformals(FloatLogSlider, c("value", "min", "max", "step"))
FloatRangeSlider   <- reformals(FloatRangeSlider, c("value", "min", "max", "step"))
IntRangeSlider     <- reformals(IntRangeSlider, c("value", "min", "max", "step"))

Text               <- reformals(Text, c("value", "placeholder"))
IntText            <- reformals(IntText, c("value", "step"))
FloatText          <- reformals(FloatText, c("value", "step"))
BoundedIntText     <- reformals(BoundedIntText, c("value", "min", "max", "step"))
BoundedFloatText   <- reformals(BoundedFloatText, c("value", "min", "max", "step"))

HTML               <- reformals(HTML    , c("value", "placeholder"))
HTMLMath           <- reformals(HTMLMath, c("value", "placeholder"))

ToggleButton       <- reformals(ToggleButton, c("value"))

Label              <- reformals(Label, c("value", "placeholder"))

IntProgress        <- reformals(IntProgress, c("value", "min", "max"))
FloatProgress      <- reformals(FloatProgress, c("value", "min", "max"))

Password           <- reformals(Password, c("value"))
Textarea           <- reformals(Textarea, c("value", "rows", "placeholder"))
Time               <- reformals(Time, c("value", "min", "max", "step"))
