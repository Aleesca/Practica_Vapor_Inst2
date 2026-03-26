# Agent Skills for Steam Project Implementation Plan

> **For agentic workers:** REQUIRED: Use superpowers:executing-plans to implement this plan. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Create a specialized agent skill system to automate the drafting of a LaTeX technical report for a steam installation project.

**Architecture:** A two-agent system where one agent researches technical data from local markdown notes and manuals, and a second agent formats that data into a pre-existing LaTeX template, managing figure placement.

**Tech Stack:** Gemini CLI Agent Skills, LaTeX.

---

## Chunk 1: Steam Knowledge Skill

**Files:**
- Create: `.agents/steam_knowledge_skill/skill.md`

- [ ] **Step 1: Define the `steam_knowledge_skill` content**
  Create the file with the following content:
  ```markdown
  # steam_knowledge_skill

  Investigador experto en sistemas de vapor. Su función es extraer datos técnicos, cálculos y descripciones de la carpeta `Anotaciones/` y de los manuales técnicos del proyecto.

  ## Reglas de Funcionamiento
  1. **Fuentes de Verdad:** Solo utiliza información de `H:\Unidades compartidas\Practicas_Inst2\1_Vapor\Anotaciones/*.md` y los PDFs en `.agents/skills/doc-tecnica-vapor/references/`.
  2. **Sin Formato:** El output debe ser texto plano o datos estructurados (JSON/Markdown simple). No intentes generar código LaTeX.
  3. **Extracción Selectiva:** Lee el índice en `Planning/index.md` para saber qué sección estás investigando y busca solo lo relevante para ese punto.
  4. **Mapeo de Figuras:** Si encuentras una referencia a una imagen (ej. `Tramo2.jpeg`) en las notas, menciónala explícitamente en tu reporte para que el redactor sepa dónde colocarla.
  ```

- [ ] **Step 2: Commit changes**
  Run: `git add .agents/steam_knowledge_skill/skill.md && git commit -m "feat: add steam_knowledge_skill"`

---

## Chunk 2: LaTeX Drafting Skill

**Files:**
- Create: `.agents/latex_drafting_skill/skill.md`

- [ ] **Step 1: Define the `latex_drafting_skill` content**
  Create the file with instructions to use the existing template:
  ```markdown
  # latex_drafting_skill

  Maquetador experto en LaTeX. Transforma la información técnica en fragmentos de código compatibles con la estructura de `Practica_Vapor_LaTeX/plantilla.tex`.

  ## Reglas de Funcionamiento
  1. **Referencia Estructural:** Toma como base absoluta el archivo `G:\Unidades compartidas\Practicas_Inst2\1_Vapor\Practica_Vapor_LaTeX/plantilla.tex`.
  2. **Generación de Fragmentos:** No reescribas todo el archivo. Genera el contenido para las secciones `\section` o `\subsection` solicitadas.
  3. **Gestión de Figuras:** 
     - Usa el entorno `\begin{figure}[H]`.
     - Las rutas de imágenes deben ser relativas a `Practica_Vapor_LaTeX/` (ej. `Figuras/nombre.png`).
     - Sigue el estilo de los bloques `tikzpicture` o `includegraphics` ya presentes en la plantilla.
  4. **Consistencia:** Mantén el uso de comandos como `\noindent \underline{\textbf{...}}` para los títulos de tramos, según se ve en la plantilla.
  ```

- [ ] **Step 2: Commit changes**
  Run: `git add .agents/latex_drafting_skill/skill.md && git commit -m "feat: add latex_drafting_skill"`

---

## Chunk 3: Verification & Integration

- [ ] **Step 1: Verify Skill Registration**
  Ensure the new skills are recognized by the system.

- [ ] **Step 2: Final Review**
  Check that all paths in the skills are absolute or correctly relative to the workspace root.
