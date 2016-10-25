# Introducción #
En este apartado se realizarán algunos ejemplos de código de R con el que interactuar para coger contacto con el lenguaje.

## Vectores ##

```R
c(4,5,6)
```

```R
a <- c(4,5,6)
length(a)
```

```R
c(4, "Hola")
```

```R
vector("numeric", 10)
```

```R
character(5)
```

```R
a <- 1:10
b <- 31:40
a + b
```

```R
a <- 1:10
b <- 1:5
a + b
```

###Secuencias y repeticiones###

```R
seq(1, 10, 1)
```

```R
seq(1, 10, 2)
```

```R
seq(1, 10, 0.5)
```

```R
seq(1, 10, length.out=100)
```

```R
rep(c(1, 2, 3, 4), 10)
```

###Selección de elementos e indexación###
```R
a <- 40:50
a[1]
```

```R
a[1:5]
```

```R
a[ c(4,1,7,7) ]
```

```R
a[ c(T, F, T, T, T, T, F, F, T ,T) ]
```

```R
a[a > 45]
```

```R
a[2] <- 5
```
###Ejercicio 1###
Ejecutar el siguiente código en R, que genera dos vectores de enteros aleatorios elegidos entre el 1 y el 1000 de tamaño 250:
```R
n <- 250
x <- sample(1:1000, n, replace=T)
y <- sample(1:1000, n, replace=T)
```

A partir de los dos vectores anteriores:

1. Calcular el el máximo y el mı́nimo de los vectores x e y.

2. Calcular la media de los vectores x e y. Antes de calcularla, ¿que valor esperarı́as?.

3. Calcula el número de elementos de x divisibles por 2 (el operador módulo es %%).

4. Ordenar los vectores, primero usando la función order() y luego la función sort().

5. Seleccionar los valores de y menores que 600.

6. Crear las secuencias (funciones rep y seq):

    * 1 2 3 4 5 6 7 8 9 10.
    * 1 2 3 4 1 2 3 4 1 2 3 4.
    * -1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1.0

7. Crear el vector
(x_{1} + 2x 2 − x 3 , x 2 + 2x 3 − x 4 , ..., x n−2 + 2x n−1 − x n )

    Pista: tiene tamaño n − 2.


