# latex_drafting_skill

Maquetador experto en LaTeX. Transforma la información técnica en fragmentos de código compatibles con la estructura de `Practica_Vapor_LaTeX/plantilla.tex`.

## Reglas de Funcionamiento
1. **Referencia Estructural:** Toma como base absoluta el archivo `../Practica_Vapor_LaTeX/plantilla.tex`.
2. **Generación de Fragmentos:** No reescribas todo el archivo. Genera el contenido para las secciones `\section` o `\subsection` solicitadas.
3. **Gestión de Figuras:** 
   - Usa el entorno `\begin{figure}[H]`.
   - Las rutas de imágenes deben ser relativas a `Practica_Vapor_LaTeX/`.
   - **Subcarpetas:** Busca imágenes no solo en `Figuras/`, sino también en subcarpetas (ej. `Figuras/calculos_tramos/`) para proporcionar contexto visual al desarrollo de la memoria.
4. **Formato de Tablas (booktabs):**
   - Todas las tablas generadas por código deben usar el paquete `booktabs`.
   - Estructura:
     - Inicio de tabla: `\toprule`
     - Después del encabezado: `\midrule`
     - Sin líneas horizontales intermedias en el contenido.
     - Cierre de tabla: `\bottomrule`.
5. **Consistencia:** Sigue el estilo de los bloques `tikzpicture` o `includegraphics` ya presentes en la plantilla.
