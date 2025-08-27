# Pruebas de t
# Caso de MUESTRAS
# MAGT
# 27/08/2025

# Importar datos

calidad <- read.csv("Calidad_de_plantass.csv", header = T)

calidad$Tratamiento <- as.factor(calidad$Tratamiento)

boxplot(calidad$IE~ calidad$Tratamiento)
boxplot(calidad$IE~calidad$Tratamiento,
        col="skyblue",
        xlab="Tratamientos",
        ylab = "indice calidad",
        ylim=c(0.4,1.2),
        main= "vivero Inturbide")

# Estadisticas descriptivas
# tapply sirve para obtener iu n valor cuando contamos
# con varios grupos

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, var)

# Observamos que la varianza del grupo fert es 3 veces 
# más grande que el grupo control (Ctrl)

# Revisar el comportamiento de los datos
library("ggplot2")

ggplot(calidad, aes(x = IE, color = Tratamiento))+geom_density()


