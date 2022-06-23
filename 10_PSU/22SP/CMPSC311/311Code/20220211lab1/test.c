void double_armstrongs(int array[], int length)
{
    // Function Body

    for (int a = 0; a < length; a++)
    {
        int nDigits = floor(log10(abs(array[a]))) + 1;
        scanf(array[a], num) if (num < 0)
        {
            int sum = 0;
            int tmp = num;
            while
                tmp > 0
                {
                    int digit = tmp % 10;
                    sum = sum + pow(digit, nDigits);
                    tmp = tmp / 10;
                }
            if (num == sum)
            {
                array[a] = array[a] * 2;
            }
        }
    }
}

int main()
{
    // printf() displays the string inside quotation
    printf("Hello, World!");
    return 0;
}