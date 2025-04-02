#' @include generated-Accordion.R
#' @include generated-BoundedFloatText.R
#' @include generated-BoundedIntText.R
#' @include generated-Box.R
#' @include generated-VBox.R
#' @include generated-HBox.R
#' @include generated-GridBox.R
#' @include generated-Tab.R
#' @include generated-Stack.R
#' @include generated-Button.R
#' @include generated-Checkbox.R
#' @include generated-CheckboxStyle.R
#' @include generated-ColorsInput.R
#' @include generated-Combobox.R
#' @include generated-DatePicker.R
#' @include generated-Datetime.R
#' @include generated-NaiveDatetime.R
#' @include generated-IntSlider.R
#' @include generated-FloatSlider.R
#' @include generated-FloatLogSlider.R
#' @include generated-FloatRangeSlider.R
#' @include generated-FloatRangeSlider.R
#' @include generated-Text.R
#' @include generated-IntText.R
#' @include generated-FloatText.R
#' @include generated-BoundedIntText.R
#' @include generated-BoundedFloatText.R
#' @include generated-HTML.R
#' @include generated-HTMLMath.R
#' @include generated-ToggleButton.R
#' @include generated-IntProgress.R
#' @include generated-FloatProgress.R
#' @include generated-Password.R
#' @include generated-Textarea.R
#' @include generated-Time.R
#' @include tools.R
NULL

#' @include generated-ButtonStyle.R
#' @include generated-CheckboxStyle.R
#' @include generated-SliderStyle.R
#' @include generated-TextStyle.R
NULL

jupyter.widget.Button$set("private", "before_comm_open", function() {
  self$on("custom", function(content) {
    if (content$event == "click") {
      private$handle("click")
    }
  })
})

jupyter.widget.Box$set("private", "children_", list())
jupyter.widget.HBox$set("private", "children_", list())
jupyter.widget.VBox$set("private", "children_", list())
jupyter.widget.GridBox$set("private", "children_", list())
jupyter.widget.Accordion$set("private", "children_", list())
jupyter.widget.Tab$set("private", "children_", list())
jupyter.widget.Stack$set("private", "children_", list())

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
BoundedIntText     <- reformals(BoundedIntText, c("min", "max", "value", "step"))
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
