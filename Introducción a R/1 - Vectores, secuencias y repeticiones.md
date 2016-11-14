
# Introducción #
En este apartado se realizarán algunos ejemplos de código de R con el que interactuar para coger contacto con el lenguaje.

## Vectores ##

Para crear un vector, se utiliza el comando c(), pasándole los elementos que conforman el vector:


```R
print(c(4,5,6))
```

    [1] 4 5 6


El vector se puede almacenar en una variable, para luego consultarla. Por ejemplo, se puede consultar su longitud:


```R
a <- c(4,5,6)
print(length(a))
```

    [1] 3


Los vectores pueden definirse con tipos diferentes, pero R tratará de realizar conversiones para que queden del mismo tipo. Primero intentará transformar "Hola" a tipo entero, pero como no puede, intenta transformar 4 a tipo cadena, consiguiéndolo:


```R
print(c(4, "Hola"))
```

    [1] "4"    "Hola"


Otra forma de crear un vector es mediante vector(), especificándole el tipo del vector y el número de elementos. Si se desea un vector numérico de 10 elementos:


```R
print(vector("numeric", 10))
```

     [1] 0 0 0 0 0 0 0 0 0 0


Otra forma más de crear un vector es escribiendo su tipo y la longitud que se desea. Por ejemplo, para un vector de 5 caracteres:


```R
print(character(5))
```

    [1] "" "" "" "" ""


R admite operaciones entre vectores, actuando elemento a elemento. Por ejemplo, para realizar la suma entre dos vectores numéricos, uno que abarca entre el 1 y el 10 y otro entre el 31 y el 40 es:


```R
a <- 1:10
b <- 31:40
print(a + b)
```

     [1] 32 34 36 38 40 42 44 46 48 50


En el ejemplo anterior, los dos vectores son del mismo tamaño. R también permite la suma entre dos vectores de diferente tamaño, haciendo que el vector más pequeño se repita de nuevo hasta cubrir la longitud del vector más grande:


```R
a <- 1:10
b <- 1:5
print(a + b)
```

     [1]  2  4  6  8 10  7  9 11 13 15


###Secuencias y repeticiones###

Para crear secuencias, se utiliza el comando seq(). A este comando se le pasa por parámetro el valor inicial, el valor final y el paso(step) o variación entre cada uno de los elementos hasta llegar al valor final.
Por ejemplo, para crear una secuencia del 1 al 10 sumando de 1 en 1:


```R
print(seq(1, 10, 1))
```

     [1]  1  2  3  4  5  6  7  8  9 10


Si en cambio se desea que sumen de 2 en 2:


```R
print(seq(1, 10, 2))
```

    [1] 1 3 5 7 9


También se puede hacer que el paso sea un número real y no entero:


```R
print(seq(1, 10, 0.5))
```

     [1]  1.0  1.5  2.0  2.5  3.0  3.5  4.0  4.5  5.0  5.5  6.0  6.5  7.0  7.5  8.0
    [16]  8.5  9.0  9.5 10.0


Otra forma de crear una secuencia, es declarar los valores inicial y final, y también el número de elementos que se desea que tenga esa secuencia.
Si se desea una secuencia de números entre el 1 y el 10, y que genere 100 elementos:


```R
print(seq(1, 10, length.out=100))
```

      [1]  1.000000  1.090909  1.181818  1.272727  1.363636  1.454545  1.545455
      [8]  1.636364  1.727273  1.818182  1.909091  2.000000  2.090909  2.181818
     [15]  2.272727  2.363636  2.454545  2.545455  2.636364  2.727273  2.818182
     [22]  2.909091  3.000000  3.090909  3.181818  3.272727  3.363636  3.454545
     [29]  3.545455  3.636364  3.727273  3.818182  3.909091  4.000000  4.090909
     [36]  4.181818  4.272727  4.363636  4.454545  4.545455  4.636364  4.727273
     [43]  4.818182  4.909091  5.000000  5.090909  5.181818  5.272727  5.363636
     [50]  5.454545  5.545455  5.636364  5.727273  5.818182  5.909091  6.000000
     [57]  6.090909  6.181818  6.272727  6.363636  6.454545  6.545455  6.636364
     [64]  6.727273  6.818182  6.909091  7.000000  7.090909  7.181818  7.272727
     [71]  7.363636  7.454545  7.545455  7.636364  7.727273  7.818182  7.909091
     [78]  8.000000  8.090909  8.181818  8.272727  8.363636  8.454545  8.545455
     [85]  8.636364  8.727273  8.818182  8.909091  9.000000  9.090909  9.181818
     [92]  9.272727  9.363636  9.454545  9.545455  9.636364  9.727273  9.818182
     [99]  9.909091 10.000000


Se pueden realizar repeticiones de arrays mediante el uso del comando rep(). Se le pasa el vector a repetir junto el número de repeticiones deseadas. Para repetir 10 veces el array (1,2,3,4):


```R
print(rep(c(1, 2, 3, 4), 10))
```

     [1] 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4 1 2
    [39] 3 4


###Selección de elementos e indexación###

Una vez definido el vector, se pueden seleccionar elementos del mismo. Una forma es mediante el índice de ese vector, empezando desde el primer elemento con índice 1. Por lo tanto, para obtener el primer elemento del vector:


```R
a <- 40:50
print(a[1])
```

    [1] 40


También se pueden seleccionar un conjunto de elementos del vector, mediante un conjunto de índices. En el ejemplo, se seleccionan los cinco primeros elementos del vector anterior, de la forma indiceMenor:indiceMayor, abarcando el rango de índices [1..5]:


```R
print(a[1:5])
```

    [1] 40 41 42 43 44


En vez de un rango, se puede especificar un vector de indices, el cual no tiene por qué ser ordenado, para seleccionar los elementos correspondientes a esos índices:


```R
print(a[ c(4,1,7,7) ])
```

    [1] 43 40 46 46


Otra forma de selección de elementos de un vector es la aplicación sobre él de un vector lógico (de valores booleanos, True o False). Así, se consigue seleccionar únicamente los elementos que corresponden a valores True.


```R
print(a[ c(T, F, T, T, T, T, F, F, T ,T) ])
```

    [1] 40 42 43 44 45 48 49 50


Si se quisiese obtener, por ejemplo, los elementos de a mayores de 45, es necesario aplicar el vector lógico para no mostrar los elementos que no cumplan la condición. Y para obtener ese vector lógico, basta con realizar la condición a > 45.
Tras ejecutar ```a > 45``` se obtiene el resultado de preguntar a cada uno de los elementos de a si es mayor que 45, de ahí como resultado el vector lógico a aplicar:


```R
print(a[a > 45])
```

    [1] 46 47 48 49 50


Por último, se puede modificar el valor de un elemento del vector, asignándole al elemento un valor nuevo.


```R
a[2] <- 5
print(a)
```

     [1] 40  5 42 43 44 45 46 47 48 49 50


###Ejercicio 1###
Ejecutar el siguiente código en R, que genera dos vectores de enteros aleatorios elegidos entre el 1 y el 1000 de tamaño 250:


```R
n <- 250
x <- sample(1:1000, n, replace=T)
y <- sample(1:1000, n, replace=T)
```

A partir de los dos vectores anteriores:

Calcular el máximo y el mı́nimo de los vectores x e y.

```R
max(x)
min(x)
max(y)
min(y)
```

Calcular la media de los vectores x e y. Antes de calcularla, ¿que valor esperarı́as?.

```R
mean(x)
mean(y)
```

Calcula el número de elementos de x divisibles por 2 (el operador módulo es %%).

```R
length(x [ x %% 2 == 0 ])

# Otra solución

sum(x%%2==0)

```

Ordenar los vectores, primero usando la función order() y luego la función sort().

```R
x[order(x)] # Ya que order devuelve los indices ordenados, no los valores
y[order(y)]
sort(x)
sort(y)
```

Seleccionar los valores de "y" menores que 600.

```R
y[y<600]
```


Crear las secuencias (funciones rep y seq):
    * 1 2 3 4 5 6 7 8 9 10.
    * 1 2 3 4 1 2 3 4 1 2 3 4.
    * -1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1.0

```R
seq(1, 10, 1)
rep(seq(1, 4, 1), 3)
seq(-1, 1, 0.2)
```

Crear el vector (x<sub>1</sub> + 2x<sub>2</sub> − x<sub>3</sub>, x<sub>2</sub> + 2x<sub>3</sub> − x<sub>4</sub>, ..., x<sub>n−2</sub> + 2x<sub>n−1</sub> − x<sub>n</sub>). Pista: tiene tamaño n - 2.

```R
a <- x[1:248]
b <- x[2:249]
c <- x[3: 250]
a + 2*b - c

# Otra solución
n <- 250
a <- x[1:(n-2)]
b <- x[2:(n-1)]
c <- x[3: n]
a + 2*b - cr
```