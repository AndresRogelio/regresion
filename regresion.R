# Ejemplo de regresión lineal
# Paquete "UsingR" tiene bases de datos
# para introducirnos a la estadística.
??homedata
library(UsingR)
data("homedata")
head(homedata,3)
dim(homedata)
# lm() función para realizar 
# una regresión lineal
homedata
str(homedata)
names(homedata)
#  "y1970" "y2000"
plot(homedata$y2000 ~ homedata$y1970)

#----------------
library(ggplot2)
ggplot(homedata, aes(x = y1970, y = y2000)) +
  geom_point()
#----------------
attach(homedata)
summary(lm(y2000 ~ y1970))

modelo1 <- lm(y2000 ~ y1970)

# graficar la línea del modelo
plot(y2000 ~ y1970, xlab='precio año 1970',
     ylab='precio año 2000')
abline(modelo1, col="red")
abline(h=mean(y2000), v=mean(y1970), lty=2)

#-------------------------
# Modelo2
lm(y2000 ~ y1970 - 1)
modelo2 <- lm(y2000 ~ y1970 - 1)

# Gráfica de los dos modelos
plot(y2000 ~ y1970, xlab='precio año 1970',
     ylab='precio año 2000')
abline(modelo1, col="red")
abline(modelo2, col="blue")
abline(h=mean(y2000), v=mean(y1970), lty=2, col="grey")

summary(modelo1)
summary(modelo2)

library(report)

# Reporte del análisis de regresión
report(modelo2)
# acerca del tamaño de la muestra para el análisis de modelo lineal
report_effectsize(modelo2)
# tabla con parámetros del análisis
report_table(modelo2)
# Los resultados acerca de la pendiente (Beta)
report_statistics(modelo2)
#
report_parameters(modelo2)
#
report_intercept(modelo2)
#
report_model(modelo2)
#
report_performance(modelo2)
#
report_info(modelo2)
#
report_text(modelo2) 

par(mar=c(5,8,4,4))

# Paquete visreg
library(visreg)

# gráfico

library(ggpubr)
library(ggpmisc)
# graf1

ggplot(homedata, aes(x = y1970, y = y2000)) +
  geom_smooth(method = "lm") +
  geom_point() +
  stat_correlation(mapping = use_label(c("R", "t", "P", "n")))
  
ggplot(homedata, aes(x = y1970, y = y2000)) +
  geom_smooth(method = "lm") +
  geom_point() +
  stat_regline_equation(label.x = 100000, label.y = 1250000) + # for regression equation
  theme_minimal()

library(equatiomatic)
extract_eq(modelo2,
  use_coefs = TRUE, # display coefficients
  wrap = TRUE, # multiple lines
  terms_per_line = 2
)

library(parameters)

model_parameters(modelo2, summary = TRUE)

library(jtools)
library(ggstance)

plot_summs(modelo1,
  modelo2,
  omit.coefs = NULL
)


library(ggstatsplot)

ggcoefstats(modelo2)

library(performance)

library(see)

check_model(modelo2)


predict(modelo2,
  new = data.frame(y1970 = 100500),
  interval = "confidence",
  level = .95
)
