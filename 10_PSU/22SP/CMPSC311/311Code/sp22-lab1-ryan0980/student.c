#include "student.h"
#include <stdbool.h>

/* Lab- 1 Due by 11th Feb 2022
   Make sure your code looks clean
   Write comments with your code
   Do not foget to 'push' your code github reglarly
   */

// Takes an array of integers and the length of the array as input, and returns the smallest integer in the array
int smallest(int array[], int length)
{
	// Function Body
	int min = array[0]; // no need for empty array
	for (int i = 1; i < length; ++i)
	{
		if (min > array[i])
		{
			min = array[i];
		}
	}
	return min;
}

// Takes an array of integers and the length of the array as input, and returns the sum of the integers in the array.
int sum(int array[], int length)
{
	// Function Body
	if (length == 0)
	{ // if empty array
		return 0;
	}
	int sum = array[0];
	for (int i = 1; i < length; ++i)
	{
		sum = sum + array[i];
	}

	return sum;
}

// Takes pointers to two integers and swaps the values of integers
void swap(int *a, int *b)
{
	// Function Body
	int tmp = *a;
	*a = *b;
	*b = tmp;
}

// Rotate values of integers
void rotate(int *a, int *b, int *c)
{
	// Function Body
	int tmp = *c;
	*c = *b;
	*b = *a;
	*a = tmp;
}

// Sorts an array in descending order
void sort(int array[], int length)
{
	// Function Body
	// if (length == 0)
	// {
	// 	return 0;
	// }
	// int sorted[length];
	int i, j;
	for (i = 0; i < length - 1; i++)

		// Last i elements are already in place
		for (j = 0; j < length - i - 1; j++)
			if (array[j] < array[j + 1])
				swap(&array[j], &array[j + 1]);

	// return array;
}
bool CheckIfPrime(int num)
{
	for (int i = 2; i <= num / 2; ++i)
	{
		if (num % i == 0)
		{
			return false;
		}
	}
	return true;
}
// Takes an array of integers and the length of the array as input and cubes  every prime element of the array
void cube_primes(int array[], int length)
{
	// Function Body
	// use CheckIfPrime
	for (int a = 0; a < length; a++)
	{
		if (array[a] > 1)
		{
			if (CheckIfPrime(array[a]))
				array[a] = array[a] * array[a] * array[a];
		}
	}
	// return array;
}

int DigitNumber(int number)
{
	int count = 0;
	int tmp = number;
	while (tmp > 0)
	{
		tmp = tmp / 10;
		count++;
	}
	return count;
}

// Takes an array of integers and the length of the array as input and double every positive element of the array that is an Armstrong number.
void double_armstrongs(int array[], int length)
{
	// Function Body

	for (int a = 0; a < length; a++) // outer big loop
	{

		// scanf(array[a],num)
		if (array[a] > 0) // check if the number is positive
		{
			int number = array[a];
			int count = DigitNumber(array[a]); // call digitnumber to see howmany digit is in this  number
			int sum = 0;					   // init sum
			for (int c = 0; c < count; c++)	   // loop digit times
			{
				int tmp = number % 10; // set
				int tmpnum = 1;
				for (int b = 0; b < count; b++)
				{
					tmpnum = tmp * tmpnum;
				}

				sum = sum + tmpnum;
				number = number / 10;
			}

			if (array[a] == sum)
			{
				array[a] = array[a] * 2;
			}
		}
	}
}

// Take an array of integers and length of the arrays as input and negate every happy number of that array

int happynum(int number)
{
	int sum = 0;
	while (number > 0)
	{
		int tmp = number % 10;
		sum = sum + tmp * tmp;
		number = number / 10;
	}
	return sum;
}

void negate_happy(int array[], int length)
{
	// Function Body
	for (int a = 0; a < length; a++) // outer big loop
	{

		// int checknum = 0;
		if (array[a] > 0)
		{
			int num = array[a];

			while (num != 1 && num != 4)
			{
				num = happynum(num);
			}

			if (num == 1)
			{
				array[a] = 0 - array[a];
			}
		}
	}
}
