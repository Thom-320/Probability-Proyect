# Script para instalar paquetes necesarios
# Configurar mirror de CRAN
options(repos = c(CRAN = "https://cran.rstudio.com/"))

packages <- c(
  "tidyverse", "janitor", "skimr", "gt", "GGally", "broom", "gridExtra", "viridis",
  "ggplot2", "ggthemes", "rstatix", "effectsize", "readr", "patchwork", "corrplot",
  "psych", "knitr", "kableExtra", "rmarkdown", "IRkernel"
)

cat("Instalando paquetes necesarios...\n")

# Instalar paquetes que no estén instalados
new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  cat("Paquetes a instalar:", paste(new_packages, collapse = ", "), "\n")
  install.packages(new_packages, dependencies = TRUE)
  if ("IRkernel" %in% new_packages) {
    cat("Registrando kernel de Jupyter para R...\n")
    IRkernel::installspec()
  }
} else {
  cat("Todos los paquetes ya están instalados.\n")
}

# Verificar instalación
cat("Paquetes instalados correctamente:\n")
for(pkg in packages) {
  if(require(pkg, character.only = TRUE, quietly = TRUE)) {
    cat("✓", pkg, "\n")
  } else {
    cat("✗", pkg, "- ERROR\n")
  }
}
