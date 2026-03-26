# INSTRUCCIONES ADICIONALES - REORGANIZACIÓN DE FIGURAS
**Documento**: `Practica_Vapor_LaTeX\plantilla.tex`  
**Tipo**: Reestructuración de contenido - Figuras de tramos  
**Última actualización**: Marzo 2026

---

## OBJETIVO Y ALCANCE

### Objetivo principal
Reorganizar las figuras de cálculos y dibujos de tramos de la red de vapor y condensados para:
1. **Reducir densidad visual** en las secciones principales de dimensionado (2.2 y 2.3)
2. **Mantener un ejemplo completo** en el cuerpo principal (Tramo 1)
3. **Consolidar documentación técnica** en anejos específicos para consulta

### Alcance
- **Afecta a**: 14 figuras de dibujos + 14 figuras de cálculos = **28 figuras totales**
- **Carpetas involucradas**:
  - `Practica_Vapor_LaTeX\Figuras\dibujos_tramos\` (14 archivos PDF)
  - `Practica_Vapor_LaTeX\Figuras\calculos_tramos\` (14 archivos PDF)
- **Secciones del documento afectadas**:
  - Sección 2.2: Dimensionado Hidráulico de la Red de Vapor
  - Sección 2.3: Dimensionado Hidráulico de la Red de Condensados
  - Anejos (a crear): Anejo 2 y Anejo 3

---

## LEYENDA
- **Prioridad**: HIGH (cambio estructural significativo)
- **Esfuerzo**: MEDIUM-HIGH (requiere mover ~28 figuras y actualizar referencias)

---

## QUICK REFERENCE CHECKLIST
- [ ] **PASO 1**: Identificar figuras actuales en secciones 2.2 y 2.3
- [ ] **PASO 2**: Crear estructura del Anejo 2 (Dibujos de tramos)
- [ ] **PASO 3**: Crear estructura del Anejo 3 (Cálculos con herramienta)
- [ ] **PASO 4**: Mover figuras de dibujos (mantener TR1 en cuerpo, resto a Anejo 2)
- [ ] **PASO 5**: Mover figuras de cálculos (mantener TR1 en cuerpo, resto a Anejo 3)
- [ ] **PASO 6**: Actualizar todos los captions con formato requerido
- [ ] **PASO 7**: Actualizar referencias cruzadas (\ref{})
- [ ] **PASO 8**: Verificar índice de figuras

---

# DETALLE DE TRAMOS Y ARCHIVOS

## Inventario de archivos existentes

### Red de VAPOR - Dibujos de tramos
```
Practica_Vapor_LaTeX\Figuras\dibujos_tramos\
├── Vapor_TR1_Caldera-P.pdf       ← MANTENER en memoria (sección 2.2)
├── Vapor_TR2_P-C1.pdf             → MOVER a Anejo 2
├── Vapor_TR3_P-S.pdf              → MOVER a Anejo 2
├── Vapor_TR4_S-C2.pdf             → MOVER a Anejo 2
├── Vapor_TR5_S-T.pdf              → MOVER a Anejo 2
├── Vapor_TR6_T-C3.pdf             → MOVER a Anejo 2
└── Vapor_TR7_T-C4.pdf             → MOVER a Anejo 2
```

### Red de VAPOR - Cálculos con herramienta
```
Practica_Vapor_LaTeX\Figuras\calculos_tramos\
├── Vapor_TR1_Caldera-P.pdf       ← MANTENER en memoria (sección 2.2)
├── Vapor_TR2_P-C1.pdf             → MOVER a Anejo 3
├── Vapor_TR3_P-S.pdf              → MOVER a Anejo 3
├── Vapor_TR4_S-C2.pdf             → MOVER a Anejo 3
├── Vapor_TR5_S-T.pdf              → MOVER a Anejo 3
├── Vapor_TR6_T-C3.pdf             → MOVER a Anejo 3
└── Vapor_TR7_T-C4.pdf             → MOVER a Anejo 3
```

### Red de CONDENSADOS - Dibujos de tramos
```
Practica_Vapor_LaTeX\Figuras\dibujos_tramos\
├── Condensados_TR1_Caldera-P.pdf ← MANTENER en memoria (sección 2.3)
├── Condensados_TR2_P-C1.pdf       → MOVER a Anejo 2
├── Condensados_TR3_P-S.pdf        → MOVER a Anejo 2
├── Condensados_TR4_S-C2.pdf       → MOVER a Anejo 2
├── Condensados_TR5_S-T.pdf        → MOVER a Anejo 2
├── Condensados_TR6_T-C3.pdf       → MOVER a Anejo 2
└── Condensados_TR7_T-C4.pdf       → MOVER a Anejo 2
```

### Red de CONDENSADOS - Cálculos con herramienta
```
Practica_Vapor_LaTeX\Figuras\calculos_tramos\
├── Condensados_TR1_Caldera-P.pdf ← MANTENER en memoria (sección 2.3)
├── Condensados_TR2_P-C1.pdf       → MOVER a Anejo 3
├── Condensados_TR3_P-S.pdf        → MOVER a Anejo 3
├── Condensados_TR4_S-C2.pdf       → MOVER a Anejo 3
├── Condensados_TR5_S-T.pdf        → MOVER a Anejo 3
├── Condensados_TR6_T-C3.pdf       → MOVER a Anejo 3
└── Condensados_TR7_T-C4.pdf       → MOVER a Anejo 3
```

### Resumen de movimientos
| Tipo | Mantener en memoria | Mover a Anejos | Total |
|------|---------------------|----------------|-------|
| Dibujos Vapor | 1 (TR1) | 6 (TR2-TR7) | 7 |
| Dibujos Condensados | 1 (TR1) | 6 (TR2-TR7) | 7 |
| Cálculos Vapor | 1 (TR1) | 6 (TR2-TR7) | 7 |
| Cálculos Condensados | 1 (TR1) | 6 (TR2-TR7) | 7 |
| **TOTAL** | **4 figuras** | **24 figuras** | **28** |

---

# PASO 1: IDENTIFICAR FIGURAS ACTUALES

## Búsqueda en el documento
```bash
# Buscar todas las inclusiones de figuras de tramos
grep -n "includegraphics.*dibujos_tramos\|includegraphics.*calculos_tramos" Practica_Vapor_LaTeX/plantilla.tex

# Buscar labels de estas figuras
grep -n "label{fig:.*tramo\|label{fig:.*TR[0-9]" Practica_Vapor_LaTeX/plantilla.tex
```

## Registro de ubicaciones actuales
Crear una tabla de referencia:

| Figura | Label actual | Línea aprox. | Destino |
|--------|-------------|--------------|---------|
| Vapor_TR1 dibujo | fig:dibujo-vapor-tr1 | ~1171 | MANTENER sección 2.2.3 |
| Vapor_TR1 cálculo | fig:calculo-vapor-tr1 | ~1162 | MANTENER sección 2.2.3 |
| Vapor_TR2 dibujo | fig:... | buscar | → Anejo 2 |
| ... | ... | ... | ... |

---

# PASO 2: CREAR ANEJO 2 - DIBUJOS DE TRAMOS

## Ubicación en el documento
Después de las **Conclusiones** (sección 3) y **Bibliografía** (sección 4), añadir:

```latex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% ANEJO 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\clearpage
\section*{Anejo 2: Diagramas esquemáticos de tramos}
\addcontentsline{toc}{section}{Anejo 2: Diagramas esquemáticos de tramos}

\subsection*{A2.1. Introducción}
El presente anejo recoge los esquemas detallados de todos los tramos de las redes de distribución de vapor y retorno de condensados. Los diagramas incluyen la disposición geométrica, accesorios, y puntos de conexión de cada tramo.

Los esquemas se organizan en dos subsecciones:
\begin{itemize}
    \item \textbf{Red de Vapor} (Tramos TR1 a TR7)
    \item \textbf{Red de Condensados} (Tramos TR1 a TR7)
\end{itemize}

\textbf{Nota:} Los esquemas del Tramo 1 (Caldera-P) para ambas redes se incluyen también en las secciones principales 2.2.3 y 2.3.4 como referencia metodológica.
```

## Subsección A2.2: Red de Vapor

```latex
\clearpage
\subsection*{A2.2. Red de Vapor - Diagramas de tramos}
\addcontentsline{toc}{subsection}{A2.2. Red de Vapor}

% --- TRAMO 1 (incluido también en sección 2.2.3) ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR1_Caldera-P.pdf}
    \caption{Diagrama del Tramo 1 (Caldera-P) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr1}
\end{figure}

% --- TRAMO 2 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR2_P-C1.pdf}
    \caption{Diagrama del Tramo 2 (P-C1) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr2}
\end{figure}

% --- TRAMO 3 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR3_P-S.pdf}
    \caption{Diagrama del Tramo 3 (P-S) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr3}
\end{figure}

% --- TRAMO 4 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR4_S-C2.pdf}
    \caption{Diagrama del Tramo 4 (S-C2) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr4}
\end{figure}

% --- TRAMO 5 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR5_S-T.pdf}
    \caption{Diagrama del Tramo 5 (S-T) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr5}
\end{figure}

% --- TRAMO 6 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR6_T-C3.pdf}
    \caption{Diagrama del Tramo 6 (T-C3) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr6}
\end{figure}

% --- TRAMO 7 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Vapor_TR7_T-C4.pdf}
    \caption{Diagrama del Tramo 7 (T-C4) - Red de Vapor. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-vapor-tr7}
\end{figure}
```

## Subsección A2.3: Red de Condensados

```latex
\clearpage
\subsection*{A2.3. Red de Condensados - Diagramas de tramos}
\addcontentsline{toc}{subsection}{A2.3. Red de Condensados}

% --- TRAMO 1 (incluido también en sección 2.3.4) ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR1_Caldera-P.pdf}
    \caption{Diagrama del Tramo 1 (Caldera-P) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr1}
\end{figure}

% --- TRAMO 2 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR2_P-C1.pdf}
    \caption{Diagrama del Tramo 2 (P-C1) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr2}
\end{figure}

% --- TRAMO 3 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR3_P-S.pdf}
    \caption{Diagrama del Tramo 3 (P-S) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr3}
\end{figure}

% --- TRAMO 4 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR4_S-C2.pdf}
    \caption{Diagrama del Tramo 4 (S-C2) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr4}
\end{figure}

% --- TRAMO 5 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR5_S-T.pdf}
    \caption{Diagrama del Tramo 5 (S-T) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr5}
\end{figure}

% --- TRAMO 6 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR6_T-C3.pdf}
    \caption{Diagrama del Tramo 6 (T-C3) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr6}
\end{figure}

% --- TRAMO 7 ---
\begin{figure}[H]
    \centering
    \includegraphics[width=0.9\textwidth]{Figuras/dibujos_tramos/Condensados_TR7_T-C4.pdf}
    \caption{Diagrama del Tramo 7 (T-C4) - Red de Condensados. Fuente: Herramienta de diseño. Elaboración grupal.}
    \label{fig:anejo2-cond-tr7}
\end{figure}
```

---

# PASO 3: CREAR ANEJO 3 - CÁLCULOS CON HERRAMIENTA

## Ubicación en el documento
Inmediatamente después del Anejo 2:

```latex
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%% ANEJO 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\clearpage
\section*{Anejo 3: Hojas de cálculo de dimensionado hidráulico}
\addcontentsline{toc}{section}{Anejo 3: Hojas de cálculo de dimensionado hidráulico}

\subsection*{A3.1. Introducción}
El presente anejo contiene las hojas de cálculo generadas mediante la herramienta de dimensionado hidráulico empleada en el proyecto. Cada hoja incluye:
\begin{itemize}
    \item Datos de entrada del tramo (caudal, presión, temperatura, longitud, accesorios)
    \item Cálculo iterativo del diámetro óptimo
    \item Verificación de criterios de diseño (velocidad y caída de presión)
    \item Propiedades termodinámicas del fluido
    \item Resultados finales (diámetro nominal, velocidad real, pérdida de carga)
\end{itemize}

Las hojas se organizan en dos subsecciones:
\begin{itemize}
    \item \textbf{Red de Vapor} (Tramos TR1 a TR7)
    \item \textbf{Red de Condensados} (Tramos TR1 a TR7)
\end{itemize}

\textbf{Nota:} Las hojas de cálculo del Tramo 1 (Caldera-P) para ambas redes se incluyen también en las secciones principales 2.2.3 y 2.3.4 como ejemplo metodológico detallado.
```

## Subsección A3.2: Red de Vapor

```latex
\clearpage
\subsection*{A3.2. Red de Vapor - Hojas de cálculo}
\addcontentsline{toc}{subsection}{A3.2. Red de Vapor}

% --- TRAMO 1 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR1_Caldera-P.pdf}
    \caption{Hoja de cálculo del Tramo 1 (Caldera-P) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr1}
\end{figure}

% --- TRAMO 2 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR2_P-C1.pdf}
    \caption{Hoja de cálculo del Tramo 2 (P-C1) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr2}
\end{figure}

% --- TRAMO 3 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR3_P-S.pdf}
    \caption{Hoja de cálculo del Tramo 3 (P-S) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr3}
\end{figure}

% --- TRAMO 4 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR4_S-C2.pdf}
    \caption{Hoja de cálculo del Tramo 4 (S-C2) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr4}
\end{figure}

% --- TRAMO 5 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR5_S-T.pdf}
    \caption{Hoja de cálculo del Tramo 5 (S-T) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr5}
\end{figure}

% --- TRAMO 6 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR6_T-C3.pdf}
    \caption{Hoja de cálculo del Tramo 6 (T-C3) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr6}
\end{figure}

% --- TRAMO 7 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Vapor_TR7_T-C4.pdf}
    \caption{Hoja de cálculo del Tramo 7 (T-C4) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-vapor-tr7}
\end{figure}
```

## Subsección A3.3: Red de Condensados

```latex
\clearpage
\subsection*{A3.3. Red de Condensados - Hojas de cálculo}
\addcontentsline{toc}{subsection}{A3.3. Red de Condensados}

% --- TRAMO 1 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR1_Caldera-P.pdf}
    \caption{Hoja de cálculo del Tramo 1 (Caldera-P) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr1}
\end{figure}

% --- TRAMO 2 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR2_P-C1.pdf}
    \caption{Hoja de cálculo del Tramo 2 (P-C1) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr2}
\end{figure}

% --- TRAMO 3 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR3_P-S.pdf}
    \caption{Hoja de cálculo del Tramo 3 (P-S) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr3}
\end{figure}

% --- TRAMO 4 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR4_S-C2.pdf}
    \caption{Hoja de cálculo del Tramo 4 (S-C2) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr4}
\end{figure}

% --- TRAMO 5 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR5_S-T.pdf}
    \caption{Hoja de cálculo del Tramo 5 (S-T) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr5}
\end{figure}

% --- TRAMO 6 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR6_T-C3.pdf}
    \caption{Hoja de cálculo del Tramo 6 (T-C3) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr6}
\end{figure}

% --- TRAMO 7 ---
\begin{figure}[H]
    \centering
    \includegraphics[angle=90,origin=c,width=\textwidth]{Figuras/calculos_tramos/Condensados_TR7_T-C4.pdf}
    \caption{Hoja de cálculo del Tramo 7 (T-C4) - Red de Condensados. Fuente: Herramienta de cálculo. Elaboración grupal.}
    \label{fig:anejo3-cond-tr7}
\end{figure}
```

**Nota**: Las hojas de cálculo suelen estar en formato horizontal, por eso se usa `angle=90,origin=c` para rotarlas.

---

# PASO 4 y 5: MANTENER TR1 EN CUERPO PRINCIPAL

## Ubicación actual de TR1
Las figuras del Tramo 1 **deben permanecer** en:
- **Sección 2.2.3**: Tramo 1 de la red de vapor (línea ~1162 dibujo, ~1171 cálculo)
- **Sección 2.3.4**: Tramo 1 de la red de condensados

## Acción para Tramo 1
**NO ELIMINAR** estas figuras. Solo:
1. **Verificar formato de caption**:

```latex
% ANTES (si no tiene el formato correcto):
\caption{Hoja de cálculo del Tramo 1 (Caldera-P)}

% DESPUÉS (formato requerido):
\caption{Hoja de cálculo del Tramo 1 (Caldera-P) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
```

2. **Añadir nota** indicando que también está en Anejo:
```latex
\caption{Hoja de cálculo del Tramo 1 (Caldera-P) - Red de Vapor. Fuente: Herramienta de cálculo. Elaboración grupal.}
\label{fig:calculo-vapor-tr1}

\textit{Nota: Esta hoja de cálculo se incluye también en el Anejo 3 (\figref{fig:anejo3-vapor-tr1}) junto con el resto de tramos.}
```

## Acción para Tramos TR2 a TR7

### EN EL CUERPO PRINCIPAL (secciones 2.2.X y 2.3.X):
**ELIMINAR** las figuras completas de TR2 a TR7 y **REEMPLAZAR** con referencia:

```latex
% ANTES (figura completa de TR2):
\begin{figure}[H]
    \centering
    \includegraphics[...]{Figuras/dibujos_tramos/Vapor_TR2_P-C1.pdf}
    \caption{Diagrama del Tramo 2 (P-C1)}
    \label{fig:vapor-tr2}
\end{figure}

% DESPUÉS (solo referencia):
Los esquemas detallados y hojas de cálculo de los Tramos 2 a 7 se encuentran en los Anejos 2 y 3 respectivamente. Para el Tramo 2 (P-C1), véase:
\begin{itemize}
    \item Diagrama esquemático: Anejo 2, Figura \ref{fig:anejo2-vapor-tr2}
    \item Hoja de cálculo: Anejo 3, Figura \ref{fig:anejo3-vapor-tr2}
\end{itemize}

% Continuar con tabla resumen de resultados del tramo...
```

**Importante**: Mantener las **tablas resumen de resultados** en el cuerpo principal (Tablas 2.XX con diámetros, velocidades, etc.). Solo mover las **figuras grandes** (diagramas y hojas de cálculo).

---

# PASO 6: FORMATO DE CAPTIONS - ESPECIFICACIÓN

## Formato requerido para TODOS los captions

```
Fuente: [Título de la fuente]. Elaboración grupal.
```

## Ejemplos específicos por tipo de figura

### Diagramas de tramos (dibujos_tramos/)
```latex
\caption{Diagrama del Tramo X (Nombre) - Red de [Vapor/Condensados]. Fuente: Herramienta de diseño. Elaboración grupal.}
```

### Hojas de cálculo (calculos_tramos/)
```latex
\caption{Hoja de cálculo del Tramo X (Nombre) - Red de [Vapor/Condensados]. Fuente: Herramienta de cálculo. Elaboración grupal.}
```

### Otras figuras (si aplica)
```latex
% Figuras de catálogos
\caption{[Descripción]. Fuente: Catálogo [Fabricante]. Elaboración grupal.}

% Figuras de normativa
\caption{[Descripción]. Fuente: [Norma/Manual]. Elaboración grupal.}

% Figuras generadas por el equipo
\caption{[Descripción]. Fuente: Elaboración propia.}
% O simplemente:
\caption{[Descripción]. Elaboración grupal.}
```

## Script de verificación
```bash
# Verificar que todas las figuras de tramos tengan el formato correcto
grep -A 1 "includegraphics.*_tramos/" Practica_Vapor_LaTeX/plantilla.tex | \
grep "caption" | \
grep -v "Elaboración grupal"
# Si retorna resultados, esos captions necesitan corrección
```

---

# PASO 7: ACTUALIZAR REFERENCIAS CRUZADAS

## Identificar referencias existentes
```bash
# Buscar todas las referencias a figuras de tramos
grep -n "\\ref{fig:.*vapor.*tr\|\\ref{fig:.*cond.*tr\|\\figref{.*tr" Practica_Vapor_LaTeX/plantilla.tex
```

## Estrategia de actualización

### Referencias en el cuerpo principal a TR1
**NO CAMBIAR** - TR1 permanece en el cuerpo:
```latex
Como se observa en la \figref{fig:calculo-vapor-tr1}...
```

### Referencias en el cuerpo principal a TR2-TR7
**ACTUALIZAR** para apuntar a los Anejos:
```latex
% ANTES:
Véase diagrama en \figref{fig:vapor-tr2}...

% DESPUÉS:
Véase diagrama en Anejo 2 (\figref{fig:anejo2-vapor-tr2})...
```

### Referencias dentro de los Anejos
**NUEVAS** - Usar los nuevos labels:
```latex
% En Anejo 2:
\label{fig:anejo2-vapor-tr2}

% En Anejo 3:
\label{fig:anejo3-vapor-tr2}

% Referencias cruzadas dentro del anejo:
Como se observa en las Figuras \ref{fig:anejo2-vapor-tr2} y \ref{fig:anejo3-vapor-tr2}...
```

## Tabla de conversión de labels

| Label antiguo (a eliminar) | Nuevo label en Anejo 2 | Nuevo label en Anejo 3 |
|----------------------------|------------------------|------------------------|
| fig:dibujo-vapor-tr1 | fig:anejo2-vapor-tr1 | fig:anejo3-vapor-tr1 |
| fig:dibujo-vapor-tr2 | fig:anejo2-vapor-tr2 | fig:anejo3-vapor-tr2 |
| ... | ... | ... |
| fig:calculo-cond-tr7 | — | fig:anejo3-cond-tr7 |

---

# PASO 8: VERIFICACIÓN FINAL

## Checklist de verificación post-implementación

### Compilación
- [ ] El documento compila sin errores
- [ ] No hay warnings de referencias indefinidas (`undefined reference`)
- [ ] No hay warnings de labels duplicados

### Índice de figuras
- [ ] El índice de figuras se genera correctamente
- [ ] Las figuras de los Anejos 2 y 3 aparecen en el índice
- [ ] La numeración es secuencial y coherente

### Contenido visual
- [ ] Las secciones 2.2 y 2.3 solo muestran figuras de TR1
- [ ] El Anejo 2 contiene 14 figuras (7 vapor + 7 condensados)
- [ ] El Anejo 3 contiene 14 figuras (7 vapor + 7 condensados)
- [ ] Total de figuras de tramos: 4 (cuerpo) + 28 (anejos) = 32 (considerando TR1 duplicado)

### Formato de captions
- [ ] Todos los captions de tramos incluyen "Fuente: ... Elaboración grupal."
- [ ] Todos los captions de Anejo 2 dicen "Herramienta de diseño"
- [ ] Todos los captions de Anejo 3 dicen "Herramienta de cálculo"

### Referencias cruzadas
- [ ] Todas las referencias a figuras de tramos (TR2-TR7) en el cuerpo apuntan a Anejos
- [ ] No hay referencias huérfanas (apuntando a labels eliminados)
- [ ] Las referencias desde Anejos funcionan correctamente

### Índice general (TOC)
- [ ] Aparece "Anejo 2: Diagramas esquemáticos de tramos"
- [ ] Aparece "Anejo 3: Hojas de cálculo de dimensionado hidráulico"
- [ ] Las subsecciones A2.2, A2.3, A3.2, A3.3 aparecen si se configuró `\addcontentsline{toc}{subsection}`

## Comandos de verificación

```bash
# 1. Verificar que no quedan figuras de TR2-TR7 en secciones 2.2 y 2.3
grep -n "includegraphics.*TR[2-7]" Practica_Vapor_LaTeX/plantilla.tex | \
grep -v "Anejo"
# Debe retornar: vacío (sin resultados fuera de Anejos)

# 2. Verificar formato de captions en Anejos
grep -A 1 "Figuras.*_tramos" Practica_Vapor_LaTeX/plantilla.tex | \
grep "caption" | \
grep -c "Elaboración grupal"
# Debe retornar: 28 (todos los captions de tramos en anejos)

# 3. Verificar compilación
pdflatex plantilla.tex
# Revisar output para warnings

# 4. Contar figuras en PDF final
# Revisar manualmente el PDF compilado
```

---

# NOTAS ADICIONALES

## Consideraciones sobre orden de implementación

1. **Primero**: Crear los Anejos 2 y 3 completos AL FINAL del documento
2. **Segundo**: Compilar para generar los nuevos labels
3. **Tercero**: Actualizar referencias en el cuerpo principal
4. **Cuarto**: Eliminar figuras de TR2-TR7 del cuerpo principal
5. **Quinto**: Compilar 2 veces para resolver todas las referencias

## Backup recomendado
Antes de comenzar:
```bash
cp Practica_Vapor_LaTeX/plantilla.tex Practica_Vapor_LaTeX/plantilla_backup_$(date +%Y%m%d).tex
```

## Cross-references con otros documentos

| Tarea | Documento relacionado |
|-------|----------------------|
| Formato de captions | Ver `errores_a_corregir.md` errores M2, M3 |
| Ajuste de figuras anchas | Ver `formatting_fix.md` si alguna figura no cabe en página |
| Eliminación de otras figuras | Ninguna relación directa |

---

**FIN DEL DOCUMENTO**
