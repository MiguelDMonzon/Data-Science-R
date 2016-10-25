# Introducción #
En este apartado se realizarán algunos ejemplos de código de R con el que interactuar para coger contacto con el lenguaje.

## Vectores ##

Para crear un vector, se utiliza el comando c(), pasándole los elementos que conforman el vector:
```{r}
c(4,5,6)
-
[1] 4 5 6
```

El vector se puede almacenar en una variable, para luego consultarla. Por ejemplo, se puede consultar su longitud:
```{r}
a <- c(4,5,6)
length(a)
-
[1] 3
```

Los vectores pueden definirse con tipos diferentes, pero R tratará de realizar conversiones para que queden del mismo tipo. Primero intentará transformar "Hola" a tipo entero, pero como no puede, intenta transformar 4 a tipo cadena, consiguiéndolo:
```{r}
c(4, "Hola")
-
[1] "4"    "Hola"
```

Otra forma de crear un vector es mediante vector(), especificándole el tipo del vector y el número de elementos. Si se desea un vector numérico de 10 elementos:
```{r}
vector("numeric", 10)
-
[1] 0 0 0 0 0 0 0 0 0 0
```

Otra forma más de crear un vector es escribiendo su tipo y la longitud que se desea. Por ejemplo, para un vector de 5 caracteres:
```{r}
character(5)
-
[1] "" "" "" "" ""
```

R admite operaciones entre vectores, actuando elemento a elemento. Por ejemplo, para realizar la suma entre dos vectores numéricos:
```{r}
a <- 1:10
b <- 31:40
a + b
-
[1] 32 34 36 38 40 42 44 46 48 50
```

En el ejemplo anterior, los dos vectores son del mismo tamaño. R también permite la suma entre dos vectores de diferente tamaño, haciendo que el vector más pequeño se repita de nuevo hasta cubrir la longitud del vector más grande:
```{r}
a <- 1:10
b <- 1:5
a + b
-
[1]  2  4  6  8 10  7  9 11 13 15
```

###Secuencias y repeticiones###

Para crear secuencias, se utiliza el comando seq(). A este comando se le pasa por parámetro el valor inicial, el valor final y el paso(step) o variación entre cada uno de los elementos hasta llegar al valor final.
Por ejemplo, para crear una secuencia del 1 al 10 sumando de 1 en 1:
```{r}
seq(1, 10, 1)
-
[1]  1  2  3  4  5  6  7  8  9 10
```

Si en cambio se desea que sumen de 2 en 2:
```{r}
seq(1, 10, 2)
-
[1] 1 3 5 7 9
```

También se puede hacer que el paso sea un número real y no entero:
```{r}
seq(1, 10, 0.5)
-
 [1]  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5
 [9]  5.0  5.5  6.0  6.5  7.0  7.5  8.0  8.5
[17]  9.0  9.5 10.0
```

Otra forma de crear una secuencia, es declarar los valores inicial y final, y también el número de elementos que se desea que tenga esa secuencia.
Si se desea una secuencia de números entre el 1 y el 10, y que genere 100 elementos:
```{r}
seq(1, 10, length.out=100)
-
  [1]  1.000000  1.090909  1.181818  1.272727
  [5]  1.363636  1.454545  1.545455  1.636364
  [9]  1.727273  1.818182  1.909091  2.000000
 [13]  2.090909  2.181818  2.272727  2.363636
 [17]  2.454545  2.545455  2.636364  2.727273
 [21]  2.818182  2.909091  3.000000  3.090909
 [25]  3.181818  3.272727  3.363636  3.454545
 [29]  3.545455  3.636364  3.727273  3.818182
 [33]  3.909091  4.000000  4.090909  4.181818
 [37]  4.272727  4.363636  4.454545  4.545455
 [41]  4.636364  4.727273  4.818182  4.909091
 ...
 [93]  9.363636  9.454545  9.545455  9.636364
 [97]  9.727273  9.818182  9.909091 10.000000
```

Se pueden realizar repeticiones de arrays mediante el uso del comando rep(). Se le pasa el vector a repetir junto el número de repeticiones deseadas. Para repetir 10 veces el array (1,2,3,4):

```{r}
rep(c(1, 2, 3, 4), 10)
-
[1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1
[22] 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4
```

###Selección de elementos e indexación###

```{r}
a <- 40:50
a[1]
-
[1] 40
```

```{r}
a[1:5]
-
[1] 40 41 42 43 44
```

```{r}
a[ c(4,1,7,7) ]
-
[1] 43 40 46 46
```

```{r}
a[ c(T, F, T, T, T, T, F, F, T ,T) ]
-
[1] 40 42 43 44 45 48 49 50
```

```{r}
a[a > 45]
-
[1] 46 47 48 49 50
```

```{r}
a[2] <- 5
a
-
[1] 40  5 42 43 44 45 46 47 48 49 50
```

###Ejercicio 1###
Ejecutar el siguiente código en R, que genera dos vectores de enteros aleatorios elegidos entre el 1 y el 1000 de tamaño 250:
```{r}
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
(x<sub>1</sub> + 2x<sub>2</sub> − x<sub>3</sub>, x<sub>2</sub> + 2x<sub>3</sub> − x<sub>4</sub>, ..., x<sub>n−2</sub> + 2x<sub>n−1</sub> − x<sub>n</sub>)

    Pista: tiene tamaño n − 2.


