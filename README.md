
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
src="https://private-user-images.githubusercontent.com/2625526/415264222-cbb7f282-2aff-4971-ba9b-02ffc0ed17d3.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDAwNjc5ODQsIm5iZiI6MTc0MDA2NzY4NCwicGF0aCI6Ii8yNjI1NTI2LzQxNTI2NDIyMi1jYmI3ZjI4Mi0yYWZmLTQ5NzEtYmE5Yi0wMmZmYzBlZDE3ZDMubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDIyMCUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAyMjBUMTYwODA0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9N2MyOWI3ZmQ0MjExMGY4NmRkNGMzNTBkNWI5NDE4N2I3ZTg2NjUxYjBlNjU4ZGM5YTJiYTAzM2QzNDM5MDA1YyZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.6ng5QSCquQOJlw9XTGjokKJDC8T2bex4i421gCTB1_M"
controls=""><a
href="https://private-user-images.githubusercontent.com/2625526/415264222-cbb7f282-2aff-4971-ba9b-02ffc0ed17d3.mov?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NDAwNjc5ODQsIm5iZiI6MTc0MDA2NzY4NCwicGF0aCI6Ii8yNjI1NTI2LzQxNTI2NDIyMi1jYmI3ZjI4Mi0yYWZmLTQ5NzEtYmE5Yi0wMmZmYzBlZDE3ZDMubW92P1gtQW16LUFsZ29yaXRobT1BV1M0LUhNQUMtU0hBMjU2JlgtQW16LUNyZWRlbnRpYWw9QUtJQVZDT0RZTFNBNTNQUUs0WkElMkYyMDI1MDIyMCUyRnVzLWVhc3QtMSUyRnMzJTJGYXdzNF9yZXF1ZXN0JlgtQW16LURhdGU9MjAyNTAyMjBUMTYwODA0WiZYLUFtei1FeHBpcmVzPTMwMCZYLUFtei1TaWduYXR1cmU9N2MyOWI3ZmQ0MjExMGY4NmRkNGMzNTBkNWI5NDE4N2I3ZTg2NjUxYjBlNjU4ZGM5YTJiYTAzM2QzNDM5MDA1YyZYLUFtei1TaWduZWRIZWFkZXJzPWhvc3QifQ.6ng5QSCquQOJlw9XTGjokKJDC8T2bex4i421gCTB1_M">Demo</a></video>
<figcaption aria-hidden="true">Demo</figcaption>
</figure>
