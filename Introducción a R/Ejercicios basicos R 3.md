
# Scripts y carga de datos #

En el mismo directorio de trabajo, se va a crear una carpeta llamada "Scripts", y dentro se van a crear los scripts que se creen. Antes de comenzar, es importante conocer dos funciones que permiten imprimir por pantalla las variables dentro de scripts. Estas funciones son cat y print:


```R
a <- 6
b <- 7

cat(a, b)
print(a, b)
cat(b, a)
```

    6 7[1] 6
    7 6

Como se puede observar, la función cat() únicamente concatena los valores que se les pasa por parámetro, de modo que analiza en menor detalle esos objetos que se les pasa. En cambio, print() si que los analiza y además pinta fin de línea por defecto.

También es importante conocer cuál es el directorio de trabajo actual y cómo modificarlo, y se puede mediante getwd() y setwd().


```R
getwd()
#setwd("path")
```


'/home/migueld/Documents/Ciff Máster/Entornos Data Science: R/Sesion 3'


Como primera prueba se va a crear dentro de la carpeta "Scripts" un archivo llamado prueba.R, con el siguiente contenido:


```R
#prueba.R
a <- 6
print(a)
```

Para poder ejecutar ese script "externo", hay que utilizar la función source(), pasándole la ruta (respecto del entorno de trabajo) del script a ejecutar.


```R
source("Scripts/prueba.R")
```

    [1] 6


Una vez visto como cargar scripts, se va a escribir en disco un data frame para después leerlo, probando así la carga de datos. Esto se consigue con read.table() y write.table().


```R
m <- matrix(1: 60, 10, 6)
df <- as.data.frame(m)
print(class(m))
print(class(df))
print(head(df))
write.table(df, "prueba.txt", row.names = F)
```

    [1] "matrix"
    [1] "data.frame"
      V1 V2 V3 V4 V5 V6
    1  1 11 21 31 41 51
    2  2 12 22 32 42 52
    3  3 13 23 33 43 53
    4  4 14 24 34 44 54
    5  5 15 25 35 45 55
    6  6 16 26 36 46 56


Ya se ha escrito en el archivo "prueba.txt" el contenido del data frame. Es momento de realizar la carga de los datos. Puesto que write.table() lo ha almacenado en forma tabular, se puede realizar la carga utilizando read.table().


```R
dfnew <- read.table("prueba.txt")
print(dfnew)
```

       V1 V2 V3 V4 V5 V6
    1  V1 V2 V3 V4 V5 V6
    2   1 11 21 31 41 51
    3   2 12 22 32 42 52
    4   3 13 23 33 43 53
    5   4 14 24 34 44 54
    6   5 15 25 35 45 55
    7   6 16 26 36 46 56
    8   7 17 27 37 47 57
    9   8 18 28 38 48 58
    10  9 19 29 39 49 59
    11 10 20 30 40 50 60


Como se puede observar, hay algo incorrecto: ha tomado la primera linea del fichero grabado (V1, V2, ....) como una fila de datos, cuando realmente representaba el nombre de las columnas. Por lo tanto, la carga se tiene que realizar con Header = True (por defecto su valor es False), indicando así que la primera línea de datos es la que define el nombre de las columnas del data frame.


```R
dfnew <- read.table("prueba.txt", header = T)
print(dfnew)
```

       V1 V2 V3 V4 V5 V6
    1   1 11 21 31 41 51
    2   2 12 22 32 42 52
    3   3 13 23 33 43 53
    4   4 14 24 34 44 54
    5   5 15 25 35 45 55
    6   6 16 26 36 46 56
    7   7 17 27 37 47 57
    8   8 18 28 38 48 58
    9   9 19 29 39 49 59
    10 10 20 30 40 50 60


Para saber cuanto tarda en ejecutarse una expresión en R, se puede utilizar system.time().


```R
print(system.time(dfnew <- read.table('prueba.txt', header = T)))
```

       user  system elapsed 
      0.000   0.000   0.091 


# Definición de funciones #

Para crear una función, el primer paso de definición consiste en una asignación hacia el nombre que se quiere que tenga la función. A esta asignación se le da el valor de aplicar la función "function" pasándole los parámetros que se desea que recoja la función. En el ejemplo, se va a definir una función que realiza el cuadrado de un número:


```R
mi_funcion <- function(x) x^2
print(mi_funcion(1:10))
```

     [1]   1   4   9  16  25  36  49  64  81 100


Por defecto, las funciones siempren devuelve el resultado de la ejecución de la última línea de código. Por ejemplo:


```R
mi_funcion <- function(x){
    x^2
    6
}
print(mi_funcion(1:10))
```

    [1] 6


Por ello, se puede definir el parámetro que se quiere devolver, y se hace con return(). Tras llegar a return(), sale de la función devolviendo el valor, por lo que no devolverá líneas siguientes.


```R
mi_funcion <- function(x){
    return(x^2)
    6
}
print(mi_funcion(1:10))
```

     [1]   1   4   9  16  25  36  49  64  81 100


Un ejemplo para el cálculo de la media:


```R
media <- function(x){
    ret <- sum(x)/length(x)
    return(ret)
}
```

Sin embargo, se puede escribir de tres maneras diferentes, gracias a que R devuelve siempre la ejecución de la última línea:


```R
media <- function(x){
    ret <- sum(x)/length(x)
    ret
}
```


```R
media <- function(x){
    sum(x)/length(x)
}
```


```R
media <- function(x) sum(x)/length(x)
```

# Ejecuciones condicionales y bucles #

La ejecución condicional básica es "IF". La sintaxis principal es if(cond) expr_true else expr_false. Se pueden analizar más condiciones utilizando else if(), aplicando así la evaluación de otra condición al mismo nivel que el if() principal.


```R
# Si a es menor que 10, pintar "a es menor de 10"
# Si no, si es igual que 10, pintar "a es igual a 10"
# Si no, pintar "a es mayor de 10"
a <- 3
if(a < 10) {
    print("a es menor de 10")
} else if (a == 10) {
    print("a es igual a 10")
} else {
    print("a es mayor que 10")
}
```

    [1] "a es menor de 10"


También se puede utilizar la función ifelse(), que es la operación if() vectorizada. El primer parámetro que se le pasa es la condición, el segundo es el valor que se desea que se devuelva en caso de que la condición se cumpla, y el tercer valor es el que devolverá en caso de que no se cumpla la condición:


```R
# Dado un vector de números de 1 a 10, si el elemento es menor de 5 devolver su valor en el vector
# Si no, devolver 0
v <- 1:10
print(ifelse(v>5, v, 0))
```

     [1]  0  0  0  0  0  6  7  8  9 10


Los bucles "For" iteran sobre los elementos de una lista, factor..., de una colección que contiene una serie de elementos. También se puede recorrer en forma de contador, por ejemplo, si se quieren 10 iteraciones, desde i = 1 hasta 10. La sintazis es: for (var in seq) { expresiones }.


```R
# Se desean 10 iteraciones, que pinte los números del 1 al 10.
# Por cada elemento en el vector v, printar el elemento y pasar al siguiente (implícito)
v <- 1: 10
for(elem in v){
    print(elem)
}
```

    [1] 1
    [1] 2
    [1] 3
    [1] 4
    [1] 5
    [1] 6
    [1] 7
    [1] 8
    [1] 9
    [1] 10



```R
# Pintar todos los nombres de la lista (no se especifica cantidad de iteraciones)
lista <- c("Pepe", "Ramon", "Maria")
for(nombre in lista){
    print(nombre)
}
```

    [1] "Pepe"
    [1] "Ramon"
    [1] "Maria"


Si se desea recorrer un vector conociendo en todo momento el índice para acceder por indexación a un valor, se puede recorrer un índice de 1 hasta la longitud del vector, o bien utilizar la función seq_along().


```R
for (i in 1:length(v)){
    print(v[i])
}
```

    [1] 1
    [1] 2
    [1] 3
    [1] 4
    [1] 5
    [1] 6
    [1] 7
    [1] 8
    [1] 9
    [1] 10



```R
for (i in seq_along(v)){
    print(v[i])
}
```

    [1] 1
    [1] 2
    [1] 3
    [1] 4
    [1] 5
    [1] 6
    [1] 7
    [1] 8
    [1] 9
    [1] 10


Cuando se quiere realizar iteraciones mientras una condición se cumple (no se conoce de antemano el número de iteraciones), se utiliza el bucle "While". La sintaxis es: while (cond) { expresiones }.


```R
# Mientras el contador sea menor que 4, pintarlo e incrementarlo en 1
contador <- 0
while(contador < 4){
    print(contador)
    contador <- contador +1
}
```

    [1] 0
    [1] 1
    [1] 2
    [1] 3


# Vectorizacion de funciones #

Si se desea que una función, definida por el programador o no, aplique elemento a elemento sobre vectores, matrices, data frames... hay que vectorizarla. La forma más general es utilizando la función apply(). 

Por ejemplo, la función colMeans() calcula la media de cada una de las columnas de un data frame, en este caso, mtcars. Pero se puede utilizar apply() para que aplique la media sobre cada una de las columnas del data frame (hay que especificar la dimensión 2).


```R
print(colMeans(mtcars))
```

           mpg        cyl       disp         hp       drat         wt       qsec 
     20.090625   6.187500 230.721875 146.687500   3.596563   3.217250  17.848750 
            vs         am       gear       carb 
      0.437500   0.406250   3.687500   2.812500 



```R
# 2 es la dimensión sobre la que quiere aplicar (columnas)
print(apply(mtcars, 2, mean))
```

           mpg        cyl       disp         hp       drat         wt       qsec 
     20.090625   6.187500 230.721875 146.687500   3.596563   3.217250  17.848750 
            vs         am       gear       carb 
      0.437500   0.406250   3.687500   2.812500 


La función lapply() aplica una función sobre todos los elementos de una lista, devolviendo otra lista:


```R
print(lapply(mtcars, mean))
```

    $mpg
    [1] 20.09062
    
    $cyl
    [1] 6.1875
    
    $disp
    [1] 230.7219
    
    $hp
    [1] 146.6875
    
    $drat
    [1] 3.596563
    
    $wt
    [1] 3.21725
    
    $qsec
    [1] 17.84875
    
    $vs
    [1] 0.4375
    
    $am
    [1] 0.40625
    
    $gear
    [1] 3.6875
    
    $carb
    [1] 2.8125
    


Si se desea que la función lapply() devuelva un vector en vez de una lista, se utiliza sapply().


```R
print(sapply(mtcars, mean))
```

           mpg        cyl       disp         hp       drat         wt       qsec 
     20.090625   6.187500 230.721875 146.687500   3.596563   3.217250  17.848750 
            vs         am       gear       carb 
      0.437500   0.406250   3.687500   2.812500 


Para aplicar una función sobre diferentes subgrupos, se utiliza tapply(). Por ejemplo, calcular la renta de un grupo de 20 personas pero agrupado por sexo.


```R
# Vector que indica el sexo de una persona (de un muestreo aleatorio)
sexo <- sample(c("hombre", "mujer"), replace = T, 20)
fsexo <- factor(sexo)
print(fsexo)
# Vector que indica la renta de una persona (de un muestreo aleatorio)
renta <- sample(c(10000, 20000, 30000), 20 , replace = T)
print(renta)
print(tapply(renta, fsexo, FUN=mean))
```

     [1] mujer  hombre hombre mujer  hombre hombre hombre mujer  mujer  mujer 
    [11] mujer  mujer  mujer  mujer  mujer  hombre mujer  mujer  hombre mujer 
    Levels: hombre mujer
     [1] 10000 20000 10000 10000 10000 30000 10000 10000 30000 30000 30000 30000
    [13] 20000 20000 10000 10000 20000 30000 10000 20000
      hombre    mujer 
    14285.71 20769.23 


# Ejercicio #

Escribir una función mediaColumnas que calcule la media de las columnas de un data.frame que se pasa como argumento usando un bucle y las devuelva en un vector. La función debe comprobar que el argumento es un data.frame.


```R
mediaColumnas <- function(df){
    if(!is.data.frame(df)){
        return(NA)
    }
    # Para más eficiencia, como se conoce el tamaño del vector
    # resultante, mejor reservar en memoria un vector de ese tamaño
    # en vez de crear una matriz vacía e ir añadiéndole elementos.
    output <- numeric(ncol(df))
    for(i in 1:ncol(df)){
        output[i] <- mean(df[,i])
    }
    return(output)
}

```

Cargar el fichero random.data en R.


```R
# La carga sería la siguiente línea
# df <- read.table("random.data")
# Puesto que está tardando mucho en cargarla, se crea un data frame de datos equivalente
df <- as.data.frame(matrix(rnorm(1000000), 10, 100000))
#print(head(df))
```

Utilizar la función anterior para calcular la media de las columnas de los datos del fichero.


```R
media_columnas_propia <- mediaColumnas(df)
```

Hacer la misma operación anterior pero ahora con la función sapply.


```R
media_columnas_sapply <- sapply(df, mean)
```

Comprobar que los resultados de los dos procedimientos anteriores son el mismo, y coincide también con el resultado de usar la función colMeans.


```R
# Una forma sería comparando ambos resultados, pero eso devolvería una matriz muy grande que no conviene mostrar.
# Además, de esa forma para asegurarse hay que mirar de 1 en 1 todas los resultados esperando que sean True
# print(media_columnas_propia == colMeans(df))
# Por lo tanto, es mas recomendable realizar una resta de los valores de ambos resultados, y sumar todos los valores
# resultantes. Si ese valor es 0 (o muy cercano a 0 debido al posible error de representación de reales), significa
# que ambos son iguales.
sum(media_columnas_propia - media_columnas_sapply)
```


0



```R
sum(media_columnas_propia - colMeans(df))
```


-3.17637355220363e-21


Comparar el tiempo de ejecución de los tres procedimientos anteriores.


```R
print(system.time(media_columnas_propia <- mediaColumnas(df)))
```

       user  system elapsed 
     26.632   0.000  26.632 



```R
print(system.time(media_columnas_sapply <- sapply(df, mean)))
```

       user  system elapsed 
      1.116   0.000   1.115 



```R
print(system.time(colMeans(df)))
```

       user  system elapsed 
      1.000   0.000   1.001 

