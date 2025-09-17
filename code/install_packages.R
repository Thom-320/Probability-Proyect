# Script para instalar paquetes necesarios
packages <- c(
  "tidyverse", "janitor", "skimr", "ggplot2", "ggthemes", 
  "rstatix", "effectsize", "readr", "patchwork", "corrplot", 
  "psych", "knitr", "kableExtra"
)

# Instalar paquetes que no estén instalados
new_packages <- packages[!(packages %in% installed.packages()[,"Package"])]
if(length(new_packages)) {
  install.packages(new_packages, dependencies = TRUE)
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