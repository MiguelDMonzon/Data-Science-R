n <- 250
x <- sample(1:1000, n, replace=T)
y <- sample(1:1000, n, replace=T)

# 1. Calcular el máximo y el mínimo de los vectores x e y
max(x)
min(x)
max(y)
min(y)

# 2. Calcular la media de los vectores x e y. Antes de calcularla, ¿que valor esperarı́as?.
mean(x)
mean(y)

# 3. Calcula el número de elementos de x divisibles por 2 (el operador módulo es %%).
length(x [ x %% 2 == 0 ])

#   Otra solución
sum(x%%2==0)

# 4. Ordenar los vectores, primero usando la función order() y luego la función sort().
x[order(x)] #Ya que order devuelve los indices ordenados, no los valores
y[order(y)]
sort(x)
sort(y)

# 5. Seleccionar los valores de y menores que 600.
y[y<600]

# 6. Crear las secuencias (funciones rep y seq):
#   1 2 3 4 5 6 7 8 9 10.
#   1 2 3 4 1 2 3 4 1 2 3 4.
#   -1 -0.8 -0.6 -0.4 -0.2 0 0.2 0.4 0.6 0.8 1.0
seq(1, 10, 1)
rep(seq(1, 4, 1), 3)
seq(-1, 1, 0.2)

# 7. Crear el vector (x_1 + 2x_2 − x_3, x_2 + 2x_3 − x_4, ..., x_n−2 + 2x_n−1 − x_n)
#   Pista: tiene tamaño n − 2.
a <- x[1:248]
b <- x[2:249]
c <- x[3: 250]
a + 2*b - c

#   Otra solución
n <- 250
a <- x[1:(n-2)]
b <- x[2:(n-1)]
c <- x[3: n]
a + 2*b - c