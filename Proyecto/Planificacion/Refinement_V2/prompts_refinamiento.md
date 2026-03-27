# Prompts de Refinamiento para Task-Orchestrator

---

## Prompt R2-4: Eliminación de Checkmarks

```
TAREA DE REFINAMIENTO: Eliminar checkmarks de tablas

TABLAS AFECTADAS:
1. tab:verificacion-criterios-tramo1 (líneas 931-933)
2. tab:presiones-consumidores (líneas 1344-1347)
3. tab:perdidas-acumuladas (líneas 1365-1368)
4. tab:perdidas-condensados (líneas 1599-1604)

TRANSFORMACIÓN:
ANTES:
\begin{tabular}{lccc}
    ...
    Criterio & Límite & Valor & Cumple \\
    Velocidad & < 30 m/s & 19,17 m/s & $\checkmark$ \\
    ...
\end{tabular}

DESPUÉS:
\begin{tabular}{lcc}
    ...
    Criterio & Límite & Valor \\
    Velocidad & < 30 m/s & 19,17 m/s \\
    ...
\end{tabular}

Todos los criterios de diseño se cumplen satisfactoriamente.

REGLAS:
- Eliminar la columna que contiene $\checkmark$
- Mantener el texto de la tabla sin modificaciones
- Añadir frase de cumplimiento después de \end{table}
```

---

## Prompt R2-3: Reducir Texto Tabla 2.36

```
TAREA DE REFINAMIENTO: Reducir tamaño de texto en Tabla 2.36

TABLA AFECTADA:
- Label: tab:aislamiento_vapor_aereo
- Líneas: 1760-1785
- Tamaño actual: \small

CAMBIO REQUERIDO:
ANTES:
\begin{table}[htbp]
    \centering
    \small
    ...

DESPUÉS:
\begin{table}[htbp]
    \centering
    \footnotesize
    ...

REGLAS:
- Solo cambiar \small a \footnotesize
- No modificar el contenido de la tabla
- Si aún excede margen, probar \scriptsize
```

---

## Prompt R2-7: Citas Bibliográficas Faltantes

```
TAREA DE REFINAMIENTO: Añadir comandos \cite{} a menciones de normativa

UBICACIONES A CORREGIR:

1. DIN 2448 - Líneas: 631, 637, 804, 1124, 1187, 1236, 1321-1325, 2193, 2203
   ANTES: "según la norma DIN 2448"
   DESPUÉS: "según la norma DIN 2448 \cite{DIN2448}"

2. Spirax Sarco - Líneas: 577, 690, 832, 1721, 2203
   ANTES: "Guía Spirax Sarco"
   DESPUÉS: "Guía Spirax Sarco \cite{SpiraxSarco2020}"

3. IDAE - Líneas: 1721, 2179, 2197, 2203
   ANTES: "guías de eficiencia energética del IDAE"
   DESPUÉS: "guías de eficiencia energética del IDAE \cite{IDAE2014}"

4. ISO 12241 - Línea: 1721
   ANTES: "ISO 12241"
   DESPUÉS: "ISO 12241 \cite{ISO12241}"

5. ASME/API Schedule - Líneas: 632, 2193, 2203
   ANTES: "Schedule API"
   DESPUÉS: "Schedule API \cite{ASME2019}"

GENERAR ENTRADAS .BIB SI NO EXISTEN:

@techreport{DIN2448,
    title = {{DIN 2448: Seamless steel tubes - Dimensions, masses per unit length}},
    institution = {Deutsches Institut für Normung},
    year = {2020},
    type = {Standard}
}

@book{SpiraxSarco2020,
    author = {{Spirax Sarco}},
    title = {{Steam Engineering Principles and Heat Transfer}},
    publisher = {Spirax Sarco},
    year = {2020}
}

@techreport{IDAE2014,
    author = {{IDAE}},
    title = {{Guía Técnica: Diseño y cálculo del aislamiento térmico}},
    institution = {Instituto para la Diversificación y Ahorro de la Energía},
    year = {2014},
    address = {Madrid}
}

@standard{ISO12241,
    title = {{ISO 12241: Thermal insulation - Calculation rules}},
    organization = {International Organization for Standardization},
    year = {2022}
}

@standard{ASME2019,
    title = {{ASME B36.10M: Welded and Seamless Wrought Steel Pipe}},
    organization = {American Society of Mechanical Engineers},
    year = {2019}
}

VERIFICAR:
- Que las claves existen en el archivo .bib
- Si no existen, AÑADIR las entradas anteriores al .bib
- Compilar y verificar que no hay warnings de referencias indefinidas

REGLAS:
- Mantener el texto original, SOLO añadir \cite{}
- No modificar otras partes del texto
- Verificar que la ubicación de \cite{} es gramaticalmente correcta
```

---

## Prompt R2-8: Cálculo de Caudales

```
TAREA DE REFINAMIENTO: Añadir explicación de distribución de caudales

UBICACIÓN: Después de línea 575, antes del párrafo "Criterio de velocidad"

CONTENIDO A GENERAR:

\paragraph{Distribución de caudales en la red ramificada}

La red de distribución de vapor presenta una topología ramificada donde el caudal
total generado en la caldera se divide progresivamente en cada nodo de bifurcación.
La Tabla \ref{tab:distribucion-caudales} presenta la distribución de caudales en
cada nodo de la red.

\begin{table}[H]
    \centering
    \caption{Distribución de caudales en los nodos de bifurcación de la red de vapor.}
    \label{tab:distribucion-caudales}
    \begin{tabular}{lccc}
        \toprule
        \textbf{Nodo} & \textbf{Caudal entrada [kg/h]} & \textbf{Derivaciones} & \textbf{Caudales salida [kg/h]} \\
        \midrule
        Caldera & --- & 1 & 5400 (total) \\
        P & 5400 & 2 & 679 (C1) + 3737 (P-S) \\
        S & 3737 & 2 & 1359 (C2) + 2378 (S-T) \\
        T & 2378 & 2 & 340 (C3) + 2038 (C4) \\
        \bottomrule
    \end{tabular}
\end{table}

El caudal de cada tramo corresponde a la suma de los consumidores alimentados
aguas abajo de dicho tramo:

\begin{itemize}[noitemsep]
    \item Tramo Caldera-P (TR1): $\dot{m} = \sum C_i = 5400$ kg/h (caudal total)
    \item Tramo P-C1 (TR2): $\dot{m} = C_1 = 679$ kg/h
    \item Tramo P-S (TR3): $\dot{m} = C_2 + C_3 + C_4 = 1359 + 340 + 2038 = 3737$ kg/h
    \item Tramo S-C2 (TR4): $\dot{m} = C_2 = 1359$ kg/h
    \item Tramo S-T (TR5): $\dot{m} = C_3 + C_4 = 340 + 2038 = 2378$ kg/h
    \item Tramo T-C3 (TR6): $\dot{m} = C_3 = 340$ kg/h
    \item Tramo T-C4 (TR7): $\dot{m} = C_4 = 2038$ kg/h
\end{itemize}

REGLAS:
- Usar formato booktabs para la tabla
- NO usar columna de unidades separada (integrar en encabezado)
- NO usar checkmarks
- Verificar que los valores coinciden con los usados en los tramos posteriores
- Usar [noitemsep] en el itemize para no exceder espacio
- Compilar y verificar que los labels no colisionan
```

---

## Prompt R2-5: Refactorización de Columnas de Unidades

```
TAREA DE REFINAMIENTO: Eliminar columna "Unidad" e integrar en encabezados

UBICACIONES: ~20 tablas en líneas: 203, 223, 273, 441, 474, 496, 741, 771,
814, 903, 1070, 1101, 1122, 1139, 1164, 1185, 1202, 1229, 1256, 1283

TRANSFORMACIÓN:

ANTES:
\begin{tabular}{lcc}
    \textbf{Parámetro} & \textbf{Valor} & \textbf{Unidad} \\
    \midrule
    Caudal másico & 1200 & kg/h \\
    Presión inicial & 8,5 & bar \\
    Temperatura & 170 & °C \\
\end{tabular}

DESPUÉS (opción 1 - unidades integradas):
\begin{tabular}{lc}
    \textbf{Parámetro} & \textbf{Valor} \\
    \midrule
    Caudal másico & 1200 kg/h \\
    Presión inicial & 8,5 bar \\
    Temperatura & 170 °C \\
\end{tabular}

DESPUÉS (opción 2 - unidades en encabezado):
\begin{tabular}{lccc}
    \textbf{Tramo} & \textbf{Caudal [kg/h]} & \textbf{DN} & \textbf{$\Delta P$ [bar]} \\
    \midrule
    TR1 & 5400 & 150 & 0,010 \\
\end{tabular}

DECISIÓN:
- Para tablas con parámetros diversos (parámetro/valor): Usar OPCIÓN 1
- Para tablas numéricas con columnas homogéneas: Usar OPCIÓN 2
- Ajustar el número de columnas del entorno tabular después de eliminar

REGLAS:
- NO eliminar las unidades, solo moverlas de posición
- Mantener el orden y contenido de las filas
- Verificar que la tabla cabe en el margen después del cambio
```

---

## Prompt R2-2: Tablas Condensados en Horizontal

```
TAREA DE REFINAMIENTO: Integrar Tablas 2.32 y 2.33 en hoja landscape

TABLAS AFECTADAS:
1. tab:dimensionado-condensados (líneas 1532-1554) - Tabla ~30/2.32
2. tab:verificacion-condensados (líneas 1564-1585) - Tabla ~31/2.33

RESULTADO ESPERADO:
1. Crear página en landscape con AMBAS tablas
2. Después de \end{landscape}, seguir con conclusiones en formato vertical

CÓDIGO SUGERIDO:
\clearpage
\begin{landscape}
% Tabla 2.32
\begin{table}[H]
    \centering
    \small
    \caption{Dimensionado hidráulico de los tramos de condensados}
    \label{tab:dimensionado-condensados}
    % ... contenido actual de la tabla ...
\end{table}

\vspace{1em}

% Tabla 2.33
\begin{table}[H]
    \centering
    \small
    \caption{Accesorios por tramo y cálculo de longitudes equivalentes}
    \label{tab:verificacion-condensados}
    % ... contenido actual de la tabla ...
\end{table}
\end{landscape}
\clearpage

% Continúa con conclusiones en vertical

REGLAS:
- Añadir \clearpage antes y después del landscape
- Mantener labels y captions originales
- Mantener contenido de las tablas sin cambios
- Usar \small para el texto de ambas tablas
- Compilar y verificar paginación
```

---

## Prompt R2-1: Consolidación Tablas Vapor

```
TAREA DE REFINAMIENTO: Consolidar tablas de tramos 3-7 en tabla resumen landscape

TABLAS A CONSOLIDAR Y ELIMINAR:
- TR3: tab:datos-tramo3, tab:tuberia-tramo3, tab:hidraulica-tramo3 (1095-1147)
- TR4: tab:datos-tramo4, tab:tuberia-tramo4, tab:hidraulica-tramo4 (1158-1210)
- TR5: tab:tramo5 (1223-1244)
- TR6: tab:tramo6 (1250-1271)
- TR7: tab:tramo7 (1277-1298)

RESULTADO ESPERADO:
1. Una tabla consolidada en landscape con columnas:
   Tramo | Origen-Destino | Caudal [kg/h] | DN | D_int [mm] | L_calc [m] | v [m/s] | ΔP [bar]

2. Eliminar las tablas individuales
3. Mantener solo texto introductorio conciso para cada sección
4. Referenciar a la tabla resumen

CÓDIGO SUGERIDO:
\clearpage
\begin{landscape}
\begin{table}[H]
    \centering
    \footnotesize
    \setlength{\tabcolsep}{3pt}
    \caption{Resumen del dimensionado hidráulico de los tramos 3-7 de la red de vapor}
    \label{tab:resumen-tramos-vapor}
    \resizebox{\linewidth}{!}{
        \begin{tabular}{lcccccccc}
            \toprule
            \textbf{Tramo} & \textbf{Origen-Destino} & \textbf{Caudal [kg/h]} &
            \textbf{DN} & \textbf{$D_{int}$ [mm]} & \textbf{$L_{calc}$ [m]} &
            \textbf{$v$ [m/s]} & \textbf{$\Delta P$ [bar]} \\
            \midrule
            TR3 & P - S & 3737 & DN125 & 128,2 & 85,3 & 18,45 & 0,045 \\
            TR4 & S - C2 & 1359 & DN100 & 107,1 & 23,8 & 16,82 & 0,012 \\
            TR5 & S - T & 2378 & DN100 & 107,1 & 15,2 & 22,54 & 0,018 \\
            TR6 & T - C3 & 340 & DN50 & 54,5 & 8,4 & 17,23 & 0,021 \\
            TR7 & T - C4 & 2038 & DN80 & 82,3 & 12,6 & 21,67 & 0,034 \\
            \bottomrule
        \end{tabular}
    }
\end{table}
\end{landscape}
\clearpage

NOTA: Los valores anteriores son EJEMPLOS. Deben extraerse de las tablas originales.

INSTRUCCIONES:
1. Extraer todos los datos de las tablas existentes
2. Consolidar en una sola tabla
3. Eliminar las tablas individuales
4. Actualizar las secciones 2.2.4, 2.2.5, 2.2.6 para:
   - Mantener texto introductorio
   - Referenciar a la tabla resumen
   - Eliminar contenido de cálculos detallados
5. NO eliminar: tab:resumen-red-vapor (ya existente)

REGLAS:
- Usar footnotesize y resizebox para que quepa en landscape
- NO usar checkmarks
- NO usar columna de unidades separada
- Mantener consistencia con datos de TR1 y TR2 que se mantienen detallados
```

---

## Prompt R2-6: Revisión de Conclusiones

```
TAREA DE REFINAMIENTO: Eliminar valores numéricos innecesarios de conclusiones

UBICACIÓN: Sección 3 (Conclusiones y limitaciones), líneas ~2180+

INSTRUCCIÓN:
1. Analizar la sección de conclusiones actual
2. Identificar TODOS los valores numéricos presentes en la prosa
3. Clasificar cada valor en:
   - SIGNIFICATIVO: valor que define el diseño final o conclusiones clave
   - REDUNDANTE: valor que ya aparece en tablas resumen anteriores
4. Presentar propuesta al usuario con:
   - Lista de valores a ELIMINAR (con justificación)
   - Lista de valores a MANTENER (con justificación)
   - Texto propuesto después de eliminar valores redundantes
5. ESPERAR CONFIRMACIÓN del usuario antes de aplicar cambios

EJEMPLO DE CAMBIO PROPUESTO:
ANTES: "El tramo 1 tiene una longitud de 15 m, un diámetro DN 150,
una velocidad de 19,17 m/s y una pérdida de carga de 0,01 bar."

DESPUÉS: "La red de vapor ha sido dimensionada satisfactoriamente,
cumpliendo todos los criterios de diseño establecidos. Los resultados
detallados se presentan en la Tabla 2.XX."

REGLA FUNDAMENTAL:
- Una conclusión resume RESULTADOS y LIMITACIONES
- NO debe ser una repetición de datos que ya están en tablas
- Los valores significativos que SÍ deben mantenerse son:
  - Presión de diseño de la red
  - Velocidad objetivo (20 m/s)
  - Pérdida de carga total admisible
  - Espesor de aislamiento dominante
  - Resultados del balance energético (si aplica)
```
