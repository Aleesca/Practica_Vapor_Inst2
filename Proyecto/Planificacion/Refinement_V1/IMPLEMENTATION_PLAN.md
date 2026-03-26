# PLAN DE IMPLEMENTACIÓN AUTOMÁTICA - Refinement_V1
**Documento**: Guía de ejecución automática del agente `task-orchestrator`  
**Fecha creación**: 26 de marzo de 2026  
**Estado**: Listo para ejecución  
**Documento objetivo**: `Practica_Vapor_LaTeX\plantilla.tex`

---

## Resumen Ejecutivo

El plan ejecuta automáticamente las **19 tareas** del MASTER_CHECKLIST.md distribuidas en **6 fases secuenciales**, con validación LaTeX al finalizar cada fase.

**Tiempo estimado**: 60-100 minutos (ejecución automática)  
**Impacto esperado**: 
- Reducción de ~15-20 páginas
- 24 figuras movidas a Anejos 2 y 3
- Corrección de rugosidad (0.045 → 0.02 mm)
- Mejora de formato y coherencia

---

## Arquitectura del Agente

```
┌─────────────────────────────────────────────────────────────────┐
│                    task-orchestrator                            │
│  (Coordinador de tareas para generación automática)             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌────────────────┐    ┌────────────────┐    ┌───────────────┐ │
│  │  latex-writer  │───►│latex-validator │───►│ Checkpoint?   │ │
│  │  (Maquetador)  │    │(Compilación)   │    │   OK/FAIL     │ │
│  └────────────────┘    └────────────────┘    └───────────────┘ │
│          ▲                     │                    │          │
│          │                     └────────────────────┘          │
│          │              (Continúa o solicita corrección)       │
│  ┌───────┴──────────────────────────────────────────────────┐  │
│  │               steam-researcher                            │  │
│  │  (Consultas técnicas cuando sea necesario)                │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

**Agentes involucrados**:
- **task-orchestrator**: Coordinador principal, gestiona flujo de fases
- **latex-writer**: Maquetador, ejecuta ediciones específicas del documento
- **latex-validator**: Validador, compila PDF y verifica errores
- **steam-researcher**: Investigador de vapor, consultas técnicas puntuales

---

## FASE 1: Eliminaciones y Correcciones Críticas
**Duración**: 15-25 minutos  
**Checkpoint**: Compilación sin errores de referencias rotas  
**Agente principal**: `latex-writer`

### Tarea 1.1: Eliminar Tabla 2.8 (rugosidades)
**ID**: D2 | **Prioridad**: HIGH | **Esfuerzo**: EASY

**Descripción**: Eliminar tabla redundante de rugosidades de diferentes materiales. Solo se usa acero con un valor único.

**Ubicación**: ~Líneas 661-679 (antes de línea 680)

**Acción**:
1. Localizar párrafo que comienza con "La `\tabref{tab:rugosidades-materiales}` presenta..."
2. Eliminar el párrafo completo de referencia
3. Eliminar el bloque `\begin{table}[H]...\end{table}` completo con:
   - `\caption{Rugosidad absoluta de diferentes materiales de tubería}`
   - `\label{tab:rugosidades-materiales}`
   - Todas las filas de la tabla

**Verificación**: `grep -n "tab:rugosidades-materiales\|Tabla 2.8" plantilla.tex` debe retornar vacío

**Cross-ref**: Relacionado con D1 y F-T7

---

### Tarea 1.2: Corregir rugosidad 0.045 → 0.02 mm
**ID**: D1 | **Prioridad**: HIGH | **Esfuerzo**: MEDIUM

**Descripción**: Reemplazar valor incorrecto de rugosidad en todo el documento. Acero laminado nuevo tiene ε = 0.02 mm, no 0.045 mm.

**Ubicaciones**:
- ~Línea 654: Explicación de rugosidad (párrafo "La rugosidad absoluta...")
- ~Línea 1083: Cálculo de rugosidad relativa en Tramo 1
- ~Línea 1086: Ecuación de rugosidad relativa

**Acciones**:
1. **replaceAll: true** de `0{,}045` → `0{,}02`
2. Actualizar párrafo de línea ~654 para decir "acero laminado nuevo" con ε = 0.02 mm
3. Actualizar ejemplo de cálculo en línea ~1086: `\varepsilon/D = 0{,}02 / 146{,}4 = ...`

**Verificación**: `grep "0{,}045\|0.045" plantilla.tex` debe retornar vacío

**Cross-ref**: Relacionado con D2 (Tabla 2.8 eliminada)

---

### Tarea 1.3: Eliminar tabla redundante de requerimientos
**ID**: P1 | **Prioridad**: HIGH | **Esfuerzo**: MEDIUM

**Descripción**: Tabla 1.1 y Tabla 1.2 contienen información similar. Mantener solo una.

**Ubicaciones**:
- ~Línea 116-131: Primera tabla (posiblemente Tabla 1.1)
- ~Línea 174-188: Tabla 1.2 con label `tab:consumidores-requerimientos`

**Acción**:
1. Comparar ambas tablas
2. Eliminar la redundante (probablemente la primera)
3. Mantener `tab:consumidores-requerimientos` que es más detallada

**Verificación**: Compilar y buscar referencias a la tabla eliminada

---

### Tarea 1.4: Añadir figura `seleccion_presion.pdf`
**ID**: M3 | **Prioridad**: HIGH | **Esfuerzo**: EASY

**Descripción**: Insertar figura faltante que muestra criterios de selección de presión.

**Ubicación**: Sección 2.1.4, subsección "Determinación de la presión de diseño" (~después de línea 435)

**Código LaTeX a insertar**:
```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.75\textwidth]{Figuras/seleccion_presion.pdf}
    \caption{Criterios de selección de la presión de diseño para la red de vapor. Fuente: Manual de diseño. Elaboración grupal.}
    \label{fig:seleccion-presion-diseno}
\end{figure}
```

**Verificación**: Figura debe aparecer en índice de figuras y ser visible en PDF compilado

---

### Tarea 1.5: Verificar/corregir Figura 2.1 (caldera)
**ID**: M2 | **Prioridad**: HIGH | **Esfuerzo**: MEDIUM

**Descripción**: Verificar que esquema de caldera VITOMAX 100-HS M33A es correcto (¿tiene o no economizador?).

**Ubicación**: ~Línea 577-582

**Acción**:
1. Investigar especificaciones del modelo M33A
2. Si NO tiene economizador: actualizar caption para clarificar "sin economizador"
3. Si SÍ tiene: reemplazar con esquema correcto del catálogo

**Código de caption sugerido** (si no tiene economizador):
```latex
\caption{Esquema de la caldera Viessmann VITOMAX 100-HS M33A (sin economizador). Fuente: Catálogo Viessmann. Elaboración grupal.}
```

**Verificación**: Caption debe ser técnicamente correcto

---

### Tarea 1.6: Eliminar tablas duplicadas de longitudes equivalentes
**ID**: D3 | **Prioridad**: MEDIUM | **Esfuerzo**: MEDIUM

**Descripción**: Existen múltiples tablas con info de longitudes equivalentes. Mantener solo la figura con imagen `perdidas_carga_accesorios.png`.

**Ubicaciones**:
- ~Línea 715: `\tabref{tab:longitudes-equivalentes}` (primera mención)
- ~Línea 720: `\begin{table}...\end{table}` (Tabla 2.7)
- ~Línea 820: `\figref{fig:tabla-perdidas-accesorios}` (imagen, MANTENER)

**Acción**:
1. MANTENER: Figura con `perdidas_carga_accesorios.png` (~línea 817-822)
2. ELIMINAR: Cualquier tabla manual que duplique esta información (~línea 720)

**Verificación**: Solo debe haber una imagen de pérdidas de carga en documento

---

### Tarea 1.7: Eliminar ecuación duplicada
**ID**: P2 | **Prioridad**: LOW | **Esfuerzo**: EASY

**Descripción**: Ecuación de caudal total (1.1) aparece en múltiples secciones. Mantener solo en ubicación original.

**Acción**:
1. Buscar todas las apariciones de la ecuación: `Q_{\text{total}} = ... K \cdot \sum`
2. En secciones posteriores, reemplazar con: `\eqref{eq:caudal-total-diseno}`

**Verificación**: `grep -n "Q_{\text{total}} = K" plantilla.tex` debe retornar solo 1 ecuación

---

### Tarea 1.8: Eliminar columna sobrecalentamiento en tablas
**ID**: M1 | **Prioridad**: LOW | **Esfuerzo**: EASY

**Descripción**: Columna "Grado de sobrecalentamiento" no solicitada en especificaciones. Eliminar de tablas (mantener explicación textual).

**Ubicaciones**:
- ~Línea 287: Tabla 2.1 (Propiedades del vapor sobrecalentado)
- ~Línea 521: Otra tabla similar

**Acción**:
1. Eliminar filas de las tablas que contengan: `Grado de sobrecalentamiento & $\Delta T_{\text{sob}}$ & 40 & °C \\`
2. MANTENER: Explicación textual de sobrecalentamiento en secciones anteriores

**Verificación**: Tablas deben compilar sin referencia a columna eliminada

---

### Validación Fase 1

**Comando**:
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
# Revisar que no hay "undefined reference" warnings
```

**Checklist**:
- [ ] Tabla 2.8 completamente eliminada
- [ ] Rugosidad corregida a 0.02 mm en todo el documento
- [ ] Tabla redundante de requerimientos eliminada
- [ ] Figura `seleccion_presion.pdf` visible en PDF
- [ ] Caption de caldera actualizado
- [ ] Tablas duplicadas de longitudes equivalentes consolidadas
- [ ] Ecuación de caudal total única
- [ ] Columnas de sobrecalentamiento eliminadas de tablas
- [ ] Compilación exitosa sin undefined references

---

## FASE 2: Formato de Tablas
**Duración**: 10-15 minutos  
**Checkpoint**: Todas las tablas caben en márgenes  
**Agente principal**: `latex-writer`

### Tarea 2.1: Tabla 2.45 - Evaluar alternativa sin tabla
**ID**: F-T4 | **Prioridad**: HIGH | **Esfuerzo**: MEDIUM

**Descripción**: En lugar de corregir formato, evaluar si esta tabla puede expresarse como lista o texto.

**Acción**:
1. Leer contenido de Tabla 2.45
2. Evaluar alternativas: ¿lista?, ¿texto con valores inline?, ¿figura/diagrama?
3. Implementar alternativa más legible

---

### Tarea 2.2-2.6: Ajustar Tablas 1.2, 2.12, 2.44, 2.47, 2.48
**ID**: F-T1, F-T2, F-T3, F-T5, F-T6 | **Prioridad**: MEDIUM | **Esfuerzo**: EASY

**Descripción**: Tablas que exceden margen. Aplicar ajustes de formato.

**Estrategia (en orden de preferencia)**:
1. Reducir `\tabcolsep` a 3-4pt: `\setlength{\tabcolsep}{3pt}`
2. Reducir tamaño de fuente: `\small` dentro del entorno table
3. Usar `\resizebox{\textwidth}{!}{...}` para escalar toda la tabla
4. Último recurso: `\begin{landscape}...\end{landscape}` (página rotada)

**Ejemplo**:
```latex
\begin{table}[H]
    \centering
    \small
    \setlength{\tabcolsep}{3pt}
    \begin{tabular}{...}
    ...
    \end{tabular}
    \caption{...}
\end{table}
```

---

### Validación Fase 2

**Comando**:
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
# Revisar visualmente que no hay overfull hbox warnings para tablas
```

**Checklist**:
- [ ] Tabla 2.45 convertida a formato alternativo
- [ ] Tabla 1.2 cabe en márgenes
- [ ] Tabla 2.12 cabe en márgenes
- [ ] Tabla 2.44 cabe en márgenes
- [ ] Tabla 2.47 cabe en márgenes
- [ ] Tabla 2.48 cabe en márgenes
- [ ] Sin warnings de overfull hbox

---

## FASE 3: Formato de Ecuaciones
**Duración**: 5-10 minutos  
**Checkpoint**: Sin ecuaciones con overflow  
**Agente principal**: `latex-writer`

### Tarea 3.1: Convertir ecuaciones largas
**ID**: F-E1 | **Prioridad**: MEDIUM | **Esfuerzo**: MEDIUM

**Descripción**: Ecuaciones que exceden margen. Convertir de `equation` a `align` o `split`.

**Estrategia**:
1. Compilar y identificar visualmente qué ecuaciones se salen de margen
2. Para cada ecuación larga:
   - Cambiar `\begin{equation}...\end{equation}` a `\begin{align}...\end{align}`
   - Usar `&=` para alineación
   - Usar `\nonumber \\` para saltos de línea sin numeración
   - Usar `\quad` para indentación

**Ejemplo**:
```latex
% ANTES:
\begin{equation}
    Q_{\text{total}} = K \cdot (C_1 + C_2 + C_3 + C_4)
\end{equation}

% DESPUÉS:
\begin{align}
    Q_{\text{total}} &= K \cdot (C_1 + C_2 + C_3 + C_4) \nonumber \\
                     &= 1{,}15 \cdot 4416
    \label{eq:caudal-total}
\end{align}
```

**Alternativa (para mantener numeración única)**:
```latex
\begin{equation}
    \begin{split}
        Q &= ... \\
          &= ...
    \end{split}
    \label{eq:...}
\end{equation}
```

---

### Validación Fase 3

**Comando**:
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
# Revisar que no hay overfull hbox warnings para ecuaciones
```

**Checklist**:
- [ ] Sin ecuaciones que se salen de margen
- [ ] Todos los labels funcionan correctamente
- [ ] Sin warnings de overfull hbox en ecuaciones

---

## FASE 4: Formato de Párrafos
**Duración**: 5-10 minutos  
**Checkpoint**: ~20 párrafos con estilo correcto  
**Agente principal**: `latex-writer`

### Tarea 4.1: Cambiar formato global de `\paragraph`
**ID**: F-P1 | **Prioridad**: HIGH | **Esfuerzo**: MEDIUM

**Descripción**: Redefinir `\paragraph` para que:
- SIN negrita (pero sí visible)
- CON subrayado
- Contenido en NUEVA LÍNEA (no continúa en la misma línea)

**Acción**:

#### Paso 1: Modificar `preamble.sty`

Añadir después de `\usepackage{titlesec}` (que ya existe en línea 10):

```latex
% Paquete para subrayado
\usepackage{ulem}
\normalem  % Mantiene \emph como cursiva (no subrayado)

% Redefinir formato de \paragraph
\titleformat{\paragraph}[hang]
    {\normalfont\normalsize}  % Sin negrita, tamaño normal
    {\theparagraph}           % Numeración (si aplica)
    {1em}                     % Espacio después del número
    {\uline}                  % Título subrayado
    
\titlespacing*{\paragraph}
    {0pt}                     % Sangría izquierda
    {3.25ex plus 1ex minus .2ex}  % Espacio antes
    {1.5em}                   % Espacio después (fuerza nueva línea)
```

**Ubicación en `preamble.sty`**: Después de línea 71 (`\titlespacing*{\subsection}...`)

#### Paso 2: Verificación visual

Los ~20 párrafos deben verse así en el PDF:
```
<u>Título del párrafo</u>

El contenido empieza en la siguiente línea...
```

**Apariciones de `\paragraph` en documento**: ~20 ubicaciones documentadas en `formatting_fix.md`

---

### Validación Fase 4

**Comando**:
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
```

**Checklist visual en PDF**:
- [ ] Títulos de `\paragraph` NO están en negrita
- [ ] Títulos de `\paragraph` SÍ están subrayados
- [ ] Contenido comienza en nueva línea (no continúa en misma línea del título)
- [ ] Espaciado vertical es coherente
- [ ] No hay efectos colaterales en `\section`, `\subsection`, etc.

---

## FASE 5: Reorganización de Figuras (Anejos 2 y 3)
**Duración**: 20-30 minutos  
**Checkpoint**: Referencias cruzadas correctas, índice de figuras actualizado  
**Agente principal**: `latex-writer`

### Inventario de Figuras a Reorganizar

**Total**: 28 figuras de tramos (14 dibujos + 14 cálculos)

**MANTENER en cuerpo principal** (4 figuras):
- Vapor_TR1_Caldera-P.pdf (dibujo, sección 2.2.3)
- Vapor_TR1_Caldera-P.pdf (cálculos, sección 2.2.3)
- Condensados_TR1_Caldera-P.pdf (dibujo, sección 2.3.4)
- Condensados_TR1_Caldera-P.pdf (cálculos, sección 2.3.4)

**MOVER a Anejo 2** (14 figuras - dibujos):
- Vapor: TR2, TR3, TR4, TR5, TR6, TR7 (6 figuras)
- Condensados: TR2, TR3, TR4, TR5, TR6, TR7 (6 figuras)
- Nota: TR1 de ambas redes también va en Anejo 2 (se duplica con cuerpo)

**MOVER a Anejo 3** (14 figuras - cálculos rotados):
- Vapor: TR2, TR3, TR4, TR5, TR6, TR7 (6 figuras)
- Condensados: TR2, TR3, TR4, TR5, TR6, TR7 (6 figuras)
- Nota: TR1 de ambas redes también va en Anejo 3 (se duplica con cuerpo)

---

### Tarea 5.1: Identificar figuras actuales
**ID**: I-STEP1 | **Esfuerzo**: EASY

**Comando**:
```bash
grep -n "includegraphics.*dibujos_tramos\|includegraphics.*calculos_tramos" plantilla.tex
grep -n "label{fig:.*tramo\|label{fig:.*TR" plantilla.tex
```

**Documentar**: Ubicación exacta de cada figura en secciones 2.2 y 2.3

---

### Tarea 5.2: Crear Anejo 2 - Diagramas esquemáticos
**ID**: I-STEP2 | **Esfuerzo**: MEDIUM

**Ubicación en documento**: Inmediatamente después de Bibliografía (antes de `\end{document}`)

**Código LaTeX completo** (ver `Instrucciones_adicionales.md#PASO2`):

```latex
\clearpage
\section*{Anejo 2: Diagramas esquemáticos de tramos}
\addcontentsline{toc}{section}{Anejo 2: Diagramas esquemáticos de tramos}

\subsection*{A2.1. Introducción}
El presente anejo recoge los esquemas detallados de todos los tramos de las redes de distribución de vapor y retorno de condensados...

\clearpage
\subsection*{A2.2. Red de Vapor - Diagramas de tramos}
% [14 figuras de vapor: TR1-TR7, dibujos]
% Cada figura usa: \includegraphics[width=0.9\textwidth]{...}
% Caption: "Diagrama del Tramo X (...) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal."
% Label: fig:anejo2-vapor-trX

\clearpage
\subsection*{A2.3. Red de Condensados - Diagramas de tramos}
% [14 figuras de condensados: TR1-TR7, dibujos]
% Mismo formato que A2.2
% Label: fig:anejo2-cond-trX
```

**Referencia detallada**: Ver documento `Instrucciones_adicionales.md`, sección "PASO 2"

---

### Tarea 5.3: Crear Anejo 3 - Hojas de cálculo
**ID**: I-STEP3 | **Esfuerzo**: MEDIUM

**Ubicación en documento**: Inmediatamente después de Anejo 2

**Código LaTeX completo** (ver `Instrucciones_adicionales.md#PASO3`):

```latex
\clearpage
\section*{Anejo 3: Hojas de cálculo de dimensionado hidráulico}
\addcontentsline{toc}{section}{Anejo 3: Hojas de cálculo}

\subsection*{A3.1. Introducción}
El presente anejo contiene las hojas de cálculo generadas mediante la herramienta de dimensionado...

\clearpage
\subsection*{A3.2. Red de Vapor - Hojas de cálculo}
% [14 figuras de vapor: TR1-TR7, cálculos ROTADAS]
% Cada figura usa: \includegraphics[angle=90,origin=c,width=\textwidth]{...}
% Caption: "Hoja de cálculo del Tramo X (...) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal."
% Label: fig:anejo3-vapor-trX

\clearpage
\subsection*{A3.3. Red de Condensados - Hojas de cálculo}
% [14 figuras de condensados: TR1-TR7, cálculos ROTADAS]
% Mismo formato que A3.2
% Label: fig:anejo3-cond-trX
```

**Nota importante**: Las hojas de cálculo se insertan con `angle=90,origin=c` para rotarlas 90°

**Referencia detallada**: Ver documento `Instrucciones_adicionales.md`, sección "PASO 3"

---

### Tarea 5.4: Mover figuras del cuerpo principal
**ID**: I-STEP4-5 | **Esfuerzo**: MEDIUM

**Acción para TR1 (MANTENER)**:
1. Localizadas en secciones 2.2.3 y 2.3.4
2. Actualizar captions para incluir: "Fuente: Herramienta de [diseño/cálculo]. Elaboración grupal."
3. Añadir nota: "Esta hoja se incluye también en el Anejo X para referencia."

**Acción para TR2-TR7 (ELIMINAR del cuerpo)**:
1. Localizar bloques `\begin{figure}[H]...\end{figure}`
2. ELIMINAR la figura completa
3. REEMPLAZAR con texto:

```latex
Los esquemas detallados y hojas de cálculo de los Tramos 2 a 7 se encuentran en los Anejos 2 y 3 respectivamente. Para el Tramo X (descripción), véase:
\begin{itemize}
    \item Diagrama esquemático: Anejo 2, Figura \ref{fig:anejo2-vapor-trX}
    \item Hoja de cálculo: Anejo 3, Figura \ref{fig:anejo3-vapor-trX}
\end{itemize}
```

**Importante**: Mantener **tablas resumen** de resultados en el cuerpo principal. Solo mover **figuras grandes**.

---

### Tarea 5.5: Actualizar formato de captions
**ID**: I-STEP6 | **Esfuerzo**: EASY

**Especificación de formato**:

**Dibujos** (dibujos_tramos/):
```
Diagrama del Tramo X (nombre) - Red de [Vapor/Condensados]. Fuente: Herramienta de diseño. Elaboración grupal.
```

**Cálculos** (calculos_tramos/):
```
Hoja de cálculo del Tramo X (nombre) - Red de [Vapor/Condensados]. Fuente: Herramienta de cálculo. Elaboración grupal.
```

**Verificación**:
```bash
grep -A 1 "includegraphics.*_tramos/" plantilla.tex | \
grep "caption" | \
grep -c "Elaboración grupal"
# Debe retornar: 28 (para todos los captions de tramos)
```

---

### Tarea 5.6: Actualizar referencias cruzadas
**ID**: I-STEP7 | **Esfuerzo**: MEDIUM

**Búsqueda de referencias antiguas**:
```bash
grep -n "\\ref{fig:.*vapor.*tr\|\\ref{fig:.*cond.*tr\|\\figref{.*tr" plantilla.tex
```

**Conversión de referencias**:

| Para TR1 (MANTENER en cuerpo) | No cambiar |
| Para TR2-TR7 (EN ANEJOS) | Actualizar a `\ref{fig:anejo2-...}` o `\ref{fig:anejo3-...}` |

**Ejemplo**:
```latex
% ANTES (en sección 2.2, refiriendo a Tramo 2):
Véase diagrama en \figref{fig:vapor-tr2}...

% DESPUÉS:
Véase diagrama en Anejo 2 (\figref{fig:anejo2-vapor-tr2})...
```

---

### Validación Fase 5

**Comando**:
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
pdflatex plantilla.tex  # Ejecutar 2 veces para resolver referencias
```

**Checklist**:
- [ ] Anejo 2 aparece en índice general (TOC)
- [ ] Anejo 3 aparece en índice general (TOC)
- [ ] No hay `undefined reference` warnings
- [ ] Índice de figuras incluye Anejos
- [ ] Secciones 2.2 y 2.3 solo muestran TR1
- [ ] Anejos contienen 28 figuras totales
- [ ] Todos los captions incluyen "Elaboración grupal"
- [ ] Referencias de TR2-TR7 apuntan a Anejos

---

## FASE 6: Reestructuración Opcional
**Duración**: 5-10 minutos  
**Checkpoint**: Coherencia de sección 2.2  
**Agente principal**: `steam-researcher` + `latex-writer`

### Tarea 6.1: Reestructurar sección 2.2.2
**ID**: D4 | **Prioridad**: MEDIUM | **Esfuerzo**: HARD

**Descripción**: Sección "Concepto de longitud equivalente" (~líneas 783-859) puede estar parcialmente duplicada con contenido previo.

**Acción**:
1. Leer sección 2.2.2 completa
2. Comparar con contenido previo de sección 2.1 (bases de diseño)
3. Identificar contenido duplicado
4. Decidir estrategia:
   - ELIMINAR completamente si es 100% redundante
   - CONSOLIDAR si hay contenido único
   - REDUCIR si es parcialmente redundante

**Verificación**:
```bash
grep -n "\\ref{.*longitud.*equiv\|secci.*n.*2.2.2" plantilla.tex
```

---

### Validación Fase 6

**Comando**:
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
```

**Checklist**:
- [ ] Sección 2.2.2 restructurada sin contenido duplicado
- [ ] Compilación exitosa
- [ ] Coherencia general del documento

---

## Validación Final (Después de Fase 6)

**Comandos de verificación**:

```bash
# 1. Compilación completa
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
bibtex plantilla
pdflatex plantilla.tex
pdflatex plantilla.tex

# 2. Verificar rugosidad corregida
grep "0{,}045\|0.045" plantilla.tex  # Debe retornar vacío

# 3. Verificar Tabla 2.8 eliminada
grep "tab:rugosidades-materiales\|Tabla 2.8" plantilla.tex  # Debe retornar vacío

# 4. Verificar figuras de TR2-TR7 fuera de cuerpo
grep "includegraphics.*TR[2-7]" plantilla.tex | grep -v "Anejo"  # Debe retornar vacío

# 5. Verificar captions con "Elaboración grupal"
grep -A 1 "includegraphics.*_tramos/" plantilla.tex | grep "caption" | grep -c "Elaboración grupal"  # Debe retornar 28

# 6. Revisar PDF final
# Inspeccionar visualmente:
# - Índice general incluye Anejos 2 y 3
# - Índice de figuras correcto
# - Secciones 2.2 y 2.3 sin figuras de TR2-TR7
# - Anejos 2 y 3 contienen 28 figuras
```

---

## Resumen de Impacto Esperado

| Métrica | Antes | Después | % Cambio |
|---------|-------|---------|----------|
| **Número de páginas** | ~X | ~X-20 | -15% a -20% |
| **Figuras en cuerpo (tramos)** | 32 | 4 | -87% |
| **Figuras en Anejos** | 0 | 28 | +28 |
| **Rugosidad (ε)** | 0.045 mm | 0.02 mm | Corrección |
| **Tabla 2.8 redundante** | Presente | Eliminada | Simplificación |
| **Tablas con overflow** | ~6 | 0 | Mejora |
| **Formato \paragraph** | Negrita, misma línea | Subrayado, nueva línea | Mejora visual |
| **Referencias cruzadas** | Algunas rotas | Todas funcionales | +100% |

---

## Tiempo Estimado por Fase

| Fase | Descripción | Tareas | Duración |
|------|-------------|--------|----------|
| 1 | Eliminaciones críticas | 8 | 15-25 min |
| 2 | Formato de tablas | 6 | 10-15 min |
| 3 | Formato de ecuaciones | 1 | 5-10 min |
| 4 | Formato de párrafos | 1 | 5-10 min |
| 5 | Reorganización de figuras | 6 | 20-30 min |
| 6 | Reestructuración opcional | 1 | 5-10 min |
| **VALIDACIÓN FINAL** | **Compilación completa** | **-** | **5-10 min** |
| **TOTAL** | **19 tareas** | **-** | **60-100 min** |

---

## Archivos Involucrados

| Archivo | Acción | Fases |
|---------|--------|-------|
| `Practica_Vapor_LaTeX/plantilla.tex` | Edición principal (19 tareas) | 1-6 |
| `Practica_Vapor_LaTeX/preamble.sty` | Añadir configuración `\paragraph` | 4 |
| `Figuras/seleccion_presion.pdf` | Ya existe, insertar en sección 2.1.4 | 1 |
| `Figuras/dibujos_tramos/*.pdf` | Sin cambios, referenciar en Anejos | 5 |
| `Figuras/calculos_tramos/*.pdf` | Sin cambios, referenciar en Anejos (rotadas) | 5 |

---

## Checklist de Pre-Ejecución

- [ ] Backup creado: `plantilla_backup_YYYYMMDD_HHMM.tex`
- [ ] Documento `IMPLEMENTATION_PLAN.md` leído y entendido
- [ ] Referencias a `MASTER_CHECKLIST.md`, `errores_a_corregir.md`, `formatting_fix.md`, `Instrucciones_adicionales.md` verificadas
- [ ] Ruta a `Practica_Vapor_LaTeX/` confirmada
- [ ] Agente `task-orchestrator` configurado
- [ ] Validador LaTeX disponible

---

## Flujo de Ejecución Visual

```
┌─────────────────────────────────────────────────────────────────┐
│                         INICIO                                  │
│                  (Crear backup)                                 │
└────────────────────────┬────────────────────────────────────────┘
                         │
        ┌────────────────▼─────────────────┐
        │   FASE 1: Eliminaciones (8 T.)   │
        │   Duración: 15-25 min            │
        └────────────┬───────────────────┬┘
                     │ Validar           │
        ┌────────────▼─────────────────┐ │
        │   FASE 2: Tablas (6 T.)      │ │
        │   Duración: 10-15 min        │ │
        └────────────┬───────────────────┘ │
                     │ Validar             │
        ┌────────────▼─────────────────┐  │
        │   FASE 3: Ecuaciones (1 T.)  │  │
        │   Duración: 5-10 min         │  │
        └────────────┬───────────────────┘ │
                     │ Validar             │
        ┌────────────▼─────────────────┐  │
        │   FASE 4: Párrafos (1 T.)    │  │
        │   Duración: 5-10 min         │  │
        └────────────┬───────────────────┘ │
                     │ Validar             │
        ┌────────────▼─────────────────┐  │
        │   FASE 5: Figuras (6 T.)     │  │
        │   Duración: 20-30 min        │  │
        └────────────┬───────────────────┘ │
                     │ Validar (2x)        │
        ┌────────────▼─────────────────┐  │
        │   FASE 6: Reestructuración   │  │
        │   Duración: 5-10 min         │  │
        └────────────┬───────────────────┘ │
                     │ Validar             │
        ┌────────────▼─────────────────┐  │
        │   VALIDACIÓN FINAL           │  │
        │   - Compilación 4x           │  │
        │   - Revisión visual          │  │
        │   - Métricas finales         │  │
        └────────────┬──────────────────┘ │
                     │                     │
                     └─────────────────────▼───────────────────┐
                                      │
                     ┌────────────────▼─────────────────┐
                     │   FIN - PDF GENERADO EXITOSAMENTE│
                     │   plantilla.pdf listo para USO    │
                     └──────────────────────────────────┘
```

---

## Notas Importantes

1. **Orden de ejecución**: Las 6 fases deben ejecutarse **secuencialmente**. La compilación después de cada checkpoint previene propagación de errores.

2. **Agentes**: El coordinador `task-orchestrator` delega a:
   - `latex-writer`: Ediciones de contenido
   - `latex-validator`: Compilaciones y verificaciones
   - `steam-researcher`: Consultas técnicas sobre vapor si es necesario

3. **Backup**: Se recomienda crear backup antes de comenzar y después de cada fase crítica.

4. **Validación visual**: Después de compilar, revisar el PDF para asegurar que cambios se vean como se esperan (especialmente fases 4 y 5).

5. **Referencias cruzadas**: Fase 5 requiere compilación doble para resolver todas las referencias.

---

## Contacto y Soporte

Si surgieren errores durante ejecución:
1. Revisar log de compilación LaTeX para mensajes de error específicos
2. Consultar documento técnico correspondiente:
   - Errores de contenido: `errores_a_corregir.md`
   - Errores de formato: `formatting_fix.md`
   - Errores de reorganización: `Instrucciones_adicionales.md`
3. Usar `steam-researcher` para consultas técnicas sobre vapor
4. Consultar `MASTER_CHECKLIST.md` para matriz completa de tareas

---

**Estado**: ✅ LISTO PARA EJECUCIÓN  
**Próximo paso**: Crear backup y comenzar Fase 1  
**Comando**: `task-orchestrator` procede automáticamente

---

**FIN DEL PLAN DE IMPLEMENTACIÓN**
