
<!-- README.md is generated from README.Rmd. Please edit that file -->

# grosbeak

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/grosbeak)](https://CRAN.R-project.org/package=grosbeak)
<!-- badges: end -->

This is a toy it is not alive. I made this package after I added a solution to the [Nested Templated Data entry in Rosetta Code](https://rosettacode.org/wiki/Nested_templated_data#R)

## Example

grosbeak fills in a data template with values. Take for example this
simple JSON template with numeric indices:

``` r
library("jsonlite")
template <- read_json(system.file("extdata", "template1.json", package = "grosbeak"))
toJSON(template, auto_unbox = TRUE)
#> [[[1,2],[3,4,1],5]]
```

With `make_nest()`, we can take some values and fill that template:

``` r
values <- paste0("Payload#", 0:6)
toJSON(make_nest(values, template, prefix = "Payload#"), auto_unbox = TRUE)
#> [[["Payload#1","Payload#2"],["Payload#3","Payload#4","Payload#1"],"Payload#5"]]
```
