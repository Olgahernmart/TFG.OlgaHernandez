install.packages("readxl")
install.packages("xlsx")
library(readxl)
file.choose()
#En este primer fichero tenemos en la primera columna los valores del show_id, y en la 
# segunda los nombres de los actores/directores/tem�ticas/pa�ses

ruta1 <- "C:\\Users\\Olga\\Downloads\\casting.xlsx"
datos1 <- read_xlsx(ruta1)
#En este segundo fichero tenemos en la primera columna escritos de forma individual cada
# nombre de los actores/directors/tem�ticas/pa�ses, y en la segunda columna el valor 
# num�rico �nico que toma cada registro. 
ruta2 <- "C:\\Users\\Olga\\Desktop\\TFG\\FicherosBD\\Actores.xlsx"
datos2 <- read_xlsx(ruta2)


#El vector1 es el nombre del actor/director/tem�tica/pa�s, el vector2 muestra los valores
# del show_id, y el vector3 la clave primaria asociada a cada actor/director/tem�tica/pa�s
vector1 <- NULL
vector2 <- NULL
vector3 <- NULL
k = 1
i = 1
while (i < 6098){
  for (j in 2:51){
    if (is.na(datos1[i,j])){
    next
    }
      
    else {
    vector2[k] <- datos1[i,1]
    vector1[k] <- datos1[i,j]
    for (s in 1:nrow(datos2)){
     if (datos1[i,j] == datos2[s,1]){
       vector3[k] <- datos2[s,2]
     }
      else{
        next
      }
    }
    k = k + 1
    }
  }
  i = i + 1
}

mat <- cbind(vector2, vector3)
write.csv(x=mat, file = 'C:\\Users\\Olga\\Downloads\\Interpretaciones.csv')

