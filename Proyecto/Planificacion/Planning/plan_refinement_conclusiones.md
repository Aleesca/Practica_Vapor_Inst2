# Plan de Refinamiento - Conclusiones, Limitaciones, Trabajos Futuros y Bibliografía

**Fecha:** 2026-03-26
**Estado:** EN PROGRESO
**Archivo:** `plantilla.tex` (secciones 2734-3578)
**Instrucciones:** `instrucciones_refinement.md`

---

## 1. Problemas Identificados

| Sección | Líneas actuales | Problema |
|---------|----------------|----------|
| Conclusiones | 2734-3109 (~375 líneas) | Subsecciones, subsubsecciones, 10+ tablas |
| Limitaciones | 3111-3287 (~176 líneas) | 6 subsubsecciones, listas anidadas |
| Trabajos futuros | 3289-3502 (~213 líneas) | 3 subsubsecciones, tablas |
| Bibliografía | 3504-3578 (~74 líneas) | Listas manuales enumerate |

**Reducción estimada:** ~838 líneas → ~185 líneas (78%)

---

## 2. Especificaciones por Sección

### 2.1 Conclusiones (`\section{Conclusiones}`)
- **FORMATO:** Prosa escrita, máximo 1000 palabras
- **PROHIBIDO:** Tablas, bullet points, subsecciones, repetir datos de metodología
- **CONTENIDO:**
  1. Resumen del trabajo realizado (redes, aislamiento, enterramiento)
  2. Datos clave en prosa (no en tabla):
     - Caldera Vitomax 100-HS M33A, 5400 kg/h, 10 bar(a), 220°C
     - 7 tramos, 351.93 m red vapor, velocidades 18.93-21.45 m/s
     - Pérdidas de carga máximas: 0.38 bar
     - Red de condensados: 321.61 m, flash 7.45%
     - Aislamiento: pérdidas 30.81 kW (0.73%), cumple RITE (<30°C)
     - Sección enterrada: profundidad 1.09 m
  3. Último párrafo: conceptos teóricos reforzados de clase
     - Termodinámica (ciclo Rankine, saturación, entalpía)
     - Mecánica de fluidos (caudal, pérdidas de carga, velocidad)
     - Transferencia de calor (convección, conducción, aislamiento)
     - Normativa RITE/IDAE

### 2.2 Limitaciones (`\subsection{Limitaciones del trabajo}`)
- **FORMATO:** Párrafo introductorio breve + 3 bullets con prosa
- **LIMITACIONES SELECCIONADAS:**
  1. **Control y seguridad:** No se han dimensionado sistemas de control automático ni válvulas de seguridad; el diseño aside condiciones de operación nominales sin considerar transitorios.
  2. **Tratamiento de agua:** No se ha incluido el dimensionamiento de la estación de tratamiento de agua de alimentación, lo que condicionaría la eficiencia y vida útil de la caldera.
  3. **Análisis económico:** No se ha realizado un estudio de costes (CAPEX/OPEX) ni de retorno de inversión, lo que limita la viabilidad real del proyecto.

### 2.3 Trabajos Futuros (`\subsection{Trabajos futuros}`)
- **FORMATO:** 3 items con descripción e impacto, SIN subsubsecciones, SIN tablas
- **TRABAJOS:**
  1. Sistema de monitorización IoT (impacto: optimización operativa, mantenimiento predictivo)
  2. Integración de energías renovables (impacto: reducción de emisiones CO₂, cumplimiento UE)
  3. Sistema de recogida y retorno de condensados optimizado (impacto: ahorro energético, reducción consumo agua)

### 2.4 Bibliografía (BibTeX)
- **REEMPLAZAR** la sección manual con `\bibliographystyle{apalike}` y `\bibliography{refs}`
- **ACTIVAR** código BibTeX comentado en plantilla.tex
- **CREAR** entradas BibTeX en refs.bib desde links.md:
  - IDAE2007 (Guía técnica aislamiento térmico)
  - RITE2007 (Reglamento Instalaciones Térmicas)
  - CEPREVEN (Protección tuberías enterradas)
  - TUBACERO (Catálogo tubería)
  - EREN2015 (Manual diseño redes vapor)
  - AISLAM (Programa de cálculo IDAE)

---

## 3. Secuencia de Ejecución

1. **Crear backup:** `plantilla.tex.backup2`
2. **Guardar plan:** Este archivo
3. **Editar refs.bib:** Reemplazar contenido con entradas BibTeX del proyecto
4. **Editar plantilla.tex:**
   - Localizar líneas exactas de cada sección
   - Reemplazar secciones según especificaciones
   - Activar código BibTeX
5. **Compilar:** pdflatex → bibtex → pdflatex → pdflatex
6. **Verificar:** PDF resultante, páginas reducidas, referencias correctas

---

## 4. Métricas de Éxito

- [x] Plan guardado en Planning
- [ ] Backup creado
- [ ] Conclusiones: ~1000 palabras, sin tablas ni subsecciones
- [ ] Limitaciones: 3 bullets seleccionados
- [ ] Trabajos futuros: 3 items sin tablas ni subsubsecciones
- [ ] Bibliografía: BibTeX con refs.bib
- [ ] Compilación exitosa
- [ ] PDF verificado

---

## 5. Referencias

- `instrucciones_refinement.md` - Instrucciones del usuario
- `links.md` - Fuentes originales a convertir a BibTeX
- `plantilla.tex.backup` - Plantilla original con código BibTeX comentado
