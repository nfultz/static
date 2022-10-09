\name{static}
\alias{static}
\title{
Initialize static local variables.
}
\description{
}
\usage{
static(...)
}
\arguments{
  \item{\dots}{Variable name and initial value. Must be length 1 and named.}
}
\details{
  Creates a static local variable within the calling function. Static local
  variables are initialized the first time the function is called, and then
  their values are persisted across repeated invocations.
}
\value{
None, called for side effects.
}
\examples{

fib <- function() {

  static(x=1)
  static(y=0)
  static(z=NA)
  z <- x + y
  x <- y
  y <- z

  z
}

fib()
fib()
fib()
fib()
fib()

}
