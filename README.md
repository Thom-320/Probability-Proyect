# Proyecto Final - Probabilidad y Estadística 2

## Análisis Estadístico Descriptivo e Inferencial de Datos de Salud y Estilo de Vida

### Descripción del Proyecto

Este proyecto aplica técnicas de estadística descriptiva e inferencial sobre el dataset "Health Lifestyle Classification" que contiene 100,000 registros con 48 variables relacionadas con salud y estilo de vida.

### Estructura del Proyecto

```
├── code/                          # Código fuente en RMarkdown y scripts auxiliares
│   ├── entrega1_notebook.Rmd     # Notebook CANÓNICO de la Entrega 1 (único)
│   ├── entrega1_doc.Rmd          # Variante breve para generar el PDF corto (opcional)
│   └── checks.R                  # Validaciones automatizadas
├── data/                          # Fuente de datos original
│   └── health_lifestyle_classification.csv
├── figs/                          # Figuras exportadas (PNG) listas para el informe
│   └── entrega1/*.png
├── tab/                           # Tablas exportadas (CSV) listas para el informe
├── reports/                       # Salidas renderizadas (HTML/PDF)
│   ├── entrega1_notebook.html
│   ├── entrega1_notebook.pdf
│   ├── entrega_1.html
│   └── entrega_1.pdf
├── Proyecto.ipynb                 # Notebook Jupyter (opcional, lectura)
└── README.md
```

### Requisitos

- R >= 4.0.0
- Paquetes: tidyverse, janitor, skimr, ggplot2, ggthemes, rstatix, effectsize, readr, patchwork, corrplot, psych, knitr, kableExtra

### Instrucciones de Reproducción

#### Opción 1: Render con RMarkdown (Notebook único)
```bash
Rscript -e "rmarkdown::render('code/entrega1_notebook.Rmd', output_dir='reports', output_file='entrega1_notebook.html')"
Rscript -e "rmarkdown::render('code/entrega1_notebook.Rmd', output_format='pdf_document', output_dir='reports', output_file='entrega1_notebook.pdf')"
```

#### Opción 2: Usar los notebooks
- **RMarkdown**: abre `code/entrega1_notebook.Rmd` en RStudio y compila a HTML/PDF.
- **Jupyter**: ejecuta `Proyecto.ipynb` con kernel de R (`IRkernel`) y exporta el resultado desde la interfaz.

### Validaciones

Ejecutar validaciones antes del análisis:
```bash
Rscript code/checks.R --phase=load
```

Ejecutar validaciones finales:
```bash
Rscript code/checks.R --phase=final
```

### Contenido del Análisis

1. **Marco Metodológico y Objetivo** (10 puntos)
   - Origen y características de los datos
   - Clasificación tipológica de variables
   - Objetivos específicos del análisis

2. **Análisis Descriptivo Categórico** (10 puntos)
   - Análisis univariado: tablas de frecuencias y gráficos de barras
   - Análisis bivariado: tablas de contingencia y gráficos apilados

3. **Análisis Descriptivo Cuantitativo** (10 puntos)
   - Estadígrafos de tendencia central, dispersión, forma y posición
   - Histogramas, boxplots y matriz de correlaciones
   - Sugerencias distribucionales

4. **Análisis Bivariado Mixto** (10 puntos)
   - Estadígrafos segmentados por categorías
   - Visualizaciones comparativas entre grupos

5. **Pruebas de Hipótesis** (10 puntos)
   - Prueba t para la media del BMI (H₀: μ = 25)
   - Prueba z para proporción de individuos saludables (H₀: p = 0.5)

### Especificaciones Técnicas

- **Reproducibilidad**: `set.seed(123)`, `sessionInfo()` incluido
- **Formato PDF**: Calibri 12, interlineado 1.15, máximo 6 páginas
- **Figuras**: 300 DPI, numeradas y con capciones interpretativas
- **Intervalos de Confianza**: 95% para todas las pruebas
- **Tamaño de Efecto**: Cohen's d y métricas apropiadas

### Entregables

1. **Documento PDF** (`reports/entrega_1.pdf`): Máximo 6 páginas, autocontenido
2. **Notebook R** (`code/entrega1_notebook.Rmd`): Código reproducible con salidas visibles y exportables
3. **Diccionario de Variables**: Descripción completa de todas las variables

### Fecha de Entrega

Viernes 10 de octubre hasta las 7:00 PM

### Notas Importantes

- El documento debe ser autocontenido (no requiere consultar el notebook)
- Todas las interpretaciones deben estar contextualizadas
- Cada página adicional al límite acarrea deducción de 0.5 puntos
- El código debe ser completamente reproducible
