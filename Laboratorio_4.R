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
tapply(calidad$IE, calidad$Tratamiento, sd)

# Separar los datos por tratamiento usando subset

df_ctlr <- subset(calidad, Tratamiento == "Ctrl")
df_fert <- subset(calidad, Tratamiento != "Ctrl")

# qqnorm revisar normalidad
par(mfrow =c(1, 2))
qqnorm(df_ctlr$IE); qqline(df_ctlr$IE)
qqnorm(df_fert$IE); qqline(df_fert$IE)
par(mfrow = c(1, 1))


# prueba de normalidad

shapiro.test(df_ctlr$IE)
shapiro.test(df_fert$IE)

# Revisar homogeniedad de varianzas
var.test(df_ctlr$IE, df_fert$IE)
var.test(calidad$IE ~ calidad$Tratamiento)

# Aplicar la prueba de t, varianzas iguales
# dos colas = two.sided

t.test(calidad$IE ~ calidad$Tratamiento, 
       var.equal = T,
       alternative = "two.sided")

# Medir el efecto

cohens_efecto <- function(x, y) {
  n1 <- length(x); n2 <- length(y) 
  s1 <-sd(x); s2 <- sd(y) 
  sp <- sqrt(((n1 -1)*s1^2+(n2-1)*s2^2)/(n1+n2-2))
  (mean(x) - mean(y)) / sp
  }

d_cal <- cohens_efecto(df_ctlr$IE, df_fert$IE)














