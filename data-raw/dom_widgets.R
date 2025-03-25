library(jupyter.widgets.generate)

writeLines(generate_dom_widget("Button", style = "ButtonStyle"), "R/Button-generated.R")
writeLines(generate_dom_widget("IntSlider", style = "IntSliderStyle"), "R/IntSlider-generated.R")
