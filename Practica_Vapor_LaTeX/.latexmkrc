# =============================================================================
# Configuración de latexmk para proyecto de vapor
# =============================================================================

# Modo PDF (pdflatex)
$pdf_mode = 1;

# Usar bibtex siempre en cada compilación (valor 1 = always run)
$bibtex_use = 1;

# Habilitar grabación de dependencias para mejor tracking
$recorder = 1;

# Aumentar iteraciones máximas para resolver todas las referencias
$max_repeat = 5;

# pdflatex con synctex, shell-escape y modo no interactivo
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';

# Extensiones adicionales a limpiar con latexmk -c o -C
$clean_ext = 'synctex.gz synctex.gz(busy) auxlock bbl blg run.xml bcf fdb_latexmk fls lof lot toc out';

# Archivo principal por defecto
@default_files = ('plantilla.tex');

# Generar PDF siempre, incluso con warnings
$force_mode = 1;

# Mostrar avisos de compilación pero no fallar
$warnings_as_errors = 0;
