# ERRORES A CORREGIR EN LA MEMORIA TÉCNICA
**Documento**: `Practica_Vapor_LaTeX\plantilla.tex`  
**Última actualización**: Marzo 2026  
**Estado**: Pendiente de corrección

---

## LEYENDA
- **Prioridad**: HIGH (crítico para coherencia técnica) | MEDIUM (mejora calidad) | LOW (cosmético)
- **Esfuerzo**: EASY (< 15 min) | MEDIUM (15-45 min) | HARD (> 45 min o reestructuración)
- **Cross-ref**: Referencias cruzadas a otros documentos de planificación

---

## QUICK REFERENCE CHECKLIST
- [ ] **P1-HIGH**: PUNTOS_CONSUMO - Eliminar tabla redundante (Tabla 1.1 o descripción previa)
- [ ] **P2-LOW**: PUNTOS_CONSUMO - Eliminar duplicado de Ecuación 1.1
- [ ] **M1-LOW**: METODOLOGÍA - Eliminar columna "Grado de sobrecalentamiento" en tablas
- [ ] **M2-HIGH**: METODOLOGÍA - Verificar/reemplazar Figura 2.1 (esquema caldera)
- [ ] **M3-HIGH**: METODOLOGÍA - Añadir figura faltante `seleccion_presion.pdf`
- [ ] **D1-HIGH**: DIMENSIONADO - Consolidar información de rugosidad (0.02 mm, no 0.045 mm)
- [ ] **D2-HIGH**: DIMENSIONADO - Eliminar Tabla 2.8 (rugosidades)
- [ ] **D3-MEDIUM**: DIMENSIONADO - Eliminar tablas duplicadas de longitudes equivalentes
- [ ] **D4-MEDIUM**: DIMENSIONADO - Reestructurar sección 2.2.2 (longitud equivalente repetida)

---

# SECCIÓN 1: PUNTOS DE CONSUMO Y REQUERIMIENTOS INICIALES

## Error P1: Tabla redundante de requerimientos de consumo
**Priority**: HIGH  
**Effort**: MEDIUM  
**Location**: ~Líneas 118-180

### Problema
Se están presentando dos tablas con información similar sobre los requerimientos de consumo:
- Una tabla inicial descriptiva (posiblemente sin numeración formal)
- **Tabla 1.2** (referenciada como `tab:consumidores-requerimientos` en línea 177)

Según especificaciones, la **Tabla 1.1** ya contiene información similar y resulta redundante.

### Acción requerida
Dejar **únicamente la Tabla 1.2**. Eliminar cualquier tabla previa que duplique esta información.

### Verificación
```bash
# Buscar referencias a la tabla eliminada
grep -n "\\ref{tab:tabla1.1}\|Tabla 1.1" Practica_Vapor_LaTeX/plantilla.tex
```

### Cross-ref
- Ninguna en otros documentos

---

## Error P2: Cálculo del caudal total de diseño duplicado
**Priority**: LOW  
**Effort**: EASY  
**Location**: Múltiples secciones (buscar ecuación del caudal total)

### Problema
El cálculo del caudal total de diseño aparece en la **Ecuación (1.1)** y se vuelve a incluir en secciones posteriores, generando redundancia innecesaria.

### Acción requerida
1. Mantener la **Ecuación (1.1)** en su ubicación original
2. En secciones posteriores, usar únicamente referencias: `\eqref{eq:caudal-total}`
3. Eliminar cualquier re-cálculo explícito del mismo valor

### Búsqueda
```bash
# Identificar todas las apariciones del cálculo de caudal total
grep -n "Q_{\text{total}}\|Q_{total}\|caudal.*total.*diseño" Practica_Vapor_LaTeX/plantilla.tex
```

### Cross-ref
- Ninguna

---

# SECCIÓN 2: METODOLOGÍA

## Error M1: Grado de sobrecalentamiento en tablas - columna innecesaria
**Priority**: LOW  
**Effort**: EASY  
**Location**: ~Líneas 287, 521 (Tabla 2.1 y otras)

### Problema
No se ha solicitado en ninguna especificación calcular la **temperatura de sobrecalentamiento**, por lo que no es necesario incluir el "grado de sobrecalentamiento" como columna en las tablas de propiedades del vapor.

### Contexto encontrado
El documento actualmente incluye:
- Línea 264-271: Definición y explicación del grado de sobrecalentamiento (~40°C)
- Línea 287: Tabla con columna "Grado de sobrecalentamiento"
- Línea 521: Otra tabla con la misma columna

### Acción requerida
**OPCIÓN 1 (Recomendada)**: Eliminar únicamente las **columnas** de las tablas que muestren el grado de sobrecalentamiento, pero **mantener** la explicación textual en líneas 264-271 (es información técnica útil).

**OPCIÓN 2**: Eliminar tanto columnas como texto explicativo (más agresivo, menos recomendado).

### Ejemplo de corrección
```latex
% ANTES (línea ~287):
Grado de sobrecalentamiento & $\Delta T_{\text{sob}}$ & 40 & °C \\

% DESPUÉS:
% [Eliminar esta línea del entorno tabular]
```

### Cross-ref
- Relacionado con `formatting_fix.md` - ajustes de formato en tablas

---

## Error M2: Figura 2.1 - esquema de caldera incorrecto
**Priority**: HIGH  
**Effort**: MEDIUM  
**Location**: ~Línea 580-581

### Problema
La **Figura 2.1** muestra el cálculo de la potencia térmica de la caldera mediante una imagen que proviene del catálogo de la propia caldera. Sin embargo, **es específica para una caldera que NO tiene economizador**, lo cual puede no corresponder con el modelo exacto seleccionado.

### Ubicación actual
```latex
% Línea 580-581:
\caption{Esquema de la caldera Viessmann VITOMAX 100-HS M33A. Fuente: Catálogo Viessmann}
\label{fig:ficha-caldera-vitomax}
```

**Archivo**: `Practica_Vapor_LaTeX\Figuras\Vitomax_100HS_33-A.pdf`

### Acción requerida
1. **Verificar** si el modelo M33A seleccionado tiene o no economizador
2. **Si NO tiene**: la figura es correcta, solo actualizar el caption para clarificar
3. **Si SÍ tiene**: reemplazar con el esquema correcto del catálogo

### Sugerencia de caption mejorado
```latex
\caption{Esquema de la caldera Viessmann VITOMAX 100-HS M33A (sin economizador). Fuente: Catálogo Viessmann. Elaboración grupal.}
```

### Cross-ref
- Relacionado con `Instrucciones_adicionales.md` - formato de captions con "Elaboración grupal"

---

## Error M3: Figura faltante - selección de presión
**Priority**: HIGH  
**Effort**: EASY  
**Location**: Sección 2.1.4 "Selección de la caldera de vapor y condiciones de salida" (subsección "Determinación de la presión de diseño")

### Problema
Falta incluir la figura que muestra los criterios de selección de presión de diseño.

**Archivo disponible**: `Practica_Vapor_LaTeX\Figuras\seleccion_presion.pdf`

### Acción requerida
Añadir la figura en la sección **2.1.4**, subsección "**Determinación de la presión de diseño**" (aproximadamente después de la línea 435).

### Código LaTeX a insertar
```latex
\begin{figure}[H]
    \centering
    \includegraphics[width=0.75\textwidth]{Figuras/seleccion_presion.pdf}
    \caption{Criterios de selección de la presión de diseño para la red de vapor. Fuente: Manual de diseño. Elaboración grupal.}
    \label{fig:seleccion-presion-diseno}
\end{figure}
```

### Verificación
Asegurar que el archivo existe:
```bash
ls "Practica_Vapor_LaTeX/Figuras/seleccion_presion.pdf"
```

### Cross-ref
- Ver `Instrucciones_adicionales.md` línea 5 - formato de captions

---

# SECCIÓN 3: DIMENSIONADO HIDRÁULICO DE LA RED DE VAPOR

## Error D1: Información mezclada sobre rugosidad y material de tuberías
**Priority**: HIGH  
**Effort**: MEDIUM  
**Location**: ~Líneas 643-683 (sección "Rugosidad y material de tuberías")

### Problema múltiple
La sección presenta varios problemas de coherencia:

1. **Valores contradictorios de rugosidad**:
   - Línea 654: Se menciona que la rugosidad del acero comercial está en el rango 0.045-0.05 mm y se adopta un valor específico
   - Línea 1083: Se usa rugosidad de ε = 0.045 mm en cálculos
   - **ESPECIFICACIÓN REAL**: Se debe usar **acero laminado nuevo** con rugosidad absoluta de **ε = 0.02 mm**

2. **Tabla 2.8 redundante**: Ver error D2

3. **Ecuación 2.13** (si existe): Posiblemente referencia el valor incorrecto de 0.045 mm

### Acción requerida

#### Paso 1: Corregir el texto (línea ~654)
```latex
% ANTES:
La \textbf{rugosidad absoluta} ($\varepsilon$) del acero comercial nuevo se sitúa en el rango de 0,045 a 0,05~mm. Para los cálculos de la presente instalación se adopta el valor:

% DESPUÉS:
Para la presente instalación se emplea \textbf{acero laminado nuevo}, cuya rugosidad absoluta es:
\[
\varepsilon = 0{,}02 \text{ mm}
\]
Este valor es característico del acero laminado sin uso y se mantiene constante en todos los cálculos de pérdida de carga de la red.
```

#### Paso 2: Eliminar Tabla 2.8
Ver error **D2** a continuación.

#### Paso 3: Corregir cálculos con rugosidad incorrecta
Buscar y corregir todas las apariciones de ε = 0.045 mm:
```bash
grep -n "0{,}045\|0.045" Practica_Vapor_LaTeX/plantilla.tex
# Reemplazar por: 0{,}02 o 0.02
```

#### Paso 4: Actualizar ecuación 2.13 (si aplica)
Si existe una ecuación numerada que define el valor de rugosidad, actualizarla al valor correcto.

### Cross-ref
- **CRÍTICO**: Ver `formatting_fix.md` línea 5 - Tabla 2.8 también tiene problemas de formato
- Este error D1 especifica que Tabla 2.8 **debe eliminarse completamente**

---

## Error D2: Tabla 2.8 - Rugosidad de materiales (ELIMINAR)
**Priority**: HIGH  
**Effort**: EASY  
**Location**: ~Líneas 661-678

### Problema
La **Tabla 2.8** (`tab:rugosidades-materiales`) muestra rugosidades de distintos materiales de tubería, pero:
1. **No es necesaria**: Solo se usa un material (acero laminado nuevo) con un único valor de rugosidad
2. **Genera confusión**: Presenta múltiples valores cuando solo se necesita uno
3. **Datos innecesarios**: Información no solicitada en especificaciones

### Acción requerida
**ELIMINAR completamente la Tabla 2.8**, incluyendo:
- El entorno `\begin{table}...\end{table}`
- El caption
- El label `\label{tab:rugosidades-materiales}`
- Cualquier referencia previa a esta tabla (línea ~661)

### Código a eliminar (aproximado)
```latex
% ELIMINAR DESDE:
La \tabref{tab:rugosidades-materiales} presenta los valores de rugosidad absoluta...

\begin{table}[H]
    \centering
    \caption{Rugosidad absoluta de diferentes materiales de tubería}
    \label{tab:rugosidades-materiales}
    \begin{tabular}{...}
    ...
    \end{tabular}
\end{table}
% HASTA AQUÍ
```

### Verificación post-eliminación
```bash
# Asegurar que no quedan referencias huérfanas
grep -n "\\ref{tab:rugosidades-materiales}\|Tabla 2.8" Practica_Vapor_LaTeX/plantilla.tex
```

### Cross-ref
- **Relacionado con error D1**: parte del mismo problema de rugosidad
- **Ver `formatting_fix.md` línea 5**: esta tabla también tenía problemas de formato (ahora irrelevante, se elimina)

---

## Error D3: Tablas duplicadas de longitudes equivalentes
**Priority**: MEDIUM  
**Effort**: MEDIUM  
**Location**: ~Líneas 719, 820 (múltiples tablas de longitudes equivalentes)

### Problema
Existen varias tablas que presentan información sobre longitudes equivalentes de accesorios:
- Una o más tablas generadas manualmente
- **Figura con imagen**: `Practica_Vapor_LaTeX\Figuras\perdidas_carga_accesorios.png` (línea ~820)

La imagen `perdidas_carga_accesorios.png` contiene toda la información necesaria, haciendo redundantes las demás tablas.

### Acción requerida
1. **MANTENER únicamente**: La figura que usa `perdidas_carga_accesorios.png`
   ```latex
   % Línea ~820:
   \caption{Pérdidas de carga en accesorios expresadas como $L_e/D$. Fuente: Adaptado de \cite{EREN2015}.}
   ```

2. **ELIMINAR**: Cualquier otra tabla que duplique esta información
   - Buscar tablas cerca de línea 719 (`tab:longitudes-equivalentes` o similar)
   - Verificar que no haya tablas de fabricantes (Spirax Sarco, etc.) duplicando info

### Búsqueda de duplicados
```bash
# Encontrar todas las tablas de longitudes equivalentes
grep -n "longitud.*equivalente\|equivalent.*length\|L_e/D" Practica_Vapor_LaTeX/plantilla.tex
```

### Criterio de decisión
**MANTENER**: Tabla/figura que use la imagen `perdidas_carga_accesorios.png`  
**ELIMINAR**: Resto de tablas con datos similares

### Cross-ref
- Ninguna directa, pero relacionado con simplificación de contenido

---

## Error D4: Sección 2.2.2 - Concepto de longitud equivalente repetido
**Priority**: MEDIUM  
**Effort**: HARD (requiere reestructuración)  
**Location**: ~Líneas 783-859 (sección 2.2.2)

### Problema
La sección **2.2.2** incluye un subsección titulada "**Concepto de longitud equivalente**" (línea ~783) que repite información ya presentada anteriormente en la memoria. Esto genera redundancia y aumenta innecesariamente la extensión del documento.

### Contexto
Elementos que pueden estar duplicados:
- Línea 783: `\paragraph{Concepto de longitud equivalente}`
- Línea 810: `\paragraph{Coeficientes de pérdidas en accesorios}`
- Línea 824: `\paragraph{Selección del tipo de codo}`
- Línea 836: `\paragraph{Aplicación a los tramos del proyecto}`

### Análisis requerido
Antes de actuar, realizar una **revisión comparativa**:
1. Identificar qué contenido de esta sección ya aparece antes
2. Identificar qué contenido es único y debe preservarse
3. Decidir estrategia de consolidación

### Opciones de acción

#### OPCIÓN 1: Eliminar completamente la subsección (si es 100% redundante)
```latex
% Si TODO el contenido ya está explicado antes, eliminar desde:
\paragraph{Concepto de longitud equivalente}
% Hasta el final de la subsección 2.2.2
```

#### OPCIÓN 2: Consolidar con sección previa
Mover el contenido único a la primera aparición del tema y eliminar la subsección 2.2.2.

#### OPCIÓN 3: Reducir y mantener solo contenido único
Mantener la subsección pero eliminar los párrafos redundantes, conservando solo información no presentada previamente.

### Acción inmediata recomendada
**REVIEW MANUAL REQUERIDA**: Leer sección 2.2.2 completa y comparar con contenido previo para determinar qué opción aplicar.

### Verificación
Después de la reestructuración, verificar coherencia:
```bash
# Buscar referencias cruzadas a esta sección
grep -n "\\ref{.*longitud.*equiv\|secci.*n.*2.2.2" Practica_Vapor_LaTeX/plantilla.tex
```

### Cross-ref
- Relacionado con error **D3** (tablas de longitudes equivalentes)
- Puede afectar estructura general del índice

---

# NOTAS ADICIONALES

## Correcciones de estilo transversales
Además de los errores específicos arriba, considerar:

1. **Uniformidad en referencias**: Usar siempre `\tabref{}`, `\figref{}`, `\eqref{}` en lugar de texto manual
2. **Coherencia en unidades**: Verificar uso consistente de unidades (bar(a), bar(g), kg/h, etc.)
3. **Nomenclatura**: Mantener consistencia en nombres de tramos (TR1, Tramo 1, Tramo Caldera-P, etc.)

## Documentos relacionados
- **`formatting_fix.md`**: Errores de formato LaTeX (tablas anchas, ecuaciones, párrafos)
- **`Instrucciones_adicionales.md`**: Reorganización de figuras en anejos
- **`MASTER_CHECKLIST.md`**: Checklist consolidado de todas las tareas

---

**FIN DEL DOCUMENTO**
