#include <R.h>
#include <Rdefines.h>

SEXP set_attr(SEXP f, SEXP nm, SEXP env) {

  SET_ATTR(f, nm, env);

  return env;
}

