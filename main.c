#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern double res(double x);

double getAbs(double x) {
  if (x < 0) {
    return -x;
  }
  return x;
}

int main(int argc, char* argv[]) {
  FILE *input, *output;
  double x, ans;
  int i;
  clock_t start, end;
  if (argc == 1) {
    srand(time(NULL));
    x = (double)(rand() - 1) / RAND_MAX;
    printf("A random number was generated: %lf\n", x);
  } else if (argc > 2) {
    printf("You should enter only file name or nothing to generate a random argument\n");
    return 1;
  } else {
    if ((input = fopen(argv[1], "r")) == 0) {
      printf("Wrong filename\n");
      return 1;
    }
    fscanf(input, "%lf", &x);
    if (getAbs(x) > 0.999999999999) {
      printf("Wrong argument, it should be in (-1, 1)\n");
      return 0;
    }
  }
  output = fopen("output.txt", "w+");
  start = clock();
  for (i = 0; i < 10000; ++i) {
    ans = res(x);
  }
  end = clock();
  fprintf(output, "%lf", ans);
  printf("The result is in file \"output.txt\"\n");
  printf("Working time: %ld ms\n", (end - start) / 1000);
  return 0;
}
