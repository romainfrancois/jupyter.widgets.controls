
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jupyter.widgets.controls

<!-- badges: start -->

[![R-CMD-check](https://github.com/romainfrancois/jupyter.widgets.controls/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/romainfrancois/jupyter.widgets.controls/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

jupyter.widgets.controls is a proof of concept package for jupyter
widgets in the [xeus-r](https://github.com/jupyter-xeus/xeus-r) kernel

## Installation

You can install the development version of jupyter.widgets.controls from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("romainfrancois/jupyter.widgets.controls")
```

## Example

``` r
library(jupyter.widgets.controls)
slider_style <- SliderStyle(handle_color = "blue")
x <- IntSlider(style = slider_style)
x
```

``` r
button_style <- ButtonStyle(
    font_family = "Courrier New", 
    font_size = "15px", 
    font_variant = "small-caps", 
    font_weight = "bolder", 
    text_color = "red", 
    text_decoration = "underline"
)
b <- Button(style = button_style, description = "update slider", tooltip = "click the button to update the slider")
b$on("click", function(){
    x$value <- round(runif(1, min = 0, max = 100))
})
b
```

``` r
box <- Box(list(x, b))
box
```

<figure>
<video
src="https://private-user-images.githubusercontent.com/2625526/426546880-b879df15-9453-47b6-8122-2558685f196e.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDI5MDk0NTAsIm5iZiI6MTc0MjkwOTE1MCwicGF0aCI6Ii8yNjI1NTI2LzQyNjU0Njg4MC1iODc5ZGYxNS05NDUzLTQ3YjYtODEyMi0yNTU4Njg1ZjE5NmUubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMyNSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMjVUMTMyNTUwWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9YmJiYTY4NDFjNTI2ODBjZGE5ZDY1ZmM0MDliODAxZDI4MGQwNzQyMzNlNmFlNzlmM2ZlZDYxN2VhY2ZmODc3OSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.bKKTWrnb4ur-6pE1H6vl6N8nFFWvHhzF59-BC-0uk68"
controls=""><a
href="https://private-user-images.githubusercontent.com/2625526/426546880-b879df15-9453-47b6-8122-2558685f196e.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDI5MDk0NTAsIm5iZiI6MTc0MjkwOTE1MCwicGF0aCI6Ii8yNjI1NTI2LzQyNjU0Njg4MC1iODc5ZGYxNS05NDUzLTQ3YjYtODEyMi0yNTU4Njg1ZjE5NmUubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMyNSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMjVUMTMyNTUwWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9YmJiYTY4NDFjNTI2ODBjZGE5ZDY1ZmM0MDliODAxZDI4MGQwNzQyMzNlNmFlNzlmM2ZlZDYxN2VhY2ZmODc3OSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.bKKTWrnb4ur-6pE1H6vl6N8nFFWvHhzF59-BC-0uk68">Demo</a></video>
<figcaption aria-hidden="true">Demo</figcaption>
</figure>
