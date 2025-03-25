
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wiipoc

<!-- badges: start -->

[![R-CMD-check](https://github.com/romainfrancois/wiipoc/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/romainfrancois/wiipoc/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

wiipoc is a proof of concept package for jupyter widgets in the
[xeus-r](https://github.com/jupyter-xeus/xeus-r) kernel

## Installation

You can install the development version of wiipoc from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("romainfrancois/wiipoc")
```

## Example

``` r
library(wiipoc)
x <- IntSlider()
x
```

``` r
style <- ButtonStyle(
    font_family = "Courrier New", 
    font_size = "15px", 
    font_variant = "small-caps", 
    font_weight = "bolder", 
    text_color = "red", 
    text_decoration = "underline"
)
b <- Button(style = style, description = "update slider", tooltip = "click the button to update the slider")
b$on("click", function(){
    x$value <- round(runif(1, min = 0, max = 100))
})
b
```

<figure>
<video
src="https://private-user-images.githubusercontent.com/2625526/426455810-3cd7410b-4c1c-4692-9ac3-c16a2c5e9d01.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDI4OTUxMDksIm5iZiI6MTc0Mjg5NDgwOSwicGF0aCI6Ii8yNjI1NTI2LzQyNjQ1NTgxMC0zY2Q3NDEwYi00YzFjLTQ2OTItOWFjMy1jMTZhMmM1ZTlkMDEubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMyNSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMjVUMDkyNjQ5WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9MWNjNzFhNWYzZjFhOGI2ODc2OWYxZmE5N2M0N2UxNzdiMzM5MDlhMjE0ZTZjMDRlZGQwNDA5MGY4ZmM5Zjc3MCZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.ASff5kRnhequEjIrjNPDk-X9FVyCFW_wxgnS1Qk-SPY"
controls=""><a
href="https://private-user-images.githubusercontent.com/2625526/426455810-3cd7410b-4c1c-4692-9ac3-c16a2c5e9d01.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDI4OTUxMDksIm5iZiI6MTc0Mjg5NDgwOSwicGF0aCI6Ii8yNjI1NTI2LzQyNjQ1NTgxMC0zY2Q3NDEwYi00YzFjLTQ2OTItOWFjMy1jMTZhMmM1ZTlkMDEubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMyNSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMjVUMDkyNjQ5WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9MWNjNzFhNWYzZjFhOGI2ODc2OWYxZmE5N2M0N2UxNzdiMzM5MDlhMjE0ZTZjMDRlZGQwNDA5MGY4ZmM5Zjc3MCZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.ASff5kRnhequEjIrjNPDk-X9FVyCFW_wxgnS1Qk-SPY">Demo</a></video>
<figcaption aria-hidden="true">Demo</figcaption>
</figure>
