

static <- function(...) {
  nm <- ...names()

  stopifnot(
    "static() can't be used outside a function" = length(sys.frames()) > 1,
    "static() only takes one variable" = length(nm) == 1
  )

  f <- sys.function(-1) # the function calling static
  pf <- parent.frame() # it's environment / local variables

  e <- attr(f, "static")
  if(!is.environment(e)) {

    # environment where function is called /from/
    f.e <- parent.frame(2)

    # Find the /calling/ name of f
    f.nm <- as.character(sys.call(-1)[[1]])

    e <-  new.env(parent=emptyenv())
    .Call("set_attr", f.e[[f.nm]], "static", e, PACKAGE = "static")

  }


  if(match(nm, names(e), 0) == 0) { #!hasName()
    list2env(list(...), e)
  }

  makeActiveBinding(nm, statichelper(nm, e), pf)

  invisible(NULL)
}


statichelper <- function(nm, env) {
  function(val) {
    if(missing(val)) return(env[[nm]])

    env[[nm]] <- val
  }
}


test1 <- function(x) {
  static(y=0)
  y <- y + x
  y
}
