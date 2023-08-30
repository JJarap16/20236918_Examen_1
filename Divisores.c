#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

#define dim 15

void getTypeNumber(int n)
{
    int sumDiv = 0; //Varible donde se almacenará la suma de los divisores del número "n" (excepto el mismo)
    int i = 1;
    char TypeNumber[15];

    while (i < n)
    {
        if (n % i == 0) //Aquí se verifica si el residuo es cero (divisor) y se suma el divisor hallado
            sumDiv += i;
        
        i++;

    }

    if (sumDiv < n)
       strcpy(TypeNumber, "Deficiente");
    else if (sumDiv == n)
       strcpy(TypeNumber, "Perfecto");
    else
       strcpy(TypeNumber, "Abundante");

    printf("%i - %s\n",n, TypeNumber);

}

int main()
{
    srand(time(NULL));

    int numeros[dim], i = 0;

    printf("El arreglo es: ");

    do
    {
        numeros[i] = rand() % 100;
        if (i < dim -1) printf(" %i, ", numeros[i]);
        else printf(" %i\n", numeros[i]);

        i++;

    }while(i < dim);

    printf("\n");

    for(int i = 0; i < dim; i++)
        getTypeNumber(numeros[i]);


    return 0;
}