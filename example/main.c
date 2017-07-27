#include <stdio.h>
#include "multiplyNumbers.h"
#include "third-party/checkNumber/checkNumber.h"

int main()
{
    int n, flag;
    printf("Enter a positive integer: ");
    scanf("%d", &n);
    printf("Factorial of %d = %ld", n, multiplyNumbers(n));

    // Check prime number
    flag = checkPrimeNumber(n);
    if (flag == 1)
        printf("%d is a prime number.\n", n);
    else
        printf("%d is not a prime number.\n", n);

    // Check Armstrong number
    flag = checkArmstrongNumber(n);
    if (flag == 1)
        printf("%d is an Armstrong number.", n);
    else
        printf("%d is not an Armstrong number.",n);


    return 0;
}
