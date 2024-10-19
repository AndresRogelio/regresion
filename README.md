# README: Análisis de Regresión Lineal con `homedata`

Este proyecto realiza un análisis de regresión lineal utilizando el conjunto de datos `homedata` del paquete `UsingR`. El objetivo es explorar la relación entre los precios de las viviendas en 1970 y 2000.

## Requisitos

- R (version 3.5 o superior)
- Paquetes de R:
  - `UsingR`
  - `ggplot2`
  - `report`
  - `visreg`
  - `ggpubr`
  - `ggpmisc`
  - `equatiomatic`
  - `parameters`
  - `jtools`
  - `ggstatsplot`
  - `performance`
  - `see`

## Instalación de Paquetes

Para instalar los paquetes necesarios, puedes usar el siguiente código en R:

```r
install.packages(c("UsingR", "ggplot2", "report", "visreg", "ggpubr", "ggpmisc", "equatiomatic", "parameters", "jtools", "ggstatsplot", "performance", "see"))
```

## Uso
1. **Carga de Datos**: Carga el conjunto de datos homedata y explora sus características.
   ```r
   library(UsingR)
   data("homedata")
   head(homedata, 3)
   dim(homedata)
   ```

2. **Visualización Inicial**: Genera un gráfico de dispersión para visualizar la relación entre los precios de las viviendas en 1970 y 2000.
   ```r
   plot(homedata$y2000 ~ homedata$y1970)
   ```
3. **Regresión Lineal**: Crea un modelo de regresión lineal y visualiza la línea de ajuste.
   ```r
   modelo1 <- lm(y2000 ~ y1970)
   plot(y2000 ~ y1970)
   abline(modelo1, col="red")
   ```
4. **Modelo Sin Intercepto**: Crea un segundo modelo de regresión lineal sin el término de intercepto.
   ```r
   modelo2 <- lm(y2000 ~ y1970 - 1)
   ```
5. **Comparación de modelos**: Compara visualmente ambos modelos en un mismo gráfico.
   ```r
   plot(y2000 ~ y1970)
   abline(modelo1, col="red")
   abline(modelo2, col="blue")
   ```
6. Reportes: Genera un reporte completo del análisis de regresión.
   ```r
   library(report)
   report(modelo2)
   ```
7. Visualización avanzda: Utiliza ggplot2 para añadir la ecuación de la línea de regresión en el gráfico.
   ```r
   ggplot(homedata, aes(x = y1970, y = y2000)) +
    geom_smooth(method = "lm") +
    geom_point() +
    stat_regline_equation(label.x = 100000, label.y = 1250000)
   ```
8. Predicciones: Realiza predicciones usando el modelo de regresión.
   ```r
   predict(modelo2, new = data.frame(y1970 = 100500), interval = "confidence", level = .95)
   ```
   
## Resultados
El análisis incluye gráficos de dispersión, líneas de regresión y reportes detallados que resumen los resultados de los modelos. Los usuarios pueden observar cómo cambian los precios de las viviendas en función del tiempo y cómo se ajustan los modelos de regresión a los datos.

## Contribuciones
Si deseas contribuir a este proyecto, siéntete libre de realizar sugerencias o mejoras en el código.
