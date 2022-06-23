#include <stdio.h>

#include <stdlib.h>

#include "student.h"

#include "ref.h"

#define ARRAY_SIZE(array) (sizeof(array) / sizeof(array[0]))



// Unit test functions.



int test_smallest();

int test_sum();

int test_swap();

int test_rotate();

int test_sort();

int test_cube_primes();

int test_double_armstrongs();

int test_negate_happy();



// Utility functions used by the unit tests.

bool arrays_differ(int arrray1[], int array2[], int length);

char *array_to_string(int array[], int length);



int main() {

  int score = 0;

  //1 point

  score += test_smallest();

  // 1 point

  score += test_sum();

  //1 point

  score += test_swap();

  // 1 point

  score += test_rotate();

  // 2 point

  score += test_sort();

  // 2 point

  score += test_cube_primes();

  // 2 points

  score += test_double_armstrongs();

  // 2 points

  score += test_negate_happy();



  printf("Total score: %d/%d\n", score, 12);

}









// test for smallest function

int test_smallest() {

  {

    printf("running %s: single-element-array: ", __func__);



    int in[] = {-1234};

    int out = smallest(in, ARRAY_SIZE(in));

    int expected = ref_smallest(in, ARRAY_SIZE(in));



    if (out != expected) {

      printf("failed:\n  got: %d\n  expected: %d\n", out, expected);

      return 0;

    }

    printf("passed\n");

  }

  {

    printf("running %s: regular-array: ", __func__);



    int in[] = {123, 135, -1234, 0, 55};

    int out = smallest(in, ARRAY_SIZE(in));

    int expected = ref_smallest(in, ARRAY_SIZE(in));



    if (out != expected) {

      printf("failed:\n  got: %d\n  expected: %d\n", out, expected);

      return 0;

    }

    printf("passed\n");

  }

  return 1;

}



int test_sum() {

  {

    printf("running %s: empty-array: ", __func__);



    int in[] = {};

    int out = sum(in, ARRAY_SIZE(in));

    int expected = ref_sum(in, ARRAY_SIZE(in));



    if (out != expected) {

      printf("failed:\n  got: %d\n  expected: %d\n", out, expected);

      return 0;

    }

    printf("passed\n");

  }

  {

    printf("running %s: regular-array: ", __func__);



    int in[] = {-5, 1, 3, 58, 29823};

    int out = sum(in, ARRAY_SIZE(in));

    int expected = ref_sum(in, ARRAY_SIZE(in));



    if (out != expected) {

      printf("failed:\n  got: %d\n  expected: %d\n", out, expected);

      return 0;

    }

    printf("passed\n");

  }

  return 1;

}



int test_swap() {

  printf("running %s: ", __func__);



  int a = 1, b = 2;

  swap(&a, &b);

  if (a != 2 || b != 1) {

    printf("failed:\n  got: a=%d b=%d\n  expected: a=2 b=1\n", a, b);

    return 0;

  }

  printf("passed\n");

  return 1;

}



int test_rotate() {

  printf("running %s: ", __func__);



  int a = 1, b = 2, c = 3;

  rotate(&a, &b, &c);



  if (a != 3 || b != 1 || c != 2) {

    printf("failed:\n  got: a=%d b=%d c=%d\n  expected: a=3 b=1 c=2\n", a, b, c);

    return 0;

  }



  printf("passed\n");

  return 1;

}



int test_sort() {

  {

    printf("running %s: empty-array: ", __func__);

    int out[]      = {};

    int expected[] = {};



    sort(out, ARRAY_SIZE(out));

    ref_sort(expected, ARRAY_SIZE(expected));



    if (arrays_differ(out, expected, ARRAY_SIZE(out))) {

      char *out_s = array_to_string(out, ARRAY_SIZE(out));

      char *expected_s = array_to_string(expected, ARRAY_SIZE(expected));



      printf("failed:\n  got: %s\n  expected: %s\n", out_s, expected_s);



      free(out_s);

      free(expected_s);

      return 0;

    }

    printf("passed\n");

  }

  {

    printf("running %s: regular-array: ", __func__);

    int out[]      = {8, 2, 2, 3234, 234, 234, 1, 5, -15, 32, 87234};

    int expected[] = {8, 2, 2, 3234, 234, 234, 1, 5, -15, 32, 87234};



    sort(out, ARRAY_SIZE(out));

    ref_sort(expected, ARRAY_SIZE(expected));



    if (arrays_differ(out, expected, ARRAY_SIZE(out))) {

      char *out_s = array_to_string(out, ARRAY_SIZE(out));

      char *expected_s = array_to_string(expected, ARRAY_SIZE(expected));



      printf("failed:\n  got: %s\n  expected: %s\n", out_s, expected_s);



      free(out_s);

      free(expected_s);

      return 0;

    }

    printf("passed\n");

  }

  {

    printf("running %s: sorted-array: ", __func__);

    int out[]      = {-5, -1, 2, 3, 7, 198, 28349};

    int expected[] = {-5, -1, 2, 3, 7, 198, 28349};



    sort(out, ARRAY_SIZE(out));

    ref_sort(expected, ARRAY_SIZE(expected));



    if (arrays_differ(out, expected, ARRAY_SIZE(out))) {

      char *out_s = array_to_string(out, ARRAY_SIZE(out));

      char *expected_s = array_to_string(expected, ARRAY_SIZE(expected));



      printf("failed:\n  got: %s\n  expected: %s\n", out_s, expected_s);



      free(out_s);

      free(expected_s);

      return 0;

    }

    printf("passed\n");

  }

  return 2;

}



int test_cube_primes() {

  printf("running %s: ", __func__);

  int out[]      = {0, 1, 2, -5, 11, 13, 15, 27, 3779, 32};

  int expected[] = {0, 1, 2, -5, 11, 13, 15, 27, 3779, 32};



  cube_primes(out, ARRAY_SIZE(out));

  ref_cube_primes(expected, ARRAY_SIZE(expected));



  if (arrays_differ(out, expected, ARRAY_SIZE(out))) {

    char *out_s = array_to_string(out, ARRAY_SIZE(out));

    char *expected_s = array_to_string(expected, ARRAY_SIZE(expected));



    printf("failed:\n  got: %s\n  expected: %s\n", out_s, expected_s);



    free(out_s);

    free(expected_s);

    return 0;

  }



  printf("passed\n");

  return 2;

}



int test_double_armstrongs() {

  printf("running %s: ", __func__);

  int out[]      = {0, -1, 2, -5, 8, 153, 370, -153, 26, 9474};

  int expected[] = {0, -1, 2, -5, 8, 153, 370, -153, 26, 9474};



  double_armstrongs(out, ARRAY_SIZE(out));

  ref_double_armstrongs(expected, ARRAY_SIZE(expected));



  if (arrays_differ(out, expected, ARRAY_SIZE(out))) {

    char *out_s = array_to_string(out, ARRAY_SIZE(out));

    char *expected_s = array_to_string(expected, ARRAY_SIZE(expected));



    printf("failed:\n  got: %s\n  expected: %s\n", out_s, expected_s);



    free(out_s);

    free(expected_s);

    return 0;

  }



  printf("passed\n");

  return 2;

}





int test_negate_happy() {

  printf("running %s: ", __func__);

  int out[]      = {0, 97, 2, -5, 8, 4, 370, -153, 139, 19};

  int expected[] = {0, 97, 2, -5, 8, 4, 370, -153, 139, 19};



  negate_happy(out, ARRAY_SIZE(out));

  ref_negate_happy(expected, ARRAY_SIZE(expected));



  if (arrays_differ(out, expected, ARRAY_SIZE(out))) {

    char *out_s = array_to_string(out, ARRAY_SIZE(out));

    char *expected_s = array_to_string(expected, ARRAY_SIZE(expected));



    printf("failed:\n  got: %s\n  expected: %s\n", out_s, expected_s);



    free(out_s);

    free(expected_s);

    return 0;

  }



  printf("passed\n");

  return 2;

}



bool arrays_differ(int array1[], int array2[], int length) {

  for (int i = 0; i < length; ++i)

    if (array1[i] != array2[i])

      return true;

  return false;

}



char *array_to_string(int array[], int length) {

  char *p = (char *)malloc(length * 10);

  for (int i = 0, n = 0; i < length; ++i) {

    n += sprintf(p + n, "%d ", array[i]);

  }

  return p;

}
