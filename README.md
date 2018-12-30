
<!-- README.md is generated from README.Rmd. Please edit that file -->

# yieldr <img src="man/figures/hex_sticker.png" align="right" height="150" width="125"/>

[![Build
Status](https://travis-ci.com/dylanjm/yieldr.svg?branch=master)](https://travis-ci.com/dylanjm/yieldr)
<!-- ![Current CRAN Version](https://www.r-pkg.org/badges/version/bjscrapeR) -->
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/latest/active.svg)](http://www.repostatus.org/#active)
<!-- ![Total Downloads](http://cranlogs.r-pkg.org/badges/grand-total/bjscrapeR) -->

## Installation

You can install yieldr from github with:

``` r
# install.packages("devtools")
devtools::install_github("dylanjm/yieldr")
```

## Basic Usage

As of right now, the package only comes with one function:
`get_treasury_yields()`.

``` r
library(yieldr)

treasury_dat <- get_treasury_yields()
head(treasury_dat, 5)
#> # A tibble: 5 x 15
#>      ID NEW_DATE            BC_1MONTH BC_2MONTH BC_3MONTH BC_6MONTH
#>   <int> <dttm>                  <dbl>     <dbl>     <dbl>     <dbl>
#> 1     1 1990-01-02 00:00:00        NA        NA      7.83      7.89
#> 2     2 1990-01-03 00:00:00        NA        NA      7.89      7.94
#> 3     3 1990-01-04 00:00:00        NA        NA      7.84      7.90
#> 4     4 1990-01-05 00:00:00        NA        NA      7.79      7.85
#> 5     5 1990-01-08 00:00:00        NA        NA      7.79      7.88
#> # ... with 9 more variables: BC_1YEAR <dbl>, BC_2YEAR <dbl>,
#> #   BC_3YEAR <dbl>, BC_5YEAR <dbl>, BC_7YEAR <dbl>, BC_10YEAR <dbl>,
#> #   BC_20YEAR <dbl>, BC_30YEAR <dbl>, BC_30YEARDISPLAY <dbl>
```
