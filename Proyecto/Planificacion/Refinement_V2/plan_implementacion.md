# Plan de Implementación - Refinement V2

**Fecha**: Marzo 2026
**Proyecto**: Práctica de Vapor - Instalaciones II
**Sistema**: Task-Orchestrator (Ralph Loop)

---

## 1. Objetivo

Integrar las instrucciones del Refinement_V2 (`instrucciones.md`) en el task-orchestrator para corregir y mejorar el documento LaTeX de la memoria técnica.

---

## 2. Resumen de Tareas de Refinamiento

| ID | Sección | Descripción | Prioridad |
|----|---------|-------------|-----------|
| R2-1 | 2.2.4-2.2.6 | Consolidar tablas repetitivas en tabla A4 horizontal | MEDIA |
| R2-2 | 2.3 | Integrar Tablas 2.32/2.33 en formato horizontal | MEDIA |
| R2-3 | 2.4.2 | Reducir texto Tabla 2.36 (`\small` → `\footnotesize`) | BAJA |
| R2-4 | General | Eliminar checkboxes (`\checkmark`) de tablas | BAJA |
| R2-5 | General | Mover unidades a encabezados de columna | MEDIA |
| R2-6 | Conclusiones | Eliminar valores numéricos redundantes | MEDIA |
| R2-7 | General | Añadir `\cite{}` a menciones de normativa | MEDIA |
| R2-8 | 2.2 (inicio) | Clarificar cálculo de caudales por tramo | MEDIA |

---

## 3. Estrategia de Implementación

### 3.1 Arquitectura: Modo 4 de Refinamiento

Se añade un **Modo 4: Refinamiento** al task-orchestrator que permite:
1. Leer instrucciones de `Refinement_V2/instrucciones.md`
2. Parsear las secciones afectadas
3. Invocar a `latex-writer` con directivas específicas
4. Validar con `latex-validator`
5. Solicitar confirmación antes de aplicar

### 3.2 Orden de Ejecución

| Orden | ID | Tarea | Riesgo | Tiempo est. |
|-------|-----|-------|--------|-------------|
| 1 | R2-4 | Eliminar checkmarks | BAJO | 15 min |
| 2 | R2-3 | Reducir texto Tabla 2.36 | BAJO | 10 min |
| 3 | R2-7 | Añadir citas faltantes + .bib | BAJO | 45 min |
| 4 | R2-8 | Clarificar cálculo de caudales | BAJO | 30 min |
| 5 | R2-5 | Refactorizar columnas unidades | MEDIO | 45 min |
| 6 | R2-2 | Reorganizar tablas condensados | MEDIO | 30 min |
| 7 | R2-1 | Consolidar tablas vapor | ALTO | 60 min |
| 8 | R2-6 | Revisar conclusiones | BAJO | 30 min |
| 9 | VF | Verificación final | - | 15 min |

---

## 4. Mapa de Cambios en plantilla.tex

| Tarea | Líneas Afectadas | Tipo de Cambio |
|-------|------------------|----------------|
| R2-8 | ~575 (inserción) | Nueva sección + tabla |
| R2-7 | ~20 ubicaciones | Añadir `\cite{}` |
| R2-5 | ~20 tablas | Refactorizar columnas |
| R2-4.1 | 931-933 | Eliminar `\checkmark` |
| R2-4.2 | 1344-1347 | Eliminar `\checkmark` |
| R2-4.3 | 1365-1368 | Eliminar `\checkmark` |
| R2-4.4 | 1599-1604 | Eliminar `\checkmark` |
| R2-2 | 1532-1607 | Reorganizar → landscape |
| R2-1 | 1095-1298 | Consolidar → eliminación + nueva tabla |
| R2-3 | 1760-1785 | Cambio tamaño texto |

---

## 5. Prompts de Refinamiento para latex-writer

### 5.1 Prompt R2-4: Eliminación de Checkmarks

```
TAREA DE REFINAMIENTO: Eliminar checkmarks de tablas

TABLAS AFECTADAS:
1. tab:verificacion-criterios-tramo1 (líneas 931-933)
2. tab:presiones-consumidores (líneas 1344-1347)
3. tab:perdidas-acumuladas (líneas 1365-1368)
4. tab:perdidas-condensados (líneas 1599-1604)

TRANSFORMACIÓN:
- Eliminar columna que contiene $\checkmark$
- Añadir frase después de la tabla indicando cumplimiento
```

### 5.2 Prompt R2-3: Reducir Texto Tabla 2.36

```
TAREA DE REFINAMIENTO: Reducir tamaño de texto en Tabla 2.36

TABLA: tab:aislamiento_vapor_aereo (líneas 1760-1785)
CAMBIO: \small → \footnotesize
```

### 5.3 Prompt R2-7: Citas Bibliográficas

```
TAREA DE REFINAMIENTO: Añadir comandos \cite{} a menciones de normativa

REFERENCIAS SIN CITAR:
- DIN 2448: líneas 631, 637, 804, 1124, 1187, 1236, 1321-1325, 2193, 2203
- Spirax Sarco: líneas 577, 690, 832, 1721, 2203
- IDAE: líneas 1721, 2179, 2197, 2203
- ISO 12241: línea 1721
- ASME: líneas 632, 2193, 2203

GENERAR ENTRADAS .BIB SI NO EXISTEN:
- DIN2448
- SpiraxSarco2020
- IDAE2014
- ISO12241
- ASME2019
```

### 5.4 Prompt R2-8: Cálculo de Caudales

```
TAREA DE REFINAMIENTO: Añadir explicación de distribución de caudales

UBICACIÓN: Después de línea 575, antes de "Criterio de velocidad"

CONTENIDO:
1. Párrafo sobre topología ramificada
2. Tabla de distribución de caudales por nodos:
   - Caldera → 5400 kg/h total
   - P → 679 (C1) + 3737 (P-S)
   - S → 1359 (C2) + 2378 (S-T)
   - T → 340 (C3) + 2038 (C4)
3. Lista de cálculo por tramo (TR1-TR7)
```

### 5.5 Prompt R2-5: Refactorización de Unidades

```
TAREA DE REFINAMIENTO: Eliminar columna "Unidad" e integrar en encabezados

TRANSFORMACIÓN:
ANTES: \textbf{Parámetro} & \textbf{Valor} & \textbf{Unidad} \\
DESPUÉS: \textbf{Parámetro} & \textbf{Valor [unidad]} \\
```

### 5.6 Prompt R2-2: Tablas Condensados en Horizontal

```
TAREA DE REFINAMIENTO: Integrar tablas 2.32 y 2.33 en landscape

TABLAS: tab:dimensionado-condensados (1532-1554), tab:verificacion-condensados (1564-1585)
TRANSFORMACIÓN: Mover ambas a entorno landscape, continuar con conclusiones en vertical
```

### 5.7 Prompt R2-1: Consolidación Tablas Vapor

```
TAREA DE REFINAMIENTO: Consolidar tablas de tramos 3-7 en tabla resumen horizontal

TABLAS A CONSOLIDAR: tab:datos/tuberia/hidraulica-tramo3-4, tab:tramo5-7
RESULTADO: Una tabla landscape con columnas: Tramo, Origen-Destino, Caudal, DN, D_int, L_calc, v, ΔP
```

### 5.8 Prompt R2-6: Revisión de Conclusiones

```
TAREA DE REFINAMIENTO: Eliminar valores numéricos innecesarios de conclusiones

INSTRUCCIÓN: Analizar, clasificar (SIGNIFICATIVOS/REDUNDANTES), proponer al usuario
```

---

## 6. Entregables

| Archivo | Acción |
|---------|--------|
| `Refinement_V2/instrucciones.md` | ACTUALIZADO con R2-7 y R2-8 |
| `Refinement_V2/index.md` | NUEVO - Índice de tareas |
| `Refinement_V2/plan_implementacion.md` | NUEVO - Este documento |
| `.opencode/agents/task-orchestrator.md` | A modificar: añadir Modo 4 |
| `.opencode/agents/latex-writer.md` | A modificar: añadir reglas |

---

## 7. Tiempo Estimado

| Fase | Descripción | Tiempo |
|------|-------------|--------|
| Implementación del orquestador | Modificar task-orchestrator.md y latex-writer.md | 1-1.5 h |
| Ejecución de refinamiento | R2-1 a R2-8 | 4.5 h |
| Verificación final | Compilación + revisión | 0.5 h |
| **TOTAL** | | **~6.5 h** |
