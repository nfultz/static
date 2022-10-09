# static

Static local variables are initialized once, and then their values are 
saved for future use.

## Installation

You can install the development version of `static` like so:

``` r
remotes::install_github("nfultz/static")
```

## Ye Olde Fibonacci Example

``` r
library(static)
fib <- function() {
  
  static(x=1)
  static(y=0)
  static(z=NA)
  z <- x + y 
  x <- y
  y <- z
  
  z
}
```

