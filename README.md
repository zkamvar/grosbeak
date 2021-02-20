
<!-- README.md is generated from README.Rmd. Please edit that file -->

# renest

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/renest)](https://CRAN.R-project.org/package=renest)
<!-- badges: end -->

This is a toy it is not alive.

## Example

renest fills in a data template with values. Take for example this
simple JSON template with numeric indices:

``` r
library("jsonlite")
template <- read_json(system.file("extdata", "template1.json", package = "renest"))
toJSON(template, auto_unbox = TRUE)
#> [[[1,2],[3,4,1],5]]
```

With `renest()`, we can take some values and fill that template:

``` r
values <- paste0("Payload#", 0:6)
toJSON(renest(values, template, prefix = "Payload#"), auto_unbox = TRUE)
#> [[["Payload#1","Payload#2"],["Payload#3","Payload#4","Payload#1"],"Payload#5"]]
```
