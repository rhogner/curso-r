# Se corre UNA VEZ al armar el proyecto plantilla, no cada vez que alguien lo abre.
# Los alumnos copian el proyecto con los paquetes ya puestos; si tuvieran que correr
# esto, volveriamos a tener el problema de instalacion que el navegador vino a evitar.

paquetes <- c(
  # Clases 1 a 3
  "palmerpenguins", "dplyr", "tidyr", "ggplot2", "readr", "readxl",
  "tibble", "stringr", "forcats", "lubridate", "janitor", "gtsummary", "scales",
  # Clases 4 a 6
  "broom", "survival", "survminer", "epitools", "pwr", "consort",
  # Render de los cuadernos
  "knitr", "rmarkdown"
)

install.packages(paquetes, dependencies = TRUE)

# Quarto a PDF necesita LaTeX, y el proyecto de Posit Cloud no lo trae. Sin esto, el
# alumno del modulo 6 se choca con un error que no tiene forma de resolver solo, y deja
# de ser cierto que todo el curso corre en el navegador.
if (!requireNamespace("tinytex", quietly = TRUE)) install.packages("tinytex")
if (!tinytex::is_tinytex()) tinytex::install_tinytex()

faltan <- paquetes[!vapply(paquetes, requireNamespace, logical(1), quietly = TRUE)]
if (length(faltan)) {
  cat("FALTAN:", paste(faltan, collapse = ", "), "\n")
} else {
  cat("Los", length(paquetes), "paquetes quedaron instalados.\n")
}
cat("LaTeX listo:", tinytex::is_tinytex(), "\n")
