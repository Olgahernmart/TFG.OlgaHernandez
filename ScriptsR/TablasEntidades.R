install.packages("readxl")
install.packages("xlsx")
library(readxl)
ruta <- "C:\\Users\\Olga\\Downloads\\casting.xlsx"
datos <- read_xlsx(ruta)

matriz <- NULL
k = 1
i = 1
# En el primer bucle ponemos la longitud del número de filas del dataframe, y en el segundo el número de columnas 
while (i < 100){
  j = 1
  while (j < 51){
    if (is.na(datos[i,j])){
      i  = i + 1
      j = 1}
    
    else {
      matriz[k] <- datos[i,j]
      k = k + 1 
      j = j + 1}
  }
  i = i + 1
}
matriz
m <- matrix(matriz, nrow = length(matriz), ncol = 1)
write.csv(x=m, file = 'C:\\Users\\Olga\\Downloads\\Actores.csv')
