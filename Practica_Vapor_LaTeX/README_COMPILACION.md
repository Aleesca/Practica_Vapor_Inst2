# Sistema de Compilación LaTeX - Proyecto de Vapor

## Descripción

Este proyecto utiliza un sistema de compilación optimizado para evitar conflictos con Google Drive durante la sincronización. **Todos los archivos auxiliares y el PDF final se generan en el directorio `build/`**, manteniendo el directorio principal limpio.

---

## Estructura de Archivos

```
Practica_Vapor_LaTeX/
├── plantilla.tex              # Documento principal LaTeX
├── preamble.sty               # Preámbulo con paquetes y configuraciones
├── refs.bib                   # Bibliografía BibTeX
├── staging.tex                # Buffer para código generado por agentes
├── Figuras/                   # Imágenes y diagramas
│
├── build/                     # 🔴 DIRECTORIO DE COMPILACIÓN (ignorado por git)
│   ├── plantilla.pdf          # ← PDF final aquí
│   ├── plantilla.aux          # Archivos auxiliares (.aux, .log, .toc, etc.)
│   ├── plantilla.synctex.gz   # Sincronización editor ↔ PDF
│   └── *.bak*                 # Backups de latexindent
│
├── .latexmkrc                 # Configuración de latexmk
├── .indentconfig.yaml         # Configuración de latexindent
└── .vscode/
    └── settings.json          # Configuración de LaTeX Workshop
```

---

## Características del Sistema

### ✅ Ventajas

1. **Directorio principal limpio**: No hay archivos `.aux`, `.log`, `.synctex.gz`, etc. en la raíz
2. **Sin conflictos con Google Drive**: Los archivos temporales se generan en `build/` que Drive sincroniza menos frecuentemente
3. **Sin archivos `.bak` dispersos**: latexindent guarda backups en `build/`
4. **SyncTeX funcional**: La sincronización editor ↔ PDF funciona correctamente
5. **Git limpio**: Solo se versionan archivos de código fuente, no auxiliares

### 🎯 Configuración Aplicada

| Componente | Configuración |
|------------|---------------|
| **latexmk** | `$out_dir = 'build'` - Todo en build/ |
| **LaTeX Workshop** | `"latex-workshop.latex.outDir": "build"` |
| **latexindent** | `cruftDirectory: build/` - Backups en build/ |
| **Git** | `build/` en `.gitignore` (excepto README) |

---

## Uso

### Compilar con VS Code (LaTeX Workshop)

1. **Abrir `plantilla.tex` en VS Code**
2. **Guardar el archivo** → Compilación automática
3. **Ver PDF**: Se abrirá automáticamente desde `build/plantilla.pdf`

**Receta recomendada**: `latexmk 🔃` (ya configurada por defecto)

### Compilar desde terminal

```bash
cd Practica_Vapor_LaTeX

# Compilar
latexmk -pdf plantilla.tex

# Ver PDF generado
start build/plantilla.pdf

# Limpiar archivos auxiliares
latexmk -c

# Limpiar TODO (incluido PDF)
latexmk -C
```

### Formatear código LaTeX (latexindent)

El formateador está configurado para generar backups en `build/`:

```bash
latexindent -w plantilla.tex  # Los .bak irán a build/
```

---

## Sincronización con Google Drive

### ⚠️ Importante

Aunque `build/` se sincroniza con Google Drive (porque está dentro del directorio compartido), **NO causa conflictos** porque:

1. Los archivos en `build/` se regeneran automáticamente al compilar
2. Git **ignora** completamente `build/` (excepto `README.md`)
3. Si hay conflictos, simplemente elimina `build/` y recompila

### 🔧 Optimización Opcional

Si experimentas lentitud al compilar, puedes excluir `build/` de la sincronización de Google Drive:

**En Windows (Google Drive Desktop):**
1. Click derecho en `Practica_Vapor_LaTeX/build/` → Propiedades
2. Desmarcar "Disponible sin conexión"

Esto **no afecta** al funcionamiento, ya que `build/` es regenerable.

---

## Solución de Problemas

### PDF no se visualiza en VS Code

**Síntoma**: Al compilar, no se abre el visor de PDF  
**Solución**: 
1. Verifica que existe `build/plantilla.pdf`
2. Abre manualmente: `Ctrl+Shift+P` → "LaTeX Workshop: View LaTeX PDF" → "In VS Code tab"
3. Recarga VS Code: `Ctrl+Shift+P` → "Developer: Reload Window"

### Compilación lenta

**Causa**: Google Drive sincronizando archivos mientras compilas  
**Solución**:
1. Pausa Google Drive temporalmente (icono en bandeja del sistema)
2. Compila
3. Reactiva Google Drive

### Archivos `.bak` en directorio principal

**Causa**: latexindent usa configuración antigua  
**Solución**:
```bash
rm -f *.bak*  # Eliminar backups antiguos
```

El archivo `.indentconfig.yaml` ya está configurado correctamente.

### Error "Device or resource busy"

**Causa**: Algún proceso (visor PDF, Google Drive) tiene archivos bloqueados  
**Solución**:
1. Cierra visores de PDF externos (Adobe, SumatraPDF, etc.)
2. Pausa Google Drive
3. Ejecuta `latexmk -C` para limpiar todo
4. Recompila

---

## Archivos de Configuración

### `.latexmkrc`
```perl
$out_dir = 'build';           # Todo en build/
$pdf_mode = 1;                # Generar PDF
$force_mode = 1;              # Compilar aunque haya warnings
```

### `.indentconfig.yaml`
```yaml
cruftDirectory: build/        # Backups en build/
backupExtension: .bak
maxNumberOfBackUps: 3
```

### `.vscode/settings.json`
```json
"latex-workshop.latex.outDir": "build"
"latex-workshop.latexindent.args": [
    "-c=%DIR%/build/",        # Backups en build/
    "%TMPFILE%"
]
```

---

## Estado del Sistema

| Elemento | Estado |
|----------|--------|
| ✅ Compilación en `build/` | Funcionando |
| ✅ PDF en `build/plantilla.pdf` | Generándose correctamente |
| ✅ SyncTeX | Funcional |
| ✅ Backups de latexindent | Redirigidos a `build/` |
| ✅ Git ignorando `build/` | Configurado |
| ✅ Directorio principal limpio | Sin auxiliares |

---

**Última actualización**: 2026-03-26  
**Configurado por**: Sistema de sincronización GitHub-Google Drive optimizado
