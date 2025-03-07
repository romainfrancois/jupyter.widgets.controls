
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
b <- Button(style = style, description = "update slider", icon = "r-project", tooltip = "click the button to update the slider")
b$on_click(function(){
    x$update(value = round(runif(1, min = 0, max = 100)))
})
b
```

<figure>
<video
src="https://private-user-images.githubusercontent.com/2625526/420331938-ba211931-06d2-498c-b610-7730fa536cb6.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDEzNTAxODAsIm5iZiI6MTc0MTM0OTg4MCwicGF0aCI6Ii8yNjI1NTI2LzQyMDMzMTkzOC1iYTIxMTkzMS0wNmQyLTQ5OGMtYjYxMC03NzMwZmE1MzZjYjYubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMwNyUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMDdUMTIxODAwWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9ODI2ODFhNmRjNmJjMzNkZTY3ZTNjY2Q4ZWU4YmRiZDA5ZjZiMTcxNjExMzE3ODM4ZDAwZWMyZWQ4MGRiZDdkZSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.PMax3Ggd8GdAt1SvOUUVxUVZGuZQsNEG3UvShcuewpA"
controls=""><a
href="https://private-user-images.githubusercontent.com/2625526/420331938-ba211931-06d2-498c-b610-7730fa536cb6.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDEzNTAxODAsIm5iZiI6MTc0MTM0OTg4MCwicGF0aCI6Ii8yNjI1NTI2LzQyMDMzMTkzOC1iYTIxMTkzMS0wNmQyLTQ5OGMtYjYxMC03NzMwZmE1MzZjYjYubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMwNyUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMDdUMTIxODAwWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9ODI2ODFhNmRjNmJjMzNkZTY3ZTNjY2Q4ZWU4YmRiZDA5ZjZiMTcxNjExMzE3ODM4ZDAwZWMyZWQ4MGRiZDdkZSZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.PMax3Ggd8GdAt1SvOUUVxUVZGuZQsNEG3UvShcuewpA">Demo</a></video>
<figcaption aria-hidden="true">Demo</figcaption>
</figure>
