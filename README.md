
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggunit

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ggunit)](https://CRAN.R-project.org/package=ggunit)
<!-- badges: end -->

The goal of ggunit is to provide a consistent experience with `ggplot2`
sizes, proportions, and units. The package is for now extremely simple,
but with a powerful philosophy that makes it easy to choose proportions
and scaling for your graphic.

## Installation

You can install the development version of ggunit like so:

``` r
# install.packages("remotes")
remotes::install_github("charlie-gallagher/ggunit")
```

## Usage

Central to the ggunit package is the design unit “lines.” One line is
the height of a line of body text, for example the axis text. Since a
primary goal of visualizations is to have readable text, lines are a
natural unit of measurement.

The function `device_dimensions()` takes a height in lines of text, an
aspect ratio, and the body text size (in points) and generates the
correct units (in inches, by default) for height and width.

``` r
library(ggunit)

dims <- device_dimensions(default_text = 11, 
                          height = 30, 
                          aspect_ratio = 16/9)
```

The result is a list of length 2 with the requested dimensions.

``` r
dims
#> $height
#> [1] 4.56621
#> 
#> $width
#> [1] 8.117707
```

The `device_dimensions()` function is useful because it’s explicit. If
you don’t have very strict standards, you can pass your graphic to
`ggunit_save()`, which is a thin wrapper around `ggplot2::ggsave()`.

### Other tools

Aligning text sizes in ggplot can be painful. The two main places you
see text sizes are in `geom_text()` for plotting text and
`element_text()` for adjusting theme elements.

The problem is that `geom_text` uses millimeters for the `size`
argument, and `element_text` uses points. The ggplot2 package provides
the `.pt` constant, which is the number of points in 1mm. To make this
easier to use, `ggunit` provides the `pt_to_mm()` and `mm_to_pt()`
functions.

``` r
default_text <- 11      # Text size in points

default_text / ggplot2::.pt      # Converted to millimeters
#> [1] 3.866058
pt_to_mm(default_text)  # Same, but more intuitive
#> [1] 3.866058
```

------------------------------------------------------------------------

Charlie Gallagher, March 2022
