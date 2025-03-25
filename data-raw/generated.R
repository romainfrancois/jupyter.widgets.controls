library(jupyter.widgets.generate) # >= 0.0.0.9001

writeLines(generate_style_widget("ButtonStyle"), "R/ButtonStyle-generated.R")

writeLines(generate_dom_widget("Button", style = "ButtonStyle"), "R/Button-generated.R")
writeLines(generate_dom_widget("IntSlider", style = "IntSliderStyle"), "R/IntSlider-generated.R")
