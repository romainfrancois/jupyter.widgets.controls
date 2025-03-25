library(jupyter.widgets.generate) # >= 0.0.0.9001

# Style widgets
writeLines(generate_style_widget("SliderStyle"), "R/SliderStyle-generated.R")
writeLines(generate_style_widget("ButtonStyle"), "R/ButtonStyle-generated.R")

# DOM Widgets
writeLines(generate_dom_widget("Button", style = "ButtonStyle"), "R/Button-generated.R")
writeLines(generate_dom_widget("IntSlider", style = "SliderStyle"), "R/IntSlider-generated.R")
