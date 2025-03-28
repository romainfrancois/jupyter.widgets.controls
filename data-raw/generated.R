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

writeLines(generate_dom_widget("Box", style = NULL), "R/generated-Box.R")
writeLines(generate_dom_widget("Button", style = "ButtonStyle"), "R/generated-Button.R")
writeLines(generate_dom_widget("IntSlider", style = "SliderStyle"), "R/generated-IntSlider.R")
