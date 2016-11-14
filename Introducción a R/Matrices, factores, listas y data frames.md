
# Matrices #

Para crear matrices se utiliza el comando matrix(), al cual le vamos a pasar los valores,  el número de filas y el número de columnas deseado.


```R
m <- matrix(1:20, 5, 4)
z <- 1:3
print(z)
```

    [1] 1 2 3


Igualmente se puede inicializar escribiendo el nombre del parámetro opcional. De esa manera, se consigue cambiar el orden de los parámetros.


```R
m <- matrix(1:20, nrow = 5, ncol = 4)
#Es similar a
m <- matrix(1:20, ncol = 4, nrow = 5)
print(m)
```

         [,1] [,2] [,3] [,4]
    [1,]    1    6   11   16
    [2,]    2    7   12   17
    [3,]    3    8   13   18
    [4,]    4    9   14   19
    [5,]    5   10   15   20


Por defecto rellena los datos empezando por las columnas (columna a columna). Si se desea que rellene por filas, hay que especificar byrow = T.


```R
m <- matrix(1:20, 5, 4, byrow=T)
print(m)
```

         [,1] [,2] [,3] [,4]
    [1,]    1    2    3    4
    [2,]    5    6    7    8
    [3,]    9   10   11   12
    [4,]   13   14   15   16
    [5,]   17   18   19   20


Se puede obtener un vector con la longitud de cada una de las dimensiones de la matriz.


```R
print(dim(m))
print(is.vector(dim(m)))
print(length(dim(m)))
```

    [1] 5 4
    [1] TRUE
    [1] 2


Ese vector es igual de accesible que los vectores ya conocidos, por lo tanto se puede indexar para obtener información de él (número de filas, columnas, N dimensión, ...).


```R
nfilas <- dim(m)[1]
print(nfilas)
```

    [1] 5


Al igual que con los vectores, se pueden seleccionar un conjunto de elementos de la matriz. Si se desea observar las filas tres a la cinco y todas las columnas menos las columna dos:


```R
print(m[3:5, -2])
```

         [,1] [,2] [,3]
    [1,]    9   11   12
    [2,]   13   15   16
    [3,]   17   19   20


Si se desean "no tomar" algunas de las filas/columnas, se ha visto que se utiliza un - en el índice. Por ejemplo, si no se desea la columna dos, se pone en el índice -2. Si no se desean las columnas 2 y 3, se puede poner c(-2,-3) o -(2:3).


```R
print(m[3:5, -(2:3)])
```

         [,1] [,2]
    [1,]    9   12
    [2,]   13   16
    [3,]   17   20


Transponer poniendo primero la dimensión dos y después la dimensión uno.


```R
print(aperm(m, c(2,1)))
```

         [,1] [,2] [,3] [,4] [,5]
    [1,]    1    5    9   13   17
    [2,]    2    6   10   14   18
    [3,]    3    7   11   15   19
    [4,]    4    8   12   16   20


De forma más reducida, se puede utilizar t(), que es lo mismo que el caso particular aperm(x, c(2,1)).


```R
print(t(m))
```

         [,1] [,2] [,3] [,4] [,5]
    [1,]    1    5    9   13   17
    [2,]    2    6   10   14   18
    [3,]    3    7   11   15   19
    [4,]    4    8   12   16   20


Para realizar producto cruzado, el número de columnas de la primera matriz tiene que ser igual que el de la segunda.


```R
A <- matrix(1:20, 4, 5)
B <- matrix(1:20, 5, 4)
print(dim(A))
print(dim(B))
print(A %*% B)
```

    [1] 4 5
    [1] 5 4
         [,1] [,2] [,3] [,4]
    [1,]  175  400  625  850
    [2,]  190  440  690  940
    [3,]  205  480  755 1030
    [4,]  220  520  820 1120


La función crossprod es equivalente al operador %*% para hacer productos cruzados. No se le pasan los mismos parámetros ya que su funcionamiento es diferente (ver ?crossprod). Se puede utilizar para multiplicar una matriz por si misma:


```R
print(crossprod(A, A))
```

         [,1] [,2] [,3] [,4] [,5]
    [1,]   30   70  110  150  190
    [2,]   70  174  278  382  486
    [3,]  110  278  446  614  782
    [4,]  150  382  614  846 1078
    [5,]  190  486  782 1078 1374


Para obtener la diagonal de una matriz se utiliza la función diag()


```R
print(A)
print(diag(A))
```

         [,1] [,2] [,3] [,4] [,5]
    [1,]    1    5    9   13   17
    [2,]    2    6   10   14   18
    [3,]    3    7   11   15   19
    [4,]    4    8   12   16   20
    [1]  1  6 11 16


Si se desea cambiar la diagonal de A por unos:


```R
diag(A) <- rep(1, 4)
print(A)
```

         [,1] [,2] [,3] [,4] [,5]
    [1,]    1    5    9   13   17
    [2,]    2    1   10   14   18
    [3,]    3    7    1   15   19
    [4,]    4    8   12    1   20


# Factores #

Los factores son tipos de datos que se utilizan para codificar valores categóricos (hombre, mujer, alta, baja, media, ...). Para crear un factor, se utiliza la función factor(), pasándole un vector.


```R
sexo <- factor(c("hombre", "mujer", "hombre", "mujer", "mujer"))
print(sexo)
```

    [1] hombre mujer  hombre mujer  mujer 
    Levels: hombre mujer


Se puede generar un factor mucho más grande con muestreo aleatorio. Primero, se propone generar un vector de 20 elementos aleatorios con hombre y mujer.


```R
sexo <- sample(c("hombre", "mujer"), replace = T, 20)
print(sexo)
```

     [1] "hombre" "hombre" "hombre" "hombre" "mujer"  "hombre" "hombre" "hombre"
     [9] "hombre" "mujer"  "mujer"  "mujer"  "hombre" "mujer"  "mujer"  "mujer" 
    [17] "hombre" "mujer"  "mujer"  "hombre"



```R
print(is.vector(sexo))
print(is.character(sexo))
```

    [1] TRUE
    [1] TRUE


Para transformar el vector a factor, basta con pasar el vector por parámetro a la función factor()


```R
f <- factor(sexo)
print(f)
```

     [1] hombre hombre hombre hombre mujer  hombre hombre hombre hombre mujer 
    [11] mujer  mujer  hombre mujer  mujer  mujer  hombre mujer  mujer  hombre
    Levels: hombre mujer


Para obtener los valores diferentes de un vector, se utiliza la función unique().


```R
print(unique(sexo))
```

    [1] "hombre" "mujer" 


Mientras que en un factor, la función de resultado similar es levels(),


```R
print(levels(f))
```

    [1] "hombre" "mujer" 


Se le va a dar al factor un nombre más representativo: fsexo. Supóngase que se le va a preguntar por la calle la renta a una serie de hombres y mujeres, hasta 20 elementos. Las rentas son de 10.000, 20.000 o 30.000


```R
fsexo <- f
renta <- sample(c(10000, 20000, 30000), 20 , replace = T)
print(renta)
```

     [1] 20000 10000 30000 10000 30000 30000 20000 10000 10000 20000 30000 30000
    [13] 10000 20000 20000 20000 10000 10000 20000 20000


La media de las rentas, desagregada (sin tener en cuenta el sexo), es la siguiente:


```R
print(mean(renta))
```

    [1] 21000


Pero si se desea hallar la media agregada a un sexo, es decir, hallar la media de las mujeres y la media de los hombres, hay que aplicar la función media a cada uno de los sexos. Para ello se utiliza la función tapply(). Primero se le pasa los datos (renta), y después el factor sobre el que se quiere hacer la agregación (fsexo), y por último la función a aplicar (mean).


```R
print(tapply(renta, fsexo, FUN=mean))
```

      hombre    mujer 
    16363.64 22222.22 


Se puede obtener la renta de los dos sexos sin necesidad de aplicar la función tapply():


```R
print(mean(renta[fsexo == "hombre"]))
print(mean(renta[fsexo == "mujer"]))
```

    [1] 16363.64
    [1] 22222.22


# Listas #

Una lista es una colección ordenada de objetos del mismo o distinto tipo. Para crear una lista se utiliza la función list(), pasándole las claves que se desean y los valores. Se recuerda que no tienen por qué ser del mismo tipo...


```R
l <- list(a=4, b="hola", c=1:5, d=list(f=5))
print(length(l))
print(l)
```

    [1] 4
    $a
    [1] 4
    
    $b
    [1] "hola"
    
    $c
    [1] 1 2 3 4 5
    
    $d
    $d$f
    [1] 5
    
    


Para acceder al valor de los elementos, hay que indexar con dobles corchetes "[[]]". Se puede indexar con un número o con el nombre de la clave.


```R
print(l[[1]])
print(l[["d"]])
```

    [1] 4
    $f
    [1] 5
    


Si se utilizase solo un corchete "[]", se accede al elemento pero NO a su valor. Por ejemplo, si se indexa "c" con un corchete, devuelve un tipo lista, mientras que si se indexa con dos corchetes, devuelve el vector de valores numéricos.


```R
print(l["c"])
print(class(l["c"]))
print(l[["c"]])
print(class(l[["c"]]))
```

    $c
    [1] 1 2 3 4 5
    
    [1] "list"
    [1] 1 2 3 4 5
    [1] "integer"


Por lo tanto, sobre la lista que devuelve indexar con un corchete la variable "c", no se puede aplicar la media ya que la función mean() no aplica sobre listas, sino sobre vectores numéricos.


```R
print(mean(l["c"]))
```

    Warning message in mean.default(l["c"]):
    “argument is not numeric or logical: returning NA”

    [1] NA


Por lo tanto, para recoger el valor de ese elemento (el vector numérico), hay que utilizar los dobles corchetes:


```R
print(mean(l[["c"]]))
```

    [1] 3


Otra forma de acceder al valor de un elemento es indexando utilizando el dólar "$":


```R
print(l$d)
```

    $f
    [1] 5
    


En el caso anterior, se puede calcular la media del elemento "c" de la lista de forma directa mediante la indexación con el dólar: 


```R
print(mean(l$c))
```

    [1] 3


Por último, al igual que los vectores o las listas, se puede modificar el valor de un elemento, accediendo a él y asignándole un nuevo valor, ya sea del mismo tipo o no. En este ejemplo, se modifica el valor b = "hola" por el valor b = 2.


```R
l$b <- 2
print(l)
```

    $a
    [1] 4
    
    $b
    [1] 2
    
    $c
    [1] 1 2 3 4 5
    
    $d
    $d$f
    [1] 5
    
    


# Data frames #

Un data frame es una lista donde cada uno de sus elementos se conocen como variables. Se puede entender como una matriz donde sus columnas pueden ser de tipos diferentes. Para crear un data frame se utiliza la función data.frame():


```R
a <- 1:10
m <- matrix(1:20, 10, 2)
c <- rep("hola", 10)
print(a)
print(m)
print(c)
```

     [1]  1  2  3  4  5  6  7  8  9 10
          [,1] [,2]
     [1,]    1   11
     [2,]    2   12
     [3,]    3   13
     [4,]    4   14
     [5,]    5   15
     [6,]    6   16
     [7,]    7   17
     [8,]    8   18
     [9,]    9   19
    [10,]   10   20
     [1] "hola" "hola" "hola" "hola" "hola" "hola" "hola" "hola" "hola" "hola"



```R
df <- data.frame(a, m, c)
print(df)
```

        a X1 X2    c
    1   1  1 11 hola
    2   2  2 12 hola
    3   3  3 13 hola
    4   4  4 14 hola
    5   5  5 15 hola
    6   6  6 16 hola
    7   7  7 17 hola
    8   8  8 18 hola
    9   9  9 19 hola
    10 10 10 20 hola


También se puede crear un data frame con listas:


```R
l <- list(vector=21:30)
df <- data.frame(a, m, c, l)
print(df)
```

        a X1 X2    c vector
    1   1  1 11 hola     21
    2   2  2 12 hola     22
    3   3  3 13 hola     23
    4   4  4 14 hola     24
    5   5  5 15 hola     25
    6   6  6 16 hola     26
    7   7  7 17 hola     27
    8   8  8 18 hola     28
    9   9  9 19 hola     29
    10 10 10 20 hola     30


Como se puede observar, cada uno de los elementos que ha formado el data frame le ha aportado un conjunto de datos, en formato de columna. Por ello, la variable "a" le ha aportado la columna a, la variable "m", al ser una matriz de dos columnas, le ha aportado dos columnas al data frame, y como no tenían nombre, R les ha asignado los nombres X1 y X2. La variable "c" le ha aportado la columna c y la variable "l" le ha aportado su componente "vector".

Si se pasa a matrix (con as.matrix), trata de transformar todos los elementos al mismo tipo, y como "hola" no lo puede transformar a entero, transforma todo el data frame en una matriz de cadenas de caracteres:


```R
print(as.matrix(df))
```

          a    X1   X2   c      vector
     [1,] " 1" " 1" "11" "hola" "21"  
     [2,] " 2" " 2" "12" "hola" "22"  
     [3,] " 3" " 3" "13" "hola" "23"  
     [4,] " 4" " 4" "14" "hola" "24"  
     [5,] " 5" " 5" "15" "hola" "25"  
     [6,] " 6" " 6" "16" "hola" "26"  
     [7,] " 7" " 7" "17" "hola" "27"  
     [8,] " 8" " 8" "18" "hola" "28"  
     [9,] " 9" " 9" "19" "hola" "29"  
    [10,] "10" "10" "20" "hola" "30"  


El data frame transforma los vectores de cadenas de caracteres a factores:


```R
print(class(c))
print(class(df$c))
print(df$c)
```

    [1] "character"
    [1] "factor"
     [1] hola hola hola hola hola hola hola hola hola hola
    Levels: hola


Para no trabajar con data frames artificiales, se va a utilizar uno de los datasets cargados en R de forma predeterminadas, el dataset mtcars:


```R
print(mtcars)
```

                         mpg cyl  disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4           21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag       21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710          22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive      21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout   18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    Valiant             18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    Duster 360          14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    Merc 240D           24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    Merc 230            22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    Merc 280            19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    Merc 280C           17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    Merc 450SE          16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    Merc 450SL          17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    Merc 450SLC         15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    Cadillac Fleetwood  10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    Lincoln Continental 10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    Chrysler Imperial   14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    Fiat 128            32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    Honda Civic         30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    Toyota Corolla      33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    Toyota Corona       21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    Dodge Challenger    15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    AMC Javelin         15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    Camaro Z28          13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    Pontiac Firebird    19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    Fiat X1-9           27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    Porsche 914-2       26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    Lotus Europa        30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    Ford Pantera L      15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    Ferrari Dino        19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    Maserati Bora       15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    Volvo 142E          21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


Para observar el número de filas o de columnas del data frame:


```R
print(ncol(mtcars))
print(nrow(mtcars))
```

    [1] 11
    [1] 32


Para indexar el data frame a la hora de hacer selecciones, funciona de igual manera que con las matrices, con la particularidad que se le puede pasar como índice el nombre de la fila/columna:


```R
#Primera fila, primera columna
print(mtcars[1, 2])
#Primera fila, todas las columnas
print(mtcars[1, ])
#Fila que sea Mazda RX4, todas las columnas
print(mtcars["Mazda RX4", ])
```

    [1] 6
              mpg cyl disp  hp drat   wt  qsec vs am gear carb
    Mazda RX4  21   6  160 110  3.9 2.62 16.46  0  1    4    4
              mpg cyl disp  hp drat   wt  qsec vs am gear carb
    Mazda RX4  21   6  160 110  3.9 2.62 16.46  0  1    4    4


Cuando se quiere acceder a una columna indexando con un número, sin especificar la coma, se puede obtener, como en el ejemplo, la primera columna (mpg). Sin embargo, no devuelve el vector numérico, sino el data frame correspondiente a esa columna. Por lo tanto se recomienda, para seleccionar valores de una única columna, utilizar el dólar "$" (véase más adelante).


```R
print(mtcars[1])
print(class(mtcars[1]))
```

                         mpg
    Mazda RX4           21.0
    Mazda RX4 Wag       21.0
    Datsun 710          22.8
    Hornet 4 Drive      21.4
    Hornet Sportabout   18.7
    Valiant             18.1
    Duster 360          14.3
    Merc 240D           24.4
    Merc 230            22.8
    Merc 280            19.2
    Merc 280C           17.8
    Merc 450SE          16.4
    Merc 450SL          17.3
    Merc 450SLC         15.2
    Cadillac Fleetwood  10.4
    Lincoln Continental 10.4
    Chrysler Imperial   14.7
    Fiat 128            32.4
    Honda Civic         30.4
    Toyota Corolla      33.9
    Toyota Corona       21.5
    Dodge Challenger    15.5
    AMC Javelin         15.2
    Camaro Z28          13.3
    Pontiac Firebird    19.2
    Fiat X1-9           27.3
    Porsche 914-2       26.0
    Lotus Europa        30.4
    Ford Pantera L      15.8
    Ferrari Dino        19.7
    Maserati Bora       15.0
    Volvo 142E          21.4
    [1] "data.frame"


A la hora de indexar, se pueden utilizar vectores que representen las filas y columnas que se desean. Por ejemplo, si se desea obtener las columnas "mpg" y "cyl" del tercer y cuarto coche muestrados:


```R
print(mtcars[c(3,4), c("mpg", "cyl")])
```

                    mpg cyl
    Datsun 710     22.8   4
    Hornet 4 Drive 21.4   6


En cambio, si se desea obtener, para todos los coches, sus valores de "mpg" y "cyl":


```R
print(mtcars[, c("mpg", "cyl")])
```

                         mpg cyl
    Mazda RX4           21.0   6
    Mazda RX4 Wag       21.0   6
    Datsun 710          22.8   4
    Hornet 4 Drive      21.4   6
    Hornet Sportabout   18.7   8
    Valiant             18.1   6
    Duster 360          14.3   8
    Merc 240D           24.4   4
    Merc 230            22.8   4
    Merc 280            19.2   6
    Merc 280C           17.8   6
    Merc 450SE          16.4   8
    Merc 450SL          17.3   8
    Merc 450SLC         15.2   8
    Cadillac Fleetwood  10.4   8
    Lincoln Continental 10.4   8
    Chrysler Imperial   14.7   8
    Fiat 128            32.4   4
    Honda Civic         30.4   4
    Toyota Corolla      33.9   4
    Toyota Corona       21.5   4
    Dodge Challenger    15.5   8
    AMC Javelin         15.2   8
    Camaro Z28          13.3   8
    Pontiac Firebird    19.2   8
    Fiat X1-9           27.3   4
    Porsche 914-2       26.0   4
    Lotus Europa        30.4   4
    Ford Pantera L      15.8   8
    Ferrari Dino        19.7   6
    Maserati Bora       15.0   8
    Volvo 142E          21.4   4


Otra forma de indexar es mediante el dólar. Al igual que con las listas, se puede obtener directamente el valor de la columna especificada, poniendo su nombre sin comillas. Importante: con el dólar sólo se puede indexar una columna.


```R
print(mtcars$mpg)
```

     [1] 21.0 21.0 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 17.8 16.4 17.3 15.2 10.4
    [16] 10.4 14.7 32.4 30.4 33.9 21.5 15.5 15.2 13.3 19.2 27.3 26.0 30.4 15.8 19.7
    [31] 15.0 21.4


Una de las principales utilidades de indezar con el dólar es la facilidad para aplicar vectores lógicos, consiguiendo filtrar los datos del data frame. Por ejemplo, si se desea ver la información de los coches con mpg > 30:


```R
print(mtcars[mtcars$mpg > 30, ])
```

                    mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Fiat 128       32.4   4 78.7  66 4.08 2.200 19.47  1  1    4    1
    Honda Civic    30.4   4 75.7  52 4.93 1.615 18.52  1  1    4    2
    Toyota Corolla 33.9   4 71.1  65 4.22 1.835 19.90  1  1    4    1
    Lotus Europa   30.4   4 95.1 113 3.77 1.513 16.90  1  1    5    2


De igual forma se pueden reunir un conjunto de condiciones aplicando operadores lógicos (and,or, not):


```R
print(mtcars[mtcars$mpg > 30 & mtcars$gear == 4, ])
```

                    mpg cyl disp hp drat    wt  qsec vs am gear carb
    Fiat 128       32.4   4 78.7 66 4.08 2.200 19.47  1  1    4    1
    Honda Civic    30.4   4 75.7 52 4.93 1.615 18.52  1  1    4    2
    Toyota Corolla 33.9   4 71.1 65 4.22 1.835 19.90  1  1    4    1


Se puede cargar un data frame al entorno de trabajo en forma de objeto mediante la funcion attach(). De esta manera, se puede acceder a las columnas de ese data frame en forma de variables, ya que están ya cargadas en el entorno. Para deshacer esta carga, se utiliza detach().


```R
attach(mtcars)
print(gear) #Equivale a mtcars$gear
```

     [1] 4 4 4 3 3 3 3 4 4 4 4 3 3 3 3 3 3 4 4 4 3 3 3 3 3 4 5 5 5 5 5 4



```R
detach(mtcars)
print(gear)
```


    Error in print(gear): object 'gear' not found
    Traceback:


    1. print(gear)


Las funciones names(), colnames() y rownames() devuelven los nombres de las variables de las columnas o filas:


```R
print(names(mtcars))
print(colnames(mtcars))
print(rownames(mtcars))
```

     [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
    [11] "carb"
     [1] "mpg"  "cyl"  "disp" "hp"   "drat" "wt"   "qsec" "vs"   "am"   "gear"
    [11] "carb"
     [1] "Mazda RX4"           "Mazda RX4 Wag"       "Datsun 710"         
     [4] "Hornet 4 Drive"      "Hornet Sportabout"   "Valiant"            
     [7] "Duster 360"          "Merc 240D"           "Merc 230"           
    [10] "Merc 280"            "Merc 280C"           "Merc 450SE"         
    [13] "Merc 450SL"          "Merc 450SLC"         "Cadillac Fleetwood" 
    [16] "Lincoln Continental" "Chrysler Imperial"   "Fiat 128"           
    [19] "Honda Civic"         "Toyota Corolla"      "Toyota Corona"      
    [22] "Dodge Challenger"    "AMC Javelin"         "Camaro Z28"         
    [25] "Pontiac Firebird"    "Fiat X1-9"           "Porsche 914-2"      
    [28] "Lotus Europa"        "Ford Pantera L"      "Ferrari Dino"       
    [31] "Maserati Bora"       "Volvo 142E"         


Puesto que se puede acceder a un vector con los nombres de las variables, se pueden modificar. Por lo tanto, si se desea modificar el nombre de la primera variable de las columnas (mpg) a "millas/galon":


```R
colnames(mtcars)[1] <- "millas/galon"
print(mtcars)
```

                        millas/galon cyl  disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4                   21.0   6 160.0 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag               21.0   6 160.0 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710                  22.8   4 108.0  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive              21.4   6 258.0 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout           18.7   8 360.0 175 3.15 3.440 17.02  0  0    3    2
    Valiant                     18.1   6 225.0 105 2.76 3.460 20.22  1  0    3    1
    Duster 360                  14.3   8 360.0 245 3.21 3.570 15.84  0  0    3    4
    Merc 240D                   24.4   4 146.7  62 3.69 3.190 20.00  1  0    4    2
    Merc 230                    22.8   4 140.8  95 3.92 3.150 22.90  1  0    4    2
    Merc 280                    19.2   6 167.6 123 3.92 3.440 18.30  1  0    4    4
    Merc 280C                   17.8   6 167.6 123 3.92 3.440 18.90  1  0    4    4
    Merc 450SE                  16.4   8 275.8 180 3.07 4.070 17.40  0  0    3    3
    Merc 450SL                  17.3   8 275.8 180 3.07 3.730 17.60  0  0    3    3
    Merc 450SLC                 15.2   8 275.8 180 3.07 3.780 18.00  0  0    3    3
    Cadillac Fleetwood          10.4   8 472.0 205 2.93 5.250 17.98  0  0    3    4
    Lincoln Continental         10.4   8 460.0 215 3.00 5.424 17.82  0  0    3    4
    Chrysler Imperial           14.7   8 440.0 230 3.23 5.345 17.42  0  0    3    4
    Fiat 128                    32.4   4  78.7  66 4.08 2.200 19.47  1  1    4    1
    Honda Civic                 30.4   4  75.7  52 4.93 1.615 18.52  1  1    4    2
    Toyota Corolla              33.9   4  71.1  65 4.22 1.835 19.90  1  1    4    1
    Toyota Corona               21.5   4 120.1  97 3.70 2.465 20.01  1  0    3    1
    Dodge Challenger            15.5   8 318.0 150 2.76 3.520 16.87  0  0    3    2
    AMC Javelin                 15.2   8 304.0 150 3.15 3.435 17.30  0  0    3    2
    Camaro Z28                  13.3   8 350.0 245 3.73 3.840 15.41  0  0    3    4
    Pontiac Firebird            19.2   8 400.0 175 3.08 3.845 17.05  0  0    3    2
    Fiat X1-9                   27.3   4  79.0  66 4.08 1.935 18.90  1  1    4    1
    Porsche 914-2               26.0   4 120.3  91 4.43 2.140 16.70  0  1    5    2
    Lotus Europa                30.4   4  95.1 113 3.77 1.513 16.90  1  1    5    2
    Ford Pantera L              15.8   8 351.0 264 4.22 3.170 14.50  0  1    5    4
    Ferrari Dino                19.7   6 145.0 175 3.62 2.770 15.50  0  1    5    6
    Maserati Bora               15.0   8 301.0 335 3.54 3.570 14.60  0  1    5    8
    Volvo 142E                  21.4   4 121.0 109 4.11 2.780 18.60  1  1    4    2


En el caso de un data frame con una gran cantidad de variables, y no se sabe en qué posición está la variable cuyo nombre se desea cambiar, se puede buscar el índice dentro del vector de nombres del nombre a cambiar, y una vez obtenido, cambiarlo (which se verá en otros temas):


```R
indiceNombreBuscado <- which(colnames(mtcars) == "cyl")
colnames(mtcars)[indiceNombreBuscado] <- "cilindrada"
print(mtcars)
```

                         mpg cilindrada  disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4           21.0          6 160.0 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag       21.0          6 160.0 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710          22.8          4 108.0  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive      21.4          6 258.0 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout   18.7          8 360.0 175 3.15 3.440 17.02  0  0    3    2
    Valiant             18.1          6 225.0 105 2.76 3.460 20.22  1  0    3    1
    Duster 360          14.3          8 360.0 245 3.21 3.570 15.84  0  0    3    4
    Merc 240D           24.4          4 146.7  62 3.69 3.190 20.00  1  0    4    2
    Merc 230            22.8          4 140.8  95 3.92 3.150 22.90  1  0    4    2
    Merc 280            19.2          6 167.6 123 3.92 3.440 18.30  1  0    4    4
    Merc 280C           17.8          6 167.6 123 3.92 3.440 18.90  1  0    4    4
    Merc 450SE          16.4          8 275.8 180 3.07 4.070 17.40  0  0    3    3
    Merc 450SL          17.3          8 275.8 180 3.07 3.730 17.60  0  0    3    3
    Merc 450SLC         15.2          8 275.8 180 3.07 3.780 18.00  0  0    3    3
    Cadillac Fleetwood  10.4          8 472.0 205 2.93 5.250 17.98  0  0    3    4
    Lincoln Continental 10.4          8 460.0 215 3.00 5.424 17.82  0  0    3    4
    Chrysler Imperial   14.7          8 440.0 230 3.23 5.345 17.42  0  0    3    4
    Fiat 128            32.4          4  78.7  66 4.08 2.200 19.47  1  1    4    1
    Honda Civic         30.4          4  75.7  52 4.93 1.615 18.52  1  1    4    2
    Toyota Corolla      33.9          4  71.1  65 4.22 1.835 19.90  1  1    4    1
    Toyota Corona       21.5          4 120.1  97 3.70 2.465 20.01  1  0    3    1
    Dodge Challenger    15.5          8 318.0 150 2.76 3.520 16.87  0  0    3    2
    AMC Javelin         15.2          8 304.0 150 3.15 3.435 17.30  0  0    3    2
    Camaro Z28          13.3          8 350.0 245 3.73 3.840 15.41  0  0    3    4
    Pontiac Firebird    19.2          8 400.0 175 3.08 3.845 17.05  0  0    3    2
    Fiat X1-9           27.3          4  79.0  66 4.08 1.935 18.90  1  1    4    1
    Porsche 914-2       26.0          4 120.3  91 4.43 2.140 16.70  0  1    5    2
    Lotus Europa        30.4          4  95.1 113 3.77 1.513 16.90  1  1    5    2
    Ford Pantera L      15.8          8 351.0 264 4.22 3.170 14.50  0  1    5    4
    Ferrari Dino        19.7          6 145.0 175 3.62 2.770 15.50  0  1    5    6
    Maserati Bora       15.0          8 301.0 335 3.54 3.570 14.60  0  1    5    8
    Volvo 142E          21.4          4 121.0 109 4.11 2.780 18.60  1  1    4    2


# Ejercicio #

Con el data frame mtcars (viene cargado en R):

1. Previsualizar el contenido con la función head().
2. Mirar el número de filas y columnas con nrow() y ncol().
3. Crear un nuevo data frame con los modelos de coche que consumen menos de 15 millas/galón.
4. Ordenar el data frame anterior por disp.
5. Calcular la media de las marchas (gear) de los modelos del data frame anterior.
6. Cambiar los nombres de las variables del data frame a var1, var2, ..., var11.
Pista: Mirar la documentación de la función paste y usarla para generar el vector (“var1”, “var2”, ..., “varN”) donde N es el número de variables del data frame.


```R
#Retorna nombres de variables de mtcars por defecto
colnames(mtcars)[1] <- "mpg"
colnames(mtcars)[2] <- "cyl"
print(head(mtcars))
```

                       mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Mazda RX4         21.0   6  160 110 3.90 2.620 16.46  0  1    4    4
    Mazda RX4 Wag     21.0   6  160 110 3.90 2.875 17.02  0  1    4    4
    Datsun 710        22.8   4  108  93 3.85 2.320 18.61  1  1    4    1
    Hornet 4 Drive    21.4   6  258 110 3.08 3.215 19.44  1  0    3    1
    Hornet Sportabout 18.7   8  360 175 3.15 3.440 17.02  0  0    3    2
    Valiant           18.1   6  225 105 2.76 3.460 20.22  1  0    3    1



```R
print(nrow(mtcars))
print(ncol(mtcars))
```

    [1] 32
    [1] 11



```R
df <- mtcars[mtcars$mpg < 15,]
print(df)
```

                         mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Duster 360          14.3   8  360 245 3.21 3.570 15.84  0  0    3    4
    Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4
    Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4
    Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
    Camaro Z28          13.3   8  350 245 3.73 3.840 15.41  0  0    3    4



```R
df <- df[order(df$disp),]
print(df)
```

                         mpg cyl disp  hp drat    wt  qsec vs am gear carb
    Camaro Z28          13.3   8  350 245 3.73 3.840 15.41  0  0    3    4
    Duster 360          14.3   8  360 245 3.21 3.570 15.84  0  0    3    4
    Chrysler Imperial   14.7   8  440 230 3.23 5.345 17.42  0  0    3    4
    Lincoln Continental 10.4   8  460 215 3.00 5.424 17.82  0  0    3    4
    Cadillac Fleetwood  10.4   8  472 205 2.93 5.250 17.98  0  0    3    4



```R
print(mean(df$gear))
```

    [1] 3



```R
numVariables <- length(names(df))
nuevosNombres <- paste("var", 1:numVariables, sep="")
names(df) <- nuevosNombres
print(df)
```

                        var1 var2 var3 var4 var5  var6  var7 var8 var9 var10 var11
    Camaro Z28          13.3    8  350  245 3.73 3.840 15.41    0    0     3     4
    Duster 360          14.3    8  360  245 3.21 3.570 15.84    0    0     3     4
    Chrysler Imperial   14.7    8  440  230 3.23 5.345 17.42    0    0     3     4
    Lincoln Continental 10.4    8  460  215 3.00 5.424 17.82    0    0     3     4
    Cadillac Fleetwood  10.4    8  472  205 2.93 5.250 17.98    0    0     3     4

