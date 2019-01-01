
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
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(gganimate)
#> Loading required package: ggplot2
library(ggplot2)

treasury_dat <- get_treasury_yields(tidy = TRUE)

treasury_dat %>% 
  mutate(duration = forcats::fct_relevel(duration, unique(treasury_dat$duration))) %>% 
  filter(!duration %in% c("BC_1MONTH", "BC_2MONTH", "BC_30YEARDISPLAY")) %>% 
  ggplot(aes(x = duration, y = rate, group = NEW_DATE)) + 
  geom_line() + 
  scale_x_discrete(labels = c("3M", "6M", "1Y", "2Y",
                              "3Y", "5Y", "7Y", "10Y", "20Y", "30Y",
                              "30YD")) + 
  labs(title = "Year: {frame_time}") +                             
  transition_time(NEW_DATE) 
#> Warning: Removed 7 rows containing missing values (geom_path).
#> Warning: Removed 75 rows containing missing values (geom_path).
#> Warning: Removed 73 rows containing missing values (geom_path).
#> Warning: Removed 72 rows containing missing values (geom_path).
#> Warning: Removed 74 rows containing missing values (geom_path).

#> Warning: Removed 74 rows containing missing values (geom_path).
#> Warning: Removed 72 rows containing missing values (geom_path).
#> Warning: Removed 73 rows containing missing values (geom_path).
#> Warning: Removed 74 rows containing missing values (geom_path).
#> Warning: Removed 72 rows containing missing values (geom_path).

#> Warning: Removed 72 rows containing missing values (geom_path).
#> Warning: Removed 75 rows containing missing values (geom_path).

#> Warning: Removed 75 rows containing missing values (geom_path).
#> Warning: Removed 71 rows containing missing values (geom_path).
#> Warning: Removed 35 rows containing missing values (geom_path).
#> Warning: Removed 3 rows containing missing values (geom_path).
#> Warning: Removed 10 rows containing missing values (geom_path).
```

![](README-example-1.gif)<!-- -->
