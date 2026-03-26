# ERRORES DE FORMATO LaTeX A CORREGIR
**Documento**: `Practica_Vapor_LaTeX\plantilla.tex`  
**Última actualización**: Marzo 2026  
**Tipo**: Problemas de formato, renderizado y estilo LaTeX

---

## LEYENDA
- **Prioridad**: HIGH (afecta legibilidad/compilación) | MEDIUM (mejora presentación) | LOW (estético)
- **Esfuerzo**: EASY (< 15 min) | MEDIUM (15-45 min) | HARD (> 45 min o múltiples cambios)
- **Estado**: ⚠️ Requiere corrección | ⛔ Eliminar (ver errores_a_corregir.md) | ✅ Verificar post-corrección

---

## QUICK REFERENCE CHECKLIST
- [ ] **F-T1**: Tabla 1.2 - Ajustar ancho de columnas
- [ ] **F-T2**: Tabla 2.12 - Formato excede margen
- [ ] **F-T3**: Tabla 2.44 - Formato excede margen
- [ ] **F-T4**: Tabla 2.45 - Considerar alternativa sin tabla
- [ ] **F-T5**: Tabla 2.47 - Ajustar formato
- [ ] **F-T6**: Tabla 2.48 - Ajustar formato
- [ ] **F-T7**: ⛔ Tabla 2.8 - ELIMINAR (cross-ref: errores_a_corregir.md#D2)
- [ ] **F-E1**: Ecuaciones largas - Usar align en lugar de equation
- [ ] **F-P1**: Todos los \paragraph - Cambiar formato (sin negrita, con subrayado, nueva línea)

---

# CATEGORÍA 1: PROBLEMAS DE FORMATO EN TABLAS

## F-T1: Tabla 1.2 - Ajuste de columnas
**Priority**: MEDIUM  
**Effort**: EASY  
**Estado**: ⚠️ Requiere ajuste  
**Location**: ~Línea 176-207

### Problema
La tabla de requerimientos de los puntos de consumo excede el ancho disponible o tiene columnas desproporcionadas.

### Identificación
```bash
# Buscar la tabla
grep -A 30 "label{tab:consumidores-requerimientos}" Practica_Vapor_LaTeX/plantilla.tex
```

### Soluciones posibles

#### OPCIÓN 1: Ajustar \tabcolsep (espaciado entre columnas)
```latex
\begin{table}[H]
    \centering
    \setlength{\tabcolsep}{4pt}  % Reducir de 6pt (default) a 4pt
    \begin{tabular}{...}
    ...
    \end{tabular}
\end{table}
```

#### OPCIÓN 2: Usar \resizebox (escalar toda la tabla)
```latex
\begin{table}[H]
    \centering
    \resizebox{\textwidth}{!}{%  % Escala al ancho de texto manteniendo proporción
        \begin{tabular}{...}
        ...
        \end{tabular}
    }
    \caption{...}
\end{table}
```

#### OPCIÓN 3: Ajustar especificadores de columna
```latex
% ANTES (columnas fijas que pueden ser demasiado anchas):
\begin{tabular}{|l|c|c|c|c|}

% DESPUÉS (columnas con ancho proporcional):
\begin{tabular}{|l|>{\centering\arraybackslash}p{2cm}|>{\centering\arraybackslash}p{2cm}|...|}
% Requiere: \usepackage{array}
```

#### OPCIÓN 4: Tabla landscape (rotar página)
```latex
\begin{landscape}  % Requiere: \usepackage{pdflscape}
    \begin{table}[H]
        \centering
        \begin{tabular}{...}
        ...
        \end{tabular}
        \caption{...}
    \end{table}
\end{landscape}
```

### Recomendación
Probar en orden: Opción 1 → Opción 2 → Opción 3 → Opción 4

### Verificación
Compilar PDF y verificar que:
- [ ] La tabla no se sale de los márgenes
- [ ] El texto es legible (no demasiado pequeño)
- [ ] Mantiene alineación profesional

---

## F-T2: Tabla 2.12 - Formato excede margen
**Priority**: MEDIUM  
**Effort**: EASY  
**Estado**: ⚠️ Requiere ajuste  
**Location**: ~Línea 760-780 (búsqueda requerida)

### Problema
Formato de tabla que no entra dentro del ancho de página establecido.

### Identificación
```bash
# Buscar la tabla (puede estar cerca de resumen de criterios)
grep -n "caption.*Tabla.*criterios\|label{tab:.*criterios.*diseno}" Practica_Vapor_LaTeX/plantilla.tex
```

### Solución
Aplicar las mismas estrategias que F-T1. Si esta tabla contiene muchas columnas numéricas:

```latex
% Usar columnas tipo S de siunitx para alinear números
\usepackage{siunitx}

\begin{tabular}{l S[table-format=4.2] S[table-format=2.3] ...}
    Parámetro & {Valor} & {Unidad} \\
    \midrule
    Velocidad & 35.5 & m/s \\
    ...
\end{tabular}
```

### Recomendación específica
Para tablas de resumen con múltiples columnas:
1. Reducir `\tabcolsep` a 3-4pt
2. Usar `\small` o `\footnotesize` dentro del entorno table
3. Si persiste: usar `\resizebox`

---

## F-T3: Tabla 2.44 - Formato excede margen
**Priority**: MEDIUM  
**Effort**: EASY  
**Estado**: ⚠️ Requiere ajuste  
**Location**: Sección 2.2 o 2.3 (dimensionado de tramos)

### Problema
Tabla en sección de dimensionado de tramos que excede margen.

### Identificación
Buscar en secciones de cálculo de tramos (TR3, TR4, TR5...):
```bash
grep -n "caption.*44\|Tabla.*2.44" Practica_Vapor_LaTeX/plantilla.tex
```

### Solución recomendada
Estas tablas suelen contener múltiples parámetros técnicos. Estrategia:

```latex
% ANTES:
\begin{table}[H]
    \centering
    \begin{tabular}{|l|c|c|c|c|c|c|}
    \hline
    Parámetro & Valor 1 & Valor 2 & ... \\
    \hline
    ...
    \end{tabular}
\end{table}

% DESPUÉS:
\begin{table}[H]
    \centering
    \small  % Reduce tamaño de fuente
    \setlength{\tabcolsep}{3pt}  % Reduce espacio entre columnas
    \begin{tabular}{|l|c|c|c|c|c|c|}
    \hline
    Parámetro & Valor 1 & Valor 2 & ... \\
    \hline
    ...
    \end{tabular}
    \caption{...}
\end{table}
```

### Alternativa avanzada
Si la tabla tiene demasiadas columnas, considerar dividirla en dos subtablas:
```latex
% Tabla 2.44a - Parámetros de entrada
% Tabla 2.44b - Resultados de cálculo
```

---

## F-T4: Tabla 2.45 - Considerar alternativa sin tabla
**Priority**: HIGH  
**Effort**: MEDIUM  
**Estado**: ⚠️ Requiere análisis + posible reescritura  
**Location**: Cerca de Tabla 2.44

### Problema especial
Esta tabla no solo tiene problemas de formato, sino que **se sugiere explicar la información de otra forma sin usar tabla**.

### Análisis requerido
1. **Revisar contenido**: ¿Qué información contiene la Tabla 2.45?
2. **Evaluar alternativas**:
   - ¿Se puede expresar como lista descriptiva?
   - ¿Se puede convertir en texto con valores inline?
   - ¿Se puede representar como figura/diagrama?

### Ejemplo de conversión tabla → texto

```latex
% ANTES (tabla con 2-3 filas):
\begin{table}[H]
    \centering
    \begin{tabular}{|l|c|c|}
    \hline
    Componente & Cantidad & Función \\
    \hline
    Válvula A & 1 & Regulación \\
    Válvula B & 2 & Retención \\
    \hline
    \end{tabular}
    \caption{Componentes del sistema}
\end{table}

% DESPUÉS (texto con formato):
\paragraph{Componentes del sistema}

El sistema incorpora los siguientes elementos:
\begin{itemize}
    \item \textbf{Válvula de regulación (A):} Una unidad instalada en [ubicación] para control de flujo.
    \item \textbf{Válvulas de retención (B):} Dos unidades que previenen el retorno de fluido.
\end{itemize}
```

### Ejemplo de conversión tabla → figura

Si los datos son relacionales o secuenciales, considerar diagrama:
```latex
\begin{figure}[H]
    \centering
    \begin{tikzpicture}
        % Diagrama de flujo o esquema
    \end{tikzpicture}
    \caption{Esquema de [concepto]}
\end{figure}
```

### Decisión requerida
**ACCIÓN INMEDIATA**: Revisar Tabla 2.45 y decidir formato alternativo antes de corregir.

---

## F-T5: Tabla 2.47 - Ajustar formato
**Priority**: MEDIUM  
**Effort**: EASY  
**Estado**: ⚠️ Requiere ajuste  

### Problema
Formato excede margen. Aplicar soluciones estándar.

### Solución rápida
```latex
\begin{table}[H]
    \centering
    \small
    \setlength{\tabcolsep}{4pt}
    \resizebox{\textwidth}{!}{%
        \begin{tabular}{...}
        ...
        \end{tabular}
    }
    \caption{...}
\end{table}
```

---

## F-T6: Tabla 2.48 - Ajustar formato
**Priority**: MEDIUM  
**Effort**: EASY  
**Estado**: ⚠️ Requiere ajuste  

### Problema
Similar a F-T5. Formato excede margen.

### Solución
Aplicar misma estrategia que F-T5.

---

## F-T7: ⛔ Tabla 2.8 - Rugosidades (ELIMINAR)
**Priority**: HIGH  
**Effort**: EASY  
**Estado**: ⛔ ELIMINAR COMPLETAMENTE  
**Location**: ~Línea 661-678

### Problema
Esta tabla tiene problemas de formato **Y** debe ser eliminada por razones de contenido.

### Acción requerida
**NO CORREGIR EL FORMATO** - Directamente **ELIMINAR** la tabla completa.

### Cross-reference
⚠️ **Ver documento `errores_a_corregir.md`, error D2** para detalles completos sobre por qué se elimina.

**Resumen**: Tabla innecesaria que muestra rugosidades de múltiples materiales cuando solo se usa uno (acero laminado, ε = 0.02 mm).

### Código a eliminar
```latex
% ELIMINAR TODO:
La \tabref{tab:rugosidades-materiales} presenta los valores...

\begin{table}[H]
    \centering
    \caption{Rugosidad absoluta de diferentes materiales de tubería}
    \label{tab:rugosidades-materiales}
    \begin{tabular}{...}
    ...
    \end{tabular}
\end{table}
```

### Verificación post-eliminación
```bash
grep -n "\\ref{tab:rugosidades-materiales}\|Tabla 2.8" Practica_Vapor_LaTeX/plantilla.tex
# Debe retornar: vacío (sin resultados)
```

---

# CATEGORÍA 2: ECUACIONES QUE EXCEDEN UNA LÍNEA

## F-E1: Ecuaciones largas - Usar `align` en lugar de `equation`
**Priority**: MEDIUM  
**Effort**: MEDIUM (múltiples ecuaciones)  
**Estado**: ⚠️ Requiere conversión  
**Location**: A lo largo de todo el documento

### Problema
Hay ecuaciones que pasan de una línea y se salen del margen o se superponen con el número de ecuación. El entorno `equation` no maneja automáticamente el salto de línea.

### Identificación
Compilar el PDF y buscar visualmente ecuaciones que:
- Se extienden más allá del margen derecho
- Tienen números de ecuación superpuestos con el contenido
- Muestran overflow warnings en el log de compilación

```bash
# Buscar ecuaciones potencialmente largas (con muchos caracteres)
grep -n "\\begin{equation}" Practica_Vapor_LaTeX/plantilla.tex | while read line; do
    # Analizar longitud de contenido entre \begin{equation} y \end{equation}
done
```

### Solución: Conversión `equation` → `align`

#### Ejemplo 1: Ecuación simple larga
```latex
% ANTES (se sale del margen):
\begin{equation}
    Q_{\text{total}} = Q_{\text{C1}} + Q_{\text{C2}} + Q_{\text{C3}} + Q_{\text{C4}} + \text{Margen de seguridad}
    \label{eq:caudal-total}
\end{equation}

% DESPUÉS (dividida en líneas):
\begin{align}
    Q_{\text{total}} &= Q_{\text{C1}} + Q_{\text{C2}} + Q_{\text{C3}} + Q_{\text{C4}} \nonumber \\
                     &\quad + \text{Margen de seguridad}
    \label{eq:caudal-total}
\end{align}
```

**Notas**:
- `\nonumber` en la primera línea evita numerar cada línea intermedia
- `\quad` añade espacio para indicar continuación
- Label solo en la última línea

#### Ejemplo 2: Ecuación con fracciones y raíces largas
```latex
% ANTES:
\begin{equation}
    f = \left[-2 \log_{10}\left(\frac{\varepsilon/D}{3.7} + \frac{5.74}{\text{Re}^{0.9}}\right)\right]^{-2}
    \label{eq:churchill}
\end{equation}

% DESPUÉS (dividida si es necesario):
\begin{align}
    f &= \left[-2 \log_{10}\left(\frac{\varepsilon/D}{3.7} + \frac{5.74}{\text{Re}^{0.9}}\right)\right]^{-2}
    \label{eq:churchill}
\end{align}
```

Si aún no cabe:
```latex
\begin{align}
    f &= \left[-2 \log_{10}\left(\frac{\varepsilon/D}{3.7} \right. \right. \nonumber \\
      &\quad \left. \left. + \frac{5.74}{\text{Re}^{0.9}}\right)\right]^{-2}
    \label{eq:churchill}
\end{align}
```

#### Ejemplo 3: Múltiples ecuaciones relacionadas
```latex
% ANTES (tres equations separadas):
\begin{equation}
    Q_1 = \rho \cdot v_1 \cdot A_1
\end{equation}
\begin{equation}
    Q_2 = \rho \cdot v_2 \cdot A_2
\end{equation}
\begin{equation}
    Q_1 = Q_2
\end{equation}

% DESPUÉS (un solo align):
\begin{align}
    Q_1 &= \rho \cdot v_1 \cdot A_1 \label{eq:caudal-1} \\
    Q_2 &= \rho \cdot v_2 \cdot A_2 \label{eq:caudal-2} \\
    Q_1 &= Q_2 \label{eq:continuidad}
\end{align}
```

### Alternativas avanzadas

#### Usar `split` dentro de `equation` (numera el conjunto)
```latex
\begin{equation}
    \begin{split}
        Q_{\text{total}} &= Q_{\text{C1}} + Q_{\text{C2}} + Q_{\text{C3}} \\
                         &\quad + Q_{\text{C4}} + \text{Margen}
    \end{split}
    \label{eq:caudal-total}
\end{equation}
```

#### Usar `multline` (primera línea izq., última der.)
```latex
\begin{multline}
    \text{Expresión muy larga parte 1} + \text{parte 2} \\
    + \text{parte 3} + \text{resultado final}
    \label{eq:multlinea}
\end{multline}
```

### Paquetes requeridos
Verificar que el preámbulo incluya:
```latex
\usepackage{amsmath}  % Proporciona align, split, multline, etc.
```

### Verificación
Después de las correcciones:
1. Compilar PDF
2. Revisar cada ecuación modificada
3. Verificar que:
   - [ ] No hay overflow (texto fuera de margen)
   - [ ] Los números de ecuación están correctamente posicionados
   - [ ] La alineación de `&` es coherente
   - [ ] Las referencias `\eqref{}` siguen funcionando

---

# CATEGORÍA 3: FORMATO DE PÁRRAFOS (\paragraph)

## F-P1: Estilo de `\paragraph{}` - Cambio global
**Priority**: HIGH  
**Effort**: MEDIUM (requiere modificación en preámbulo + verificación)  
**Estado**: ⚠️ Requiere implementación  
**Location**: 
- Paquete `preamble.sty` o `plantilla.tex` (preámbulo)
- ~20 apariciones de `\paragraph` a lo largo del documento

### Problema actual
Los `\paragraph{título}` actualmente se renderizan:
- **En negrita** (bold)
- **Sin subrayado**
- **Contenido continúa en la misma línea** inmediatamente después del título

```latex
% Renderizado actual:
\paragraph{Título del párrafo} El contenido sigue en la misma línea...
```

**Resultado visual actual**:  
**Título del párrafo** El contenido sigue en la misma línea...

### Formato deseado
Los `\paragraph{título}` deben renderizarse:
- **SIN negrita** (normal weight)
- **CON subrayado** (underlined)
- **Contenido en línea SIGUIENTE** (salto de línea después del título)

**Resultado visual deseado**:  
<u>Título del párrafo</u>

El contenido empieza en la línea siguiente...

### Solución global (RECOMENDADA)

#### Paso 1: Modificar preámbulo
Añadir en `preamble.sty` o al inicio de `plantilla.tex` (antes de `\begin{document}`):

```latex
% Paquetes necesarios
\usepackage{titlesec}  % Para personalizar títulos de secciones
\usepackage{ulem}      % Para subrayado (\uline)
\normalem              % Mantiene \emph{} como cursiva (no subrayado)

% Redefinir formato de \paragraph
\titleformat{\paragraph}[hang]              % Estilo 'hang'
    {\normalfont\normalsize}                % Sin negrita, tamaño normal
    {\theparagraph}                         % Numeración (si aplica)
    {1em}                                   % Espacio después del número
    {\uline}                                % Título subrayado
    
\titlespacing*{\paragraph}                  % Espaciado
    {0pt}                                   % Sangría izquierda
    {3.25ex plus 1ex minus .2ex}           % Espacio antes
    {1.5em}                                 % Espacio después (fuerza nueva línea)
```

**Explicación de parámetros**:
- `[hang]`: Estilo colgante (texto después del título puede ajustarse)
- `\normalfont\normalsize`: Peso y tamaño normales (no negrita)
- `\uline`: Comando de `ulem` para subrayar el título
- `1.5em` en `\titlespacing`: Espacio **vertical** después del título (fuerza salto de línea)

#### Paso 2: Usar `\paragraph` con nueva línea explícita (opcional)
Si el paso 1 no fuerza completamente el salto de línea, modificar cada uso:

```latex
% ANTES:
\paragraph{Título} Contenido en la misma línea...

% DESPUÉS:
\paragraph{Título}

Contenido en línea nueva...
```

**Nota**: Con `\titlespacing` configurado correctamente (1.5em o más), esto debería ser innecesario.

### Solución manual (NO RECOMENDADA, pero funcional)

Si no se desea usar `titlesec`, modificar cada `\paragraph` individualmente:

```latex
% ANTES:
\paragraph{Título del párrafo} Contenido...

% DESPUÉS:
\noindent\uline{Título del párrafo}

\noindent Contenido en la siguiente línea...
```

**Desventajas**:
- Requiere cambiar ~20 apariciones manualmente
- Pierde numeración automática de \paragraph
- Pierde integración con índice de contenidos
- Mayor propensión a errores

### Ubicaciones de `\paragraph` en el documento

```bash
# Listar todas las apariciones
grep -n "\\paragraph{" Practica_Vapor_LaTeX/plantilla.tex
```

**Apariciones identificadas** (~líneas):
- 338: Composición del margen de seguridad
- 344: Cálculo de la potencia térmica
- 376: Método alternativo: Factor f
- 396: Margen de reserva de la instalación
- 424: Criterios de selección
- 435: Determinación de la presión de diseño
- 449: Caldera seleccionada
- 504: Propiedades termodinámicas del vapor a la salida
- 531: Cálculo de la potencia térmica
- 573: Representación gráfica
- 598: Criterio de velocidad
- 613: Criterio de caída de presión
- 643: Rugosidad y material de tuberías
- 683: Ecuaciones fundamentales de dimensionado
- 737: Propiedades del vapor para el cálculo
- 783: Concepto de longitud equivalente
- 810: Coeficientes de pérdidas en accesorios
- 824: Selección del tipo de codo
- 836: Aplicación a los tramos del proyecto
- 859: Criterio para tramos sin accesorios significativos

**Total**: ~20 apariciones

### Implementación recomendada

1. **Añadir código de formato global** al preámbulo (Solución Global - Paso 1)
2. **Compilar PDF** y verificar resultado
3. **Si es necesario**: Añadir línea en blanco después de cada `\paragraph{}` (Paso 2)
4. **Verificar** que todos los 20 párrafos se renderizan correctamente

### Verificación post-implementación

Checklist visual en el PDF compilado:
- [ ] Los títulos de `\paragraph` NO están en negrita
- [ ] Los títulos de `\paragraph` SÍ están subrayados
- [ ] El contenido empieza en una nueva línea (no continúa en la misma línea del título)
- [ ] El espaciado vertical es coherente y profesional
- [ ] No hay efectos colaterales en otros comandos de sección (`\section`, `\subsection`, etc.)

### Troubleshooting

**Problema**: El subrayado no aparece  
**Solución**: Verificar que `\usepackage{ulem}` y `\normalem` están en el preámbulo

**Problema**: El contenido sigue en la misma línea  
**Solución**: Aumentar el valor de `\titlespacing` (ej: de 1.5em a 2em)

**Problema**: Espaciado vertical excesivo  
**Solución**: Reducir el valor de `\titlespacing` (ej: de 2em a 1em)

---

# REFERENCIAS CRUZADAS

## Relación con `errores_a_corregir.md`

| Item en formatting_fix.md | Item relacionado en errores_a_corregir.md |
|---------------------------|-------------------------------------------|
| F-T7 (Tabla 2.8)          | **Error D2** - Indica ELIMINAR tabla (no corregir formato) |
| F-T1, F-T2, F-T3, etc.    | Considerar si alguna debe eliminarse por contenido antes de formatear |
| F-P1 (\paragraph)         | Aplicar después de correcciones de contenido para evitar doble trabajo |

## Relación con `Instrucciones_adicionales.md`

| Item | Relación |
|------|----------|
| Todas las tablas | Verificar si usan el formato de caption correcto: "Fuente: []. Elaboración grupal." |
| F-E1 (ecuaciones) | No afecta reorganización de figuras |

---

# ORDEN DE EJECUCIÓN RECOMENDADO

Para minimizar trabajo duplicado:

1. **PRIMERO**: Ejecutar eliminaciones de `errores_a_corregir.md` (ej: Tabla 2.8)
2. **SEGUNDO**: Corregir formatos de tablas restantes (F-T1 a F-T6)
3. **TERCERO**: Convertir ecuaciones largas (F-E1)
4. **CUARTO**: Aplicar cambio global de \paragraph (F-P1)
5. **QUINTO**: Compilar y verificar TODO el documento

---

**FIN DEL DOCUMENTO**
