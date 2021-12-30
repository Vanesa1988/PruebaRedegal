# PruebaRedegal
Trabajaremos con la librería dplyr, que nos permite una fácil manipulación de dataframes.

Introducimos los datos del fichero Yellow Taxi de enero del 2021, llamándolo "taxis",con Import Dataset from Text (base).
También nos descargamos el archivo de zonas de taxis, llamado taxi+_zone_lookup,que encontramos en la misma página que el fichero anterior, puesto que lo necesitaremos más adelante. 
Lo introducimos igualmente utilizando Import Dataset, con separator “Whitespace” y lo denominamos “zonas”.

Al insertar los datos de las zonas de taxis, la columna de ID's aparecerá con una coma después del número de código, por lo que la eliminamos (columna LocationID), utilizando gsub().

Trabajamos, en primer lugar, con la columna trip_distance, que se corresponde con la
distancia en millas informada por el taxímetro.
Se nos pide que nos quedemos con aquellos que superan el percentil 95 en distancia.

Hacemos el primer cribado de nuestros datos, quedándonos solo con aquellos que
superan el percentil 95.Los introducimos en el dataframe "taxi95". 
Se corresponden con aquellos que han superado una distancia de 8.74 millas
(Podíamos haberlo hecho también utilizando "filter").

Ahora agrupamos por destinos y contamos el número de viajes a cada uno de ellos.
En este momento, introducimos en destinos2 los códigos de las zonas, para saber de cada
DOLocationID (ID's de Destino)con qué barrio y zona se corresponden.

Ordenamos de forma descendente, en función del número de viajes.

Seleccionamos únicamente las tres columnas que nos interesan y las renombramos para
que aparezcan como figura en nuestro enunciado.

Nos quedamos con las 10 primeras filas, que se corresponderán con los 10 destinos
que cuentan con mayor número de viajes, superando el percentil 0.95 en distancia.
