#!/usr/bin/env Rscript
suppressPackageStartupMessages({
  library(readr)
  library(dplyr)
  library(janitor)
})

args <- commandArgs(trailingOnly = TRUE)
phase <- ifelse(length(args) > 0, gsub("^--phase=", "", args[1]), "load")

# Ajusta nombre de archivo si corresponde
path <- file.path("data", "health_lifestyle_classification.csv")
stopifnot(file.exists(path))

df <- readr::read_csv(path, show_col_types = FALSE)

# Checks comunes
if(nrow(df) <= 0) stop("No hay filas.")
if(ncol(df) < 40) stop("Muy pocas columnas para el esquema esperado.")
if(ncol(df) > 60) warning("Columnas >60: revisar diccionario.")

# Tipos básicos esperados (ejemplos, ajusta a tu diccionario real)
expect_numeric <- c("age","height","weight","bmi","sleep_hours","daily_steps")
expect_categorical <- c("gender","education_level","sleep_quality","target")

missing_expected <- setdiff(c(expect_numeric, expect_categorical), names(df))
if(length(missing_expected) > 0) {
  warning(paste("Variables esperadas ausentes:", paste(missing_expected, collapse=", ")))
}

bad_numeric <- intersect(expect_numeric, names(df))
if(length(bad_numeric) > 0 && any(!sapply(df[bad_numeric], is.numeric))) {
  stop("Tipos no numéricos en columnas esperadas numéricas.")
}

# Rango plausibles (modifica si tu diccionario difiere)
range_check <- function(x, minv, maxv, nm) {
  if(!nm %in% names(df)) return(invisible(TRUE))
  v <- suppressWarnings(as.numeric(df[[nm]]))
  frac_out <- mean(v < minv | v > maxv, na.rm=TRUE)
  if(is.finite(frac_out) && frac_out > 0.05) {
    warning(sprintf(">%s%% fuera de rango en %s", round(100*frac_out,1), nm))
  }
}

range_check(df, 0, 100, "age")
range_check(df, 10, 60,  "bmi")
range_check(df, 0, 24,   "sleep_hours")

if(phase == "final") {
  # Checks de salida mínima (ejemplos)
  figs <- list.files("figs", pattern="\\.(png|pdf)$")
  if(length(figs) < 4) warning("Pocas figuras exportadas en /figs.")
  if(!file.exists(file.path("reports","entrega_1.pdf")))
    stop("No existe reports/entrega_1.pdf.")
}

cat("OK:", phase, "\n")