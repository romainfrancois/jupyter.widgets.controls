
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
b <- Button()
b$on_click(function(){
    x$update(value = round(runif(1, min = 0, max = 100)))
})
b
```

<figure>
<video
src="https://private-user-images.githubusercontent.com/2625526/419402485-80d36d5c-0c7f-4cb3-b791-c034b8be46e9.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDExNjk2MzEsIm5iZiI6MTc0MTE2OTMzMSwicGF0aCI6Ii8yNjI1NTI2LzQxOTQwMjQ4NS04MGQzNmQ1Yy0wYzdmLTRjYjMtYjc5MS1jMDM0YjhiZTQ2ZTkubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMwNSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMDVUMTAwODUxWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9OWU0M2QxZDIxZGIxMWEwODc4Mjg5NTZmM2RhNjcyNDEwZDIzMmZhYjg3ZTg5ZDI3ZWZjOTYwNTVmNTY0YzdjZiZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.92B_cpHa0C_0gB5Syqzea8YvBOocIm9fyWM7i396k_w"
controls=""><a
href="https://private-user-images.githubusercontent.com/2625526/419402485-80d36d5c-0c7f-4cb3-b791-c034b8be46e9.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDExNjk2MzEsIm5iZiI6MTc0MTE2OTMzMSwicGF0aCI6Ii8yNjI1NTI2LzQxOTQwMjQ4NS04MGQzNmQ1Yy0wYzdmLTRjYjMtYjc5MS1jMDM0YjhiZTQ2ZTkubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDMwNSUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAzMDVUMTAwODUxWiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9OWU0M2QxZDIxZGIxMWEwODc4Mjg5NTZmM2RhNjcyNDEwZDIzMmZhYjg3ZTg5ZDI3ZWZjOTYwNTVmNTY0YzdjZiZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.92B_cpHa0C_0gB5Syqzea8YvBOocIm9fyWM7i396k_w">Demo</a></video>
<figcaption aria-hidden="true">Demo</figcaption>
</figure>
