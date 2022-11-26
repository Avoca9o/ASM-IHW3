#include <stdio.h>

extern double getAbs(double x);

double res(double x) {
  double cur = x;
  double out = 1;
  while (getAbs(cur) > 0.0005) {
    out += cur;
    cur *= x;
  }
  return out;
} 
