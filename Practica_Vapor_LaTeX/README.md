# Proyecto Práctica de Vapor - LaTeX

Este repositorio contiene la documentación técnica de la Práctica de Vapor, organizada siguiendo la estructura de la Plantilla-LaTeX-Documentacion-Tecnica.

## Organización del Proyecto

- `plantilla.tex`: Archivo principal de LaTeX.
- `preamble.sty`: Archivo de estilo con configuraciones y comandos personalizados.
- `refs.bib`: Base de datos bibliográfica.
- `Implementation.md`: Notas de implementación del proyecto.
- `GOOGLE_DRIVE_CONFIG.md`: Guía para sincronización con Google Drive.
- `.latexmkrc`: Configuración para compilación automatizada con `latexmk`.
- `.gitignore`: Configuración para excluir archivos temporales de Git.
- `.vscode/settings.json`: Configuración de VS Code para ocultar archivos auxiliares.
- `Figuras/`: Directorio de imágenes.
- `Planos/`: Directorio para planos de la instalación.
- `out/`: Directorio de salida para archivos de compilación.

## Compilación

Para compilar el proyecto se recomienda usar `latexmk`:

```bash
latexmk -pdf plantilla.tex
```

Esto generará los archivos auxiliares en la carpeta `out/` y el PDF resultante se copiará a la raíz.
