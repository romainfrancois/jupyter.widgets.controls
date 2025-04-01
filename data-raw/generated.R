library(jupyter.widgets.generate) # >= 0.0.0.9004

# Style widgets
writeLines(generate_style_widget("SliderStyle"), "R/generated-SliderStyle.R")
writeLines(generate_style_widget("ButtonStyle"), "R/generated-ButtonStyle.R")
writeLines(generate_style_widget("CheckboxStyle"), "R/generated-CheckboxStyle.R")

# DOM Widgets
writeLines(generate_dom_widget("Accordion", style = NULL), "R/generated-Accordion.R")
writeLines(generate_dom_widget("BoundedFloatText", style = NULL), "R/generated-BoundedFloatText.R")
writeLines(generate_dom_widget("BoundedIntText", style = NULL), "R/generated-BoundedIntText.R")
writeLines(generate_dom_widget("Checkbox", style = "CheckboxStyle"), "R/generated-Checkbox.R")
writeLines(generate_dom_widget("ColorPicker", style = NULL), "R/generated-ColorPicker.R")
writeLines(generate_dom_widget("ColorsInput", style = NULL), "R/generated-ColorsInput.R")
writeLines(generate_dom_widget("Combobox", style = NULL), "R/generated-Combobox.R")
writeLines(generate_dom_widget("DatePicker", style = NULL), "R/generated-DatePicker.R")
writeLines(generate_dom_widget("Datetime", style = NULL), "R/generated-Datetime.R")
writeLines(generate_dom_widget("NaiveDatetime", style = NULL), "R/generated-NaiveDatetime.R")
# Dropdown
# FileUpload

# Sliders
writeLines(generate_dom_widget("IntSlider", style = "SliderStyle"), "R/generated-IntSlider.R")
writeLines(generate_dom_widget("FloatLogSlider", style = "SliderStyle"), "R/generated-FloatLogSlider.R")
writeLines(generate_dom_widget("FloatRangeSlider", style = "SliderStyle"), "R/generated-FloatRangeSlider.R")
writeLines(generate_dom_widget("IntRangeSlider", style = "SliderStyle"), "R/generated-IntRangeSlider.R")

# *Text
writeLines(generate_style_widget("TextStyle"), "R/generated-TextStyle.R")
writeLines(generate_dom_widget("Text", style = "TextStyle"), "R/generated-Text.R")
writeLines(generate_dom_widget("IntText", style = "TextStyle"), "R/generated-IntText.R")
writeLines(generate_dom_widget("FloatText", style = "TextStyle"), "R/generated-FloatText.R")
writeLines(generate_dom_widget("BoundedIntText", style = "TextStyle"), "R/generated-BoundedIntText.R")
writeLines(generate_dom_widget("BoundedFloatText", style = "TextStyle"), "R/generated-BoundedFloatText.R")

# *HTML
writeLines(generate_style_widget("HTMLStyle"), "R/generated-HTMLStyle.R")
writeLines(generate_style_widget("HTMLMathStyle"), "R/generated-HTMLMathStyle.R")
writeLines(generate_dom_widget("HTML", style = "HTMLStyle"), "R/generated-HTML.R")
writeLines(generate_dom_widget("HTMLMath", style = "HTMLMathStyle"), "R/generated-HTMLMath.R")

# *Box
writeLines(generate_dom_widget("Box", style = NULL) , "R/generated-Box.R")
writeLines(generate_dom_widget("HBox", style = NULL), "R/generated-HBox.R")
writeLines(generate_dom_widget("VBox", style = NULL), "R/generated-VBox.R")

writeLines(generate_dom_widget("Button", style = "ButtonStyle"), "R/generated-Button.R")
