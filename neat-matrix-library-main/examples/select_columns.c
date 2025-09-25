#include <stdlib.h>
#include <stdio.h>
#include <time.h>

#include "lib/nml.h"

int main(int argc, char *argv[]) {
  printf("\nExtract all matrix columns from a Matrix as matrices\n");
  srand(time(NULL));
  nml_mat *m = nml_mat_rnd(5, 5, -10.0, 10.0);
  nml_mat *col;
  nml_mat_print(m);
  int i = 0;
  for(i = 0; i < m->num_cols; i++) {
    col = nml_mat_col_get(m, i);
    nml_mat_print(col);
    nml_mat_free(col);
  }
  nml_mat_free(m);
  return 0;
}
