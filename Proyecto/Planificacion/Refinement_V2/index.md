# Refinement V2 - Índice de Tareas

**Proyecto**: Práctica de Vapor - Instalaciones II
**Documento objetivo**: `Practica_Vapor_LaTeX/plantilla.tex`
**Instrucciones**: `instrucciones.md`

---

## Distribución por Prioridad

| Prioridad | Categoría | Tareas | Riesgo |
|-----------|-----------|--------|--------|
| 🔴 HIGH | Cambios menores (checkmarks, texto) | 5 | BAJO |
| 🔴 HIGH | Citas bibliográficas | 7 | BAJO |
| 🔴 HIGH | Clarificación de caudales | 5 | BAJO |
| 🟡 MEDIUM | Refactorización de unidades | 3 | MEDIO |
| 🟡 MEDIUM | Reorganización tablas condensados | 5 | MEDIO |
| 🟡 MEDIUM | Reorganización tablas vapor | 5 | ALTO |
| 🟡 MEDIUM | Revisión de conclusiones | 6 | BAJO |
| 🟢 LOW | Verificación final | 5 | - |

---

## PRIORIDAD 1: Cambios Menores

### R2-4: Eliminación de Checkmarks
- [ ] **R2-4.1** Eliminar `\checkmark` de `tab:verificacion-criterios-tramo1` (líneas 931-933)
- [ ] **R2-4.2** Eliminar `\checkmark` de `tab:presiones-consumidores` (líneas 1344-1347)
- [ ] **R2-4.3** Eliminar `\checkmark` de `tab:perdidas-acumuladas` (líneas 1365-1368)
- [ ] **R2-4.4** Eliminar `\checkmark` de `tab:perdidas-condensados` (líneas 1599-1604)
- [ ] **R2-4.5** Añadir texto de cumplimiento después de cada tabla afectada

### R2-3: Reducir Tamaño Tabla 2.36
- [ ] **R2-3.1** Localizar `tab:aislamiento_vapor_aereo` (líneas 1760-1785)
- [ ] **R2-3.2** Cambiar `\small` a `\footnotesize` o `\scriptsize`
- [ ] **R2-3.3** Compilar y verificar legibilidad

---

## PRIORIDAD 2: Citas Bibliográficas

### R2-7: Citas Faltantes
- [ ] **R2-7.1** Verificar/crear entradas en `.bib`:
  - [ ] DIN2448
  - [ ] SpiraxSarco2020
  - [ ] IDAE2014
  - [ ] ISO12241
  - [ ] ASME2019
- [ ] **R2-7.2** Añadir citas de DIN 2448 (~9 ubicaciones: 631, 637, 804, 1124, 1187, 1236, 1321-1325, 2193, 2203)
- [ ] **R2-7.3** Añadir citas de Spirax Sarco (~5 ubicaciones: 577, 690, 832, 1721, 2203)
- [ ] **R2-7.4** Añadir citas de IDAE (~4 ubicaciones: 1721, 2179, 2197, 2203)
- [ ] **R2-7.5** Añadir citas de ISO 12241 y ASME (~2-3 ubicaciones)
- [ ] **R2-7.6** Compilar y verificar que no hay referencias indefinidas
- [ ] **R2-7.7** Revisar todo el documento por menciones adicionales de normativa sin citar

---

## PRIORIDAD 3: Clarificación de Caudales

### R2-8: Explicación de Distribución de Caudales
- [ ] **R2-8.1** Crear párrafo explicativo de topología de red ramificada
- [ ] **R2-8.2** Crear tabla de distribución de caudales por nodos de bifurcación
- [ ] **R2-8.3** Crear lista de cálculo de caudal por tramo (TR1-TR7)
- [ ] **R2-8.4** Insertar después de línea 575 (antes de "Criterio de velocidad")
- [ ] **R2-8.5** Verificar coherencia con valores existentes en tablas de tramos

---

## PRIORIDAD 4: Refactorización de Unidades

### R2-5: Columnas de Unidades → Encabezados
- [ ] **R2-5.1** Identificar tablas con columna "Unidad" (~20 ubicaciones: líneas 203, 223, 273, 441, 474, 496, 741, 771, 814, 903, 1070, 1101, 1122, 1139, 1164, 1185, 1202, 1229, 1256, 1283)
- [ ] **R2-5.2** Para cada tabla: eliminar columna "Unidad" e integrar en encabezados
- [ ] **R2-5.3** Verificar compilación exitosa

---

## PRIORIDAD 5: Reorganización de Tablas

### R2-2: Tablas de Condensados en Horizontal
- [ ] **R2-2.1** Crear entorno landscape para sección 2.3.5
- [ ] **R2-2.2** Mover `tab:dimensionado-condensados` (Tabla ~30/2.32) al landscape
- [ ] **R2-2.3** Mover `tab:verificacion-condensados` (Tabla ~31/2.33) al landscape
- [ ] **R2-2.4** Añadir `\clearpage` y continuar conclusiones en vertical
- [ ] **R2-2.5** Verificar paginación correcta

### R2-1: Consolidación de Tablas Sección 2.2
- [ ] **R2-1.1** Crear tabla resumen consolidada en landscape
- [ ] **R2-1.2** Eliminar tablas individuales redundantes:
  - TR3: `tab:datos-tramo3`, `tab:tuberia-tramo3`, `tab:hidraulica-tramo3` (1095-1147)
  - TR4: `tab:datos-tramo4`, `tab:tuberia-tramo4`, `tab:hidraulica-tramo4` (1158-1210)
  - TR5-7: `tab:tramo5`, `tab:tramo6`, `tab:tramo7` (1223-1298)
- [ ] **R2-1.3** Actualizar texto de secciones 2.2.4, 2.2.5, 2.2.6
- [ ] **R2-1.4** Actualizar referencias cruzadas si existen
- [ ] **R2-1.5** Verificar coherencia con tabla resumen existente `tab:resumen-red-vapor`

---

## PRIORIDAD 6: Revisión Editorial

### R2-6: Conclusiones
- [ ] **R2-6.1** Analizar sección de Conclusiones (líneas ~2180+)
- [ ] **R2-6.2** Listar valores numéricos en prosa
- [ ] **R2-6.3** Clasificar: SIGNIFICATIVOS vs REDUNDANTES
- [ ] **R2-6.4** Presentar propuesta al usuario para confirmación
- [ ] **R2-6.5** Aplicar cambios aprobados
- [ ] **R2-6.6** Verificar coherencia del texto resultante

---

## VERIFICACIÓN FINAL

- [ ] **VF-1** Compilación exitosa sin errores
- [ ] **VF-2** Sin warnings de referencias indefinidas
- [ ] **VF-3** Paginación correcta (landscape/portrait)
- [ ] **VF-4** Índices actualizados (TOC, LOT, LOF)
- [ ] **VF-5** Revisión visual del PDF resultante


