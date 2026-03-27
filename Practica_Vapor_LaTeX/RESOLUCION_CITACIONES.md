# Resolución de Warnings "Cannot Find Citation" en LaTeX Workshop

## Problema Identificado

El proyecto LaTeX reportaba continuamente warnings de "Citation undefined" para referencias como:
- `VIESSMANN2013`
- `EREN2015`
- `RITE2007`

El archivo PDF se generaba pero sin resolver las citas en el texto.

## Causa Raíz

Se identificaron **dos problemas críticos**:

### 1. **Configuración de latexmk insuficiente**
- **Problema**: `$bibtex_use = 2` (ejecutar bibtex "si es necesario") no detectaba las citas
- **Causa**: El archivo `.aux` no se preservaba correctamente entre compilaciones
- **Síntoma**: El archivo `.bbl` nunca se generaba

### 2. **Corrupción de archivos por Google Drive**
- **Problema**: Google Drive estaba corrompiendo el archivo `.aux` durante la compilación
- **Síntoma**: Errores de "Text line contains an invalid character" con caracteres `^^@`
- **Impacto**: Cada compilación fallaba al detectar caracteres inválidos en `plantilla.aux`

## Soluciones Implementadas

### Solución 1: Actualización de `.latexmkrc`

**Archivo**: `.latexmkrc` (línea 9)

```perl
# ANTES:
$bibtex_use = 2;  # run if needed

# DESPUÉS:
$bibtex_use = 1;  # always run bibtex
```

**Efecto**: Fuerza que bibtex se ejecute en cada compilación, generando siempre el `.bbl`

### Solución 2: Cambio de receta por defecto en VS Code

**Archivo**: `.vscode/settings.json` (líneas 52-68)

```json
"latex-workshop.latex.recipes": [
    {
        "name": "pdflatex ➞ bibtex ➞ pdflatex × 2 (Recomendado)",
        "tools": ["pdflatex", "bibtex", "pdflatex", "pdflatex"]
    },
    {
        "name": "latexmk 🔃",
        "tools": ["latexmk"]
    }
]
```

**Efecto**: Usa la secuencia manual en lugar de latexmk, evitando problemas de latexmk con Google Drive

**Razón**: La secuencia manual (pdflatex → bibtex → pdflatex × 2) es más robusta cuando hay interferencia de sincronización de archivos

### Solución 3: Actualización de `.gitignore`

**Archivo**: `.gitignore`

Se agregaron las siguientes líneas para evitar sincronización de archivos temporales:
```
*.bbl
*.blg
*.bcf
*.run.xml
*.pdf
plantilla_backup_*
```

**Efecto**: Impide que Google Drive intente sincronizar archivos que se generan localmente durante la compilación

### Solución 4: Script de compilación robusto

**Archivo**: `compile_robust.bat`

Se creó un script batch que ejecuta la secuencia manual de compilación con validaciones:
```batch
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape plantilla.tex
bibtex plantilla
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape plantilla.tex
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape plantilla.tex
```

**Uso**: Ejecutar desde terminal con `compile_robust.bat`

## Resultados Verificados

### ✅ Compilación Exitosa
- **plantilla.pdf**: 4.1 MB (84 páginas)
- **plantilla.bbl**: 1.5 KB con 3 entradas bibliográficas

### ✅ Citaciones Resueltas
```
\bibitem{VIESSMANN2013}
Viessmann, Catálogo de Datos Técnicos: VITOMAX 100-HS, Modelo M33A,
  Viessmann, S.L., Pinto, Madrid, Jun. 2013, código de documento: 5794 373 ES.

\bibitem{EREN2015}
EREN, Manual Técnico de Diseño y Cálculo de Redes de Vapor, Ente
  Regional de la Energía de Castilla y León, [En línea]. Disponible en:
  https://energia.jcyl.es/. Accedido: Mar. 26, 2026.

\bibitem{RITE2007}
BOE, Reglamento de Instalaciones Térmicas en los Edificios (RITE),
  Ministerio de Industria, Turismo y Comercio, 2007.
```

### ✅ Sin Warnings
- **0 warnings** de "Citation undefined"
- **0 warnings** de "Reference undefined"
- Documento compilado correctamente

## Configuración Final

Los cambios realizados aseguran que:

1. **LaTeX Workshop usa la receta manual** por defecto (pdflatex → bibtex → pdflatex × 2)
2. **Los archivos temporales no se sincronizan** con Google Drive
3. **BibTeX se ejecuta siempre** en latexmk (si se usa)
4. **Se proporciona un script robusto** para compilaciones manuales

## Recomendaciones Futuras

### Para Evitar Problemas Similares:

1. **Considerar trabajar en copia local** del proyecto si los problemas persisten
2. **Sincronizar con Drive solo archivos finales** (.tex, .bib, .pdf)
3. **Usar el script `compile_robust.bat`** en lugar de confiar en compilación automática
4. **Mantener `.gitignore` actualizado** con nuevas extensiones temporales según sea necesario

### Para Actualizaciones Futuras:

- Si se añaden nuevos estilos bibtex, actualizar `latex-workshop.latex.tools` con las opciones correspondientes
- Si se encuentran más archivos problemáticos, añadirlos a `.gitignore`
- Considerar agregar `.latexmkrc` a `.gitignore` si hay cambios frecuentes

## Archivos Modificados

| Archivo | Cambios | Fecha |
|---------|---------|-------|
| `.latexmkrc` | $bibtex_use = 2 → 1 | 27/03/2026 |
| `.vscode/settings.json` | Reordenar recetas | 27/03/2026 |
| `.gitignore` | Agregar *.bbl, *.blg, etc. | 27/03/2026 |
| `compile_robust.bat` | Crear script nuevo | 27/03/2026 |

## Testeo Final

Ejecutar desde terminal:
```bash
cd "H:\Unidades compartidas\Practicas_Inst2\1_Vapor\Practica_Vapor_LaTeX"
compile_robust.bat
```

Si todo funciona correctamente, el script mostrará:
```
[OK] plantilla.pdf generado exitosamente
[OK] plantilla.bbl generado exitosamente
[OK] No hay warnings de citaciones indefinidas ✓
```
