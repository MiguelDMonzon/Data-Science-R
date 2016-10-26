
# Introducción #
En este apartado se realizarán algunos ejemplos de código de R con el que interactuar para coger contacto con el lenguaje.

## Vectores ##

Para crear un vector, se utiliza el comando c(), pasándole los elementos que conforman el vector:


```R
c(4,5,6)
```


<ol class=list-inline>
	<li>4</li>
	<li>5</li>
	<li>6</li>
</ol>



El vector se puede almacenar en una variable, para luego consultarla. Por ejemplo, se puede consultar su longitud:


```R
a <- c(4,5,6)
length(a)
```


3


Los vectores pueden definirse con tipos diferentes, pero R tratará de realizar conversiones para que queden del mismo tipo. Primero intentará transformar "Hola" a tipo entero, pero como no puede, intenta transformar 4 a tipo cadena, consiguiéndolo:


```R
c(4, "Hola")
```


<ol class=list-inline>
	<li>'4'</li>
	<li>'Hola'</li>
</ol>



Otra forma de crear un vector es mediante vector(), especificándole el tipo del vector y el número de elementos. Si se desea un vector numérico de 10 elementos:


```R
vector("numeric", 10)
```


<ol class=list-inline>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
	<li>0</li>
</ol>



Otra forma más de crear un vector es escribiendo su tipo y la longitud que se desea. Por ejemplo, para un vector de 5 caracteres:


```R
character(5)
```


<ol class=list-inline>
	<li>''</li>
	<li>''</li>
	<li>''</li>
	<li>''</li>
	<li>''</li>
</ol>



R admite operaciones entre vectores, actuando elemento a elemento. Por ejemplo, para realizar la suma entre dos vectores numéricos, uno que abarca entre el 1 y el 10 y otro entre el 31 y el 40 es:


```R
a <- 1:10
b <- 31:40
a + b
```


<ol class=list-inline>
	<li>32</li>
	<li>34</li>
	<li>36</li>
	<li>38</li>
	<li>40</li>
	<li>42</li>
	<li>44</li>
	<li>46</li>
	<li>48</li>
	<li>50</li>
</ol>



En el ejemplo anterior, los dos vectores son del mismo tamaño. R también permite la suma entre dos vectores de diferente tamaño, haciendo que el vector más pequeño se repita de nuevo hasta cubrir la longitud del vector más grande:


```R
a <- 1:10
b <- 1:5
a + b
```


<ol class=list-inline>
	<li>2</li>
	<li>4</li>
	<li>6</li>
	<li>8</li>
	<li>10</li>
	<li>7</li>
	<li>9</li>
	<li>11</li>
	<li>13</li>
	<li>15</li>
</ol>



###Secuencias y repeticiones###

Para crear secuencias, se utiliza el comando seq(). A este comando se le pasa por parámetro el valor inicial, el valor final y el paso(step) o variación entre cada uno de los elementos hasta llegar al valor final.
Por ejemplo, para crear una secuencia del 1 al 10 sumando de 1 en 1:


```R
seq(1, 10, 1)
```


<ol class=list-inline>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
	<li>6</li>
	<li>7</li>
	<li>8</li>
	<li>9</li>
	<li>10</li>
</ol>



Si en cambio se desea que sumen de 2 en 2:


```R
seq(1, 10, 2)
```


<ol class=list-inline>
	<li>1</li>
	<li>3</li>
	<li>5</li>
	<li>7</li>
	<li>9</li>
</ol>



También se puede hacer que el paso sea un número real y no entero:


```R
seq(1, 10, 0.5)
```


<ol class=list-inline>
	<li>1</li>
	<li>1.5</li>
	<li>2</li>
	<li>2.5</li>
	<li>3</li>
	<li>3.5</li>
	<li>4</li>
	<li>4.5</li>
	<li>5</li>
	<li>5.5</li>
	<li>6</li>
	<li>6.5</li>
	<li>7</li>
	<li>7.5</li>
	<li>8</li>
	<li>8.5</li>
	<li>9</li>
	<li>9.5</li>
	<li>10</li>
</ol>



Otra forma de crear una secuencia, es declarar los valores inicial y final, y también el número de elementos que se desea que tenga esa secuencia.
Si se desea una secuencia de números entre el 1 y el 10, y que genere 100 elementos:


```R
seq(1, 10, length.out=100)
```


<ol class=list-inline>
	<li>1</li>
	<li>1.09090909090909</li>
	<li>1.18181818181818</li>
	<li>1.27272727272727</li>
	<li>1.36363636363636</li>
	<li>1.45454545454545</li>
	<li>1.54545454545455</li>
	<li>1.63636363636364</li>
	<li>1.72727272727273</li>
	<li>1.81818181818182</li>
	<li>1.90909090909091</li>
	<li>2</li>
	<li>2.09090909090909</li>
	<li>2.18181818181818</li>
	<li>2.27272727272727</li>
	<li>2.36363636363636</li>
	<li>2.45454545454545</li>
	<li>2.54545454545455</li>
	<li>2.63636363636364</li>
	<li>2.72727272727273</li>
	<li>2.81818181818182</li>
	<li>2.90909090909091</li>
	<li>3</li>
	<li>3.09090909090909</li>
	<li>3.18181818181818</li>
	<li>3.27272727272727</li>
	<li>3.36363636363636</li>
	<li>3.45454545454545</li>
	<li>3.54545454545455</li>
	<li>3.63636363636364</li>
	<li>3.72727272727273</li>
	<li>3.81818181818182</li>
	<li>3.90909090909091</li>
	<li>4</li>
	<li>4.09090909090909</li>
	<li>4.18181818181818</li>
	<li>4.27272727272727</li>
	<li>4.36363636363636</li>
	<li>4.45454545454546</li>
	<li>4.54545454545454</li>
	<li>4.63636363636364</li>
	<li>4.72727272727273</li>
	<li>4.81818181818182</li>
	<li>4.90909090909091</li>
	<li>5</li>
	<li>5.09090909090909</li>
	<li>5.18181818181818</li>
	<li>5.27272727272727</li>
	<li>5.36363636363636</li>
	<li>5.45454545454546</li>
	<li>5.54545454545455</li>
	<li>5.63636363636364</li>
	<li>5.72727272727273</li>
	<li>5.81818181818182</li>
	<li>5.90909090909091</li>
	<li>6</li>
	<li>6.09090909090909</li>
	<li>6.18181818181818</li>
	<li>6.27272727272727</li>
	<li>6.36363636363636</li>
	<li>6.45454545454546</li>
	<li>6.54545454545455</li>
	<li>6.63636363636364</li>
	<li>6.72727272727273</li>
	<li>6.81818181818182</li>
	<li>6.90909090909091</li>
	<li>7</li>
	<li>7.09090909090909</li>
	<li>7.18181818181818</li>
	<li>7.27272727272727</li>
	<li>7.36363636363636</li>
	<li>7.45454545454546</li>
	<li>7.54545454545455</li>
	<li>7.63636363636364</li>
	<li>7.72727272727273</li>
	<li>7.81818181818182</li>
	<li>7.90909090909091</li>
	<li>8</li>
	<li>8.09090909090909</li>
	<li>8.18181818181818</li>
	<li>8.27272727272727</li>
	<li>8.36363636363636</li>
	<li>8.45454545454546</li>
	<li>8.54545454545455</li>
	<li>8.63636363636364</li>
	<li>8.72727272727273</li>
	<li>8.81818181818182</li>
	<li>8.90909090909091</li>
	<li>9</li>
	<li>9.09090909090909</li>
	<li>9.18181818181818</li>
	<li>9.27272727272727</li>
	<li>9.36363636363636</li>
	<li>9.45454545454546</li>
	<li>9.54545454545454</li>
	<li>9.63636363636364</li>
	<li>9.72727272727273</li>
	<li>9.81818181818182</li>
	<li>9.90909090909091</li>
	<li>10</li>
</ol>



Se pueden realizar repeticiones de arrays mediante el uso del comando rep(). Se le pasa el vector a repetir junto el número de repeticiones deseadas. Para repetir 10 veces el array (1,2,3,4):


```R
rep(c(1, 2, 3, 4), 10)
```


<ol class=list-inline>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
</ol>



###Selección de elementos e indexación###

Una vez definido el vector, se pueden seleccionar elementos del mismo. Una forma es mediante el índice de ese vector, empezando desde el primer elemento con índice 1. Por lo tanto, para obtener el primer elemento del vector:


```R
a <- 40:50
a[1]
```


40


También se pueden seleccionar un conjunto de elementos del vector, mediante un conjunto de índices. En el ejemplo, se seleccionan los cinco primeros elementos del vector anterior, de la forma indiceMenor:indiceMayor, abarcando el rango de índices [1..5]:


```R
a[1:5]
```


<ol class=list-inline>
	<li>40</li>
	<li>41</li>
	<li>42</li>
	<li>43</li>
	<li>44</li>
</ol>



En vez de un rango, se puede especificar un vector de indices, el cual no tiene por qué ser ordenado, para seleccionar los elementos correspondientes a esos índices:


```R
a[ c(4,1,7,7) ]
```


<ol class=list-inline>
	<li>43</li>
	<li>40</li>
	<li>46</li>
	<li>46</li>
</ol>



Otra forma de selección de elementos de un vector es la aplicación sobre él de un vector lógico (de valores booleanos, True o False). Así, se consigue seleccionar únicamente los elementos que corresponden a valores True.


```R
a[ c(T, F, T, T, T, T, F, F, T ,T) ]
```


<ol class=list-inline>
	<li>40</li>
	<li>42</li>
	<li>43</li>
	<li>44</li>
	<li>45</li>
	<li>48</li>
	<li>49</li>
	<li>50</li>
</ol>



Si se quisiese obtener, por ejemplo, los elementos de a mayores de 45, es necesario aplicar el vector lógico para no mostrar los elementos que no cumplan la condición. Y para obtener ese vector lógico, basta con realizar la condición a > 45.
Tras ejecutar ```a > 45``` se obtiene el resultado de preguntar a cada uno de los elementos de a si es mayor que 45, de ahí como resultado el vector lógico a aplicar:


```R
a[a > 45]
```


<ol class=list-inline>
	<li>46</li>
	<li>47</li>
	<li>48</li>
	<li>49</li>
	<li>50</li>
</ol>



Por último, se puede modificar el valor de un elemento del vector, asignándole al elemento un valor nuevo.


```R
a[2] <- 5
a
```


<ol class=list-inline>
	<li>40</li>
	<li>5</li>
	<li>42</li>
	<li>43</li>
	<li>44</li>
	<li>45</li>
	<li>46</li>
	<li>47</li>
	<li>48</li>
	<li>49</li>
	<li>50</li>
</ol>



###Ejercicio 1###
Ejecutar el siguiente código en R, que genera dos vectores de enteros aleatorios elegidos entre el 1 y el 1000 de tamaño 250:


```R
n <- 250
x <- sample(1:1000, n, replace=T)
y <- sample(1:1000, n, replace=T)
```

A partir de los dos vectores anteriores:

1. Calcular el máximo y el mı́nimo de los vectores x e y.

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

    Pista: tiene tamaño n - 2.
