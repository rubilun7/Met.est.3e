############################
# Parte 1: Importar datos
##############################

dbh <- c(16.5, 25.3, 22.1, 17.2, 16.1, 8.1, 34.3,
         5.4, 5.7, 11.2, 24.1, 14.5, 7.7, 15.6, 15.9,
         10, 17.5, 20.5, 7.8, 27.3, 9.7, 6.5, 23.4,
         8.2, 28.5, 10.4, 11.5, 14.3, 17.2, 16.8)

url <-"https://repodatos.atdt.gob.mx/api_update/senasica/actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv"
inspeccion <-read.csv(url) 

head(inspeccion)
prof_url_2 <- paste0("https://repodatos.atdt.gob.mx/api_update/senasica/",
                     "actividades_inspeccion_movilizacion/",
                     "29_actividades-inspeccion-movilizacion.csv")
senasica <- read.csv(prof_url_2)
head(senasica)

# No olvidar cargar la paquetería
library(repmis)
conjunto <- source_data("https://www.dropbox.com/s/hmsf07bbayxv6m3/cuadro1.csv?dl=1")

head(conjunto) # muestra las primeras seis filas de la BD
library(readr)
file <- paste0("https://raw.githubusercontent.com/mgtagle/",
               "202_Analisis_Estadistico_2020/master/cuadro1.csv")
inventario <- read_csv(file)
head(inventario)

#############################################
# Parte 2: Operaciones con la base de datos 
#############################################
parcelas <- gl(3,7)
parcelas

#se agrego una cifra de dbh para completar los 21 datos
trees <- seq(1,21)
dbh <- c(16.5, 25.3, 22.1, 17.2, 16.1, 8.1, 34.3, 5.4, 5.7, 11.2, 9.7, 6.5, 23.4, 
         8.2, 28.5, 10.4, 11.5, 14.3, 17.2, 16.8,17.4)

trees <- data.frame(trees,dbh,parcelas)
View(trees)
trees

# Agrega el vector dbh como nueva columna en el data frame trees
trees$dbh <- dbh

# El signo de $ informa que necesitamos la columna dbh
mean(trees$dbh)
sd(trees$dbh)

# Indica la sumatoria de los individuos en el objeto tree con un dbh < a 10
sum(trees$dbh < 10)
which(trees$dbh < 10)
trees.13 <- trees[!(trees$parcela=="2"),]
trees.13
trees.1 <- subset(trees, dbh <= 10)
head(trees.1)
mean(trees$dbh)
mean(trees.1$dbh)
######################################
# Parte 3: Representación gráfica
######################################
mamiferos <- read.csv("https://www.openintro.org/data/csv/mammals.csv")

# Histograma
hist(mamiferos$total_sleep)
hist(mamiferos$total_sleep, # Datos
     xlim = c(0,20), ylim = c(0,14), # Cambiar los límites de x & y
     main = "Total de horas sueño de las 39 especies", # Cambiar el título
     xlab = "Horas sueño", # Cambiar eje de las x
     ylab = "Frecuencia", # Cambiar eje de las y
     las = 1, # Cambiar orientación de y 
     col = "brown") # Cambiar color de las barras
# Barplot
data("chickwts")
head(chickwts[c(1:2,42:43, 62:64), ])
feeds <- table(chickwts$feed)
feeds
barplot(feeds)
barplot(feeds, col =  c("brown", "cadetblue1", "darkseagreen", "coral",
                        "darkslategray3", "lightskyblue1"))
barplot(feeds[order(feeds, decreasing = TRUE)], col =  c("brown", "cadetblue1",
            "darkseagreen", "coral", "darkslategray3", "lightskyblue1"))


barplot(feeds[order(feeds)], horiz = TRUE, 
        col = c("skyblue","brown","cadetblue1","darkseagreen","coral","darkslategray3"),
        main = "Horas de sueño de las especies", 
        xlab = "Número de horas", 
        las = 1)


winget install --id Git.Git -e --source winget
git config --global user.name "Valeria Rubi Luna Bazaldua"
git config --global user.email "lunabazalduav@gmail.com"






