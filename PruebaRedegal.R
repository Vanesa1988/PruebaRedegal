
##Trabajaremos con la librería dplyr, que nos permite una fácil manipulación de dataframes

install.packages("dplyr")
library(dplyr)

##Introducimos los datos del fichero Yellow Taxi de enero del 2021, llamándolo "taxis",
##con Import Dataset from Text (base).
##También nos descargamos el archivo de zonas de taxis, ya que lo necesitaremos más adelante 
##para dar formato a nuestra tabla, y lo denominamos “zonas”. 
##Utilizamos como separator “Whitespace”.
##Eliminamos la "," de la columna LocationID.

zonas$LocationID.<-gsub(",","",zonas$LocationID.)

##Trabajamos, en primer lugar, con la columna trip_distance, que se corresponde con la
##distancia en millas informada por el taxímetro.
##Se nos pide que nos quedemos con aquellos que superan el percentil 95 en distancia.

distancia<- taxis$trip_distance

##Calculamos el percentil 0.95

percentil95<-quantile(distancia,c(.95))

##Hacemos el primer cribado de nuestros datos, quedándonos solo con aquellos que
##superan el percentil 95.Los introducimos en el dataframe "taxi95". 
##Se corresponden con aquellos que han superado una distancia de 8.74 millas
##(Podíamos haberlo hecho también utilizando "filter")

taxi95<-subset(taxis,trip_distance>percentil95)


##Ahora agrupamos por destinos y contamos el número de viajes a cada uno de ellos
##En este momento, introducimos en destinos2 los códigos de las zonas, para saber de cada
##DOLocationID (ID's de Destino)con qué barrio y zona se corresponden.

destinos<- group_by(taxi95,DOLocationID)   
destinos2<-summarise(destinos,trips= n())
destinos2<-merge(x=destinos2,y=zonas,by.x="DOLocationID",by.y="LocationID.")

##Ordenamos de forma descendente, en función del número de viajes

destinos3<-arrange(destinos2, desc(trips))

##Seleccionamos únicamente las tres columnas que nos interesan y las renombramos para
##que aparezcan como figura en nuestro enunciado

destinos4<-select(destinos3, trips, end_borough=Borough,end_zone=Zone)

##Nos quedamos con las 10 primeras filas, que se corresponderán con los 10 destinos
##que cuentan con mayor número de viajes, superando el percentil 0.95 en distancia.

destinos5<-destinos4[1:10,]


