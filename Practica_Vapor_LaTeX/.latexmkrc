# =============================================================================
# Configuración de latexmk para proyecto de vapor
# =============================================================================

# Modo PDF (pdflatex)
$pdf_mode = 1;

# Usar bibtex para bibliografía
$bibtex_use = 2;

# Habilitar synctex para sincronización con el editor
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';

# Extensiones adicionales a limpiar con latexmk -c o -C
$clean_ext = 'synctex.gz synctex.gz(busy) auxlock bbl blg run.xml bcf';

# Archivo principal por defecto
@default_files = ('plantilla.tex');

# Generar PDF siempre, incluso con warnings
$force_mode = 1;
