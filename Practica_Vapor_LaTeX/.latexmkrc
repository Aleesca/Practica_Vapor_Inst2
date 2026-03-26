# =============================================================================
# Configuración de latexmk para proyecto de vapor
# =============================================================================
# Este archivo configura latexmk para generar TODOS los archivos de compilación
# (incluido el PDF final) en el directorio build/, manteniendo el directorio
# principal limpio y evitando conflictos con Google Drive.
# =============================================================================

# Directorio de salida para TODOS los archivos (auxiliares + PDF)
# LaTeX Workshop leerá el PDF directamente desde build/
$out_dir = 'build';

# Modo PDF (pdflatex)
$pdf_mode = 1;

# Usar bibtex para bibliografía
$bibtex_use = 2;

# Habilitar synctex para sincronización con el editor
# El archivo .synctex.gz se genera en build/ junto con el PDF
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %O %S';

# Extensiones adicionales a limpiar con latexmk -c o -C
$clean_ext = 'synctex.gz synctex.gz(busy) auxlock bbl blg run.xml bcf bak bak0 bak1 bak2 bak3';

# Archivo principal por defecto
@default_files = ('plantilla.tex');

# Generar PDF siempre, incluso con warnings
$force_mode = 1;
