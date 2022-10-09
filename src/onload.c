#include <R.h>
#include <Rinternals.h>
#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

extern SEXP set_attr(SEXP, SEXP, SEXP);


static const R_CallMethodDef CallEntries[] = {
  {"set_attr", (DL_FUNC) &set_attr, 3},
  {NULL, NULL, 0}
};

void R_init_static(DllInfo *dll) {
  R_registerRoutines(dll, NULL, CallEntries, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
