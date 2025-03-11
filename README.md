
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
b$on_click(function(){
    x$value <- round(runif(1, min = 0, max = 100))
})
b
```

<figure>
<video
src="https://private-user-images.githubusercontent.com/2625526/421302706-efd134a1-1cb4-4e06-b7ae-490f037be78c.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDE2ODcxMDYsIm5iZiI6MTc0MTY4NjgwNiwicGF0aCI6Ii8yNjI1NTI2LzQyMTMwMjcwNi1lZmQxMzRhMS0xY2I0LTRlMDYtYjdhZS00OTBmMDM3YmU3OGMubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMxMSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMTFUMDk1MzI2WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9NTY5MDRiMDUxMDA0M2RlNDgwY2I1YzAwMmY3ZDZhNTQzODUzMzQ1ODFmYjIwYzg1MTNiMzZlMzMwOTgyYTUxMyZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.VtTEKnwe_u6dw_zHnevgok5i4t-VnFxn3Y3DZe60CGM"
controls=""><a
href="https://private-user-images.githubusercontent.com/2625526/421302706-efd134a1-1cb4-4e06-b7ae-490f037be78c.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDE2ODcxMDYsIm5iZiI6MTc0MTY4NjgwNiwicGF0aCI6Ii8yNjI1NTI2LzQyMTMwMjcwNi1lZmQxMzRhMS0xY2I0LTRlMDYtYjdhZS00OTBmMDM3YmU3OGMubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMxMSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMTFUMDk1MzI2WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9NTY5MDRiMDUxMDA0M2RlNDgwY2I1YzAwMmY3ZDZhNTQzODUzMzQ1ODFmYjIwYzg1MTNiMzZlMzMwOTgyYTUxMyZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.VtTEKnwe_u6dw_zHnevgok5i4t-VnFxn3Y3DZe60CGM">Demo</a></video>
<figcaption aria-hidden="true">Demo</figcaption>
</figure>
