
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pru3di

<!-- badges: start -->
<!-- badges: end -->

This is a learning-while-doing project. The goal is to explore to
workflow and practices on how to develop, refine, document, and share a
R package.  
The use case is the 3Di algorithm.

3Di is a composite score combining the inefficiencies observed during
the horizontal and vertical flight phase.

## Installation

You can install the development version of pru3di from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("rainer-rq-koelle/pru3di")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(pru3di)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
