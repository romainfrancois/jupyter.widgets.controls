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

# *ToggleButton
writeLines(generate_style_widget("ToggleButtonStyle"), "R/generated-ToggleButtonStyle.R")
writeLines(generate_dom_widget("ToggleButton", style = "ToggleButtonStyle"), "R/generated-ToggleButton.R")
# TODO: update jupyter.widgets.generate to handle _options_label
#       https://github.com/romainfrancois/jupyter.widgets.generate/issues/7
# writeLines(generate_style_widget("ToggleButtonsStyle"), "R/generated-ToggleButtonsStyle.R")
# writeLines(generate_dom_widget("ToggleButtons", style = "ToggleButtonsStyle"), "R/generated-ToggleButtons.R")

# Label
writeLines(generate_style_widget("LabelStyle"), "R/generated-LabelStyle.R")
writeLines(generate_dom_widget("Label", style = "LabelStyle"), "R/generated-Label.R")

# Progress
writeLines(generate_style_widget("ProgressStyle"), "R/generated-ProgressStyle.R")
writeLines(generate_dom_widget("IntProgress", style = "ProgressStyle"), "R/generated-IntProgress.R")
writeLines(generate_dom_widget("FloatProgress", style = "ProgressStyle"), "R/generated-FloatProgress.R")

writeLines(generate_dom_widget("Password", style = NULL), "R/generated-Password.R")


# *Box
writeLines(generate_dom_widget("Box", style = NULL)    , "R/generated-Box.R")
writeLines(generate_dom_widget("HBox", style = NULL)   , "R/generated-HBox.R")
writeLines(generate_dom_widget("VBox", style = NULL)   , "R/generated-VBox.R")
writeLines(generate_dom_widget("GridBox", style = NULL), "R/generated-GridBox.R")

writeLines(generate_dom_widget("Tab", style = NULL), "R/generated-Tab.R")
writeLines(generate_dom_widget("Stack", style = NULL), "R/generated-Stack.R")

writeLines(generate_dom_widget("Button", style = "ButtonStyle"), "R/generated-Button.R")

writeLines(generate_dom_widget("Textarea", style = NULL), "R/generated-Textarea.R")

