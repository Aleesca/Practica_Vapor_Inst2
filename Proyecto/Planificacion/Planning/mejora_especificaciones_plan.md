# Plan de Mejora de Especificaciones

**Fecha**: 2026-03-25  
**Estado**: Pendiente de ejecución  
**Objetivo**: Enriquecer los 6 archivos de `Especificaciones/` con contenido de `Anotaciones/`, integrando referencias a skills y siguiendo buenas prácticas de documentación técnica.

## Convenciones

- **Rutas relativas** usando `../Anotaciones/` como base
- **Checkboxes `[ ]`** para verificación de completitud
- **Skills** con formato: `> [!skill:nombre_skill] Instrucción`
- **Tablas de contenido** al inicio de cada especificación

---

## Tareas

### 1. `intro_especs.md` (Reescribir)
- [ ] **1.1** Contexto del problema (fuente: `../Anotaciones/adicional/Comentarios_practicas.md`)
- [ ] **1.2** Ubicación y datos catastrales (fuente: `../Anotaciones/intro.md`, `../Anotaciones/datos_partida.md`)
- [ ] **1.3** Tabla de consumidores C1-C4 con caudales y presiones (fuente: `../Anotaciones/datos_partida.md`)
- [ ] **1.4** Objetivos del trabajo (qué preguntas se responden)
- [ ] **1.5** Referencia a figuras: plano situación, `seleccion_factor_f.pdf`, `seleccion_presion.pdf`
- [ ] **[skill: latex_drafting_skill]** Formato tablas booktabs

### 2. `bases_diseño_seleccion_equipos_specs.md` (Crear desde cero)
- [ ] **2.1** Caudal de diseño: $Q_{total} = K \cdot \sum C_i$, factor 1.15 fugas (fuente: `../Anotaciones/datos_partida.md`)
- [ ] **2.2** Presión de diseño: cálculo con altitud 700m → 0.932 bar (fuente: `../Anotaciones/datos_partida.md`)
- [ ] **2.3** Selección caldera Viessmann VITOMAX 100-HS modelo M33A (fuente: `../Anotaciones/datos_partida.md`)
  - [ ] **[skill: doc_tecnica_vapor]** Consultar catálogo en `references/`
- [ ] **2.4** Potencia térmica: $P = \dot{m}(h_v - h_w)$ con entalpías a 10 bar abs y 220°C (fuente: `../Anotaciones/datos_partida.md`)
- [ ] **2.5** Criterios de velocidad admisible según presión (fuente: `../Anotaciones/Directrices_Dimensionamiento.md`)

### 3. `red_vapor_specs.md` (Ampliar)
- [ ] **3.1** Criterio de diseño: velocidad ~20 m/s como objetivo (fuente: `../Anotaciones/Red_vapor.md`)
- [ ] **3.2** Metodología de cálculo: iterativa con hoja de cálculo, verificación velocidad y caída presión (fuente: `../Anotaciones/Red_vapor.md`)
- [ ] **3.3** Fórmula de longitud de cálculo: $L_{cálculo} = L_{real} + L_{eq}$ (fuente: `../Anotaciones/Red_vapor.md`)
- [ ] **3.4** Propiedades del vapor solo en primer tramo: $h_v$, $\gamma$, $c_e$, $\rho_{relativa}$, $\mu$, $\vartheta$ (fuente: `../Anotaciones/datos_partida.md`)
- [ ] **3.5** Selección de tuberías: DIN2448 / Schedule 40/80 según justificación (fuente: `../Anotaciones/adicional/Seleccion_diametros-codos.md`)
- [ ] **3.6** Selección de codos: radio mediano Le/D=26 (fuente: `../Anotaciones/adicional/Seleccion_diametros-codos.md`)
- [ ] **3.7** Desarrollo por tramos con cálculos detallados (fuente: `../Anotaciones/Red_vapor.md`)
- [ ] **3.8** Tabla: longitudes de cálculo y presiones por tramo (fuente: `../Anotaciones/Red_vapor.md`)
- [ ] **3.9** Tabla: verificación hidráulica (fuente: `../Anotaciones/Red_vapor.md`)
- [ ] **[skill: latex_drafting_skill]** Formato tablas resumen en A4 horizontal

### 4. `red_condensados_specs.md` (Ampliar)
- [ ] **4.1** Criterio de diseño: flujo bifásico, velocidad 15-20 m/s (fuente: `../Anotaciones/Red_condensados.md`, `../Anotaciones/Directrices_Dimensionamiento.md`)
- [ ] **4.2** Fórmula vapor flash: $\%vf = \frac{h_{lp1} - h_{lp2}}{h_{vp2} - h_{lp2}} \cdot 100$ (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **4.3** Presión de la red: $P_{red cond} = P_{min} - 1$ bar = 3 bar(g) (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **4.4** Propiedades termofísicas a $T_{sat}=143.7°C$ y a $T_{sat}=180.2°C$ (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **4.5** Caudal de vapor flash: $Q_{vf} = vf \cdot Q_{cálculo} = 402.54$ kg/h (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **4.6** Nota sobre separación vapor/condensados (diferencia altura 0.5-1.5m) (fuente: `../Anotaciones/adicional/diferencia_altura_lineavapor-lineacondensados.md`)
- [ ] **4.7** Justificación Schedule 40 vs DIN2448 para condensados (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **4.8** Gestión y aprovechamiento del vapor flash (fuente: `../Anotaciones/adicional/red_condensados_vapor_flash.md`)
- [ ] **4.9** Tabla: cálculos de diámetros y presiones por tramo (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **4.10** Tabla: verificación de velocidades e interiores (fuente: `../Anotaciones/Red_condensados.md`)
- [ ] **[skill: latex_drafting_skill]** Formato tablas resumen en A4 horizontal

### 5. `aislamiento_termico_detalles_instalacion_specs.md` (Ampliar)
- [ ] **5.1** Parámetros de diseño: $T_{vap}=220°C$, $T_{cond}=143.6°C$, $T_{amb}=15°C$, $h_{ext}=25$ W/(m²·K) (fuente: `../Anotaciones/aislamiento.md`)
- [ ] **5.2** Materiales: lana de roca $\lambda=0.04$, acero $\lambda=50$ (fuente: `../Anotaciones/aislamiento.md`)
- [ ] **5.3** Criterio seguridad: $T_{surf} < 30°C$ (RITE) (fuente: `../Anotaciones/aislamiento.md`)
- [ ] **5.4** Ecuaciones de transferencia de calor: $q_L$, $R_{pipe}$, $R_{aisl}$, $R_{surf}$, $R_{terr}$, $R_{can}$ (fuente: `../Anotaciones/aislamiento.md`)
- [ ] **5.5** Cálculos exhaustivos red vapor: TR1-TR7 con radios, resistencias, flujo y seguridad (fuente: `../Anotaciones/aislamiento.md` Sec. 2)
- [ ] **5.6** Cálculos exhaustivos red condensados: TR1-TR7 (fuente: `../Anotaciones/aislamiento.md` Sec. 3)
- [ ] **5.7** Tabla resumen dimensionamiento red vapor (7 tramos) (fuente: `../Anotaciones/aislamiento.md` Sec. 4)
- [ ] **5.8** Tabla resumen dimensionamiento red condensados (7 tramos) (fuente: `../Anotaciones/aislamiento.md` Sec. 4)
- [ ] **5.9** Criterios de estandarización por rangos DN (fuente: `../Anotaciones/aislamiento.md` Sec. 5)
- [ ] **5.10** Morfología del enterramiento: capas estratificadas (fuente: `../Anotaciones/enterramiento.md`)
- [ ] **5.11** Deducción de profundidad $h_{eje}=1.09$m y geometría zanja (fuente: `../Anotaciones/enterramiento.md`)
- [ ] **5.12** Altura líneas aéreas: 4.5-6m recomendado, por debajo de naves (fuente: `../Anotaciones/adicional/Altura_lineas_aereas.md`)
- [ ] **5.13** Separación vertical vapor/condensados: 0.5-1.5m (fuente: `../Anotaciones/adicional/diferencia_altura_lineavapor-lineacondensados.md`)
- [ ] **[skill: doc_tecnica_vapor]** Referencias: ISO 12241, RITE (RD 1027/2007), IDAE, EREN
- [ ] **[skill: latex_drafting_skill]** Formato tablas resumen

### 6. `conclusiones_y_limitaciones_specs.md` (Ampliar)
- [ ] **6.1** Conclusiones: resumen de hallazgos (velocidades ~20 m/s, presiones moderadas, $T_{surf}<30°C$)
- [ ] **6.2** Refuerzo teórico: mención a ecuaciones aplicadas (Darcy-Weisbach, resistencias térmicas)
- [ ] **6.3** Limitaciones: elementos no incluidos (fuente: `../Anotaciones/adicional/Comentarios_practicas.md`)
- [ ] **6.4** Trabajos futuros: 3 puntos concretos (economizador, automatización purgadores, análisis LCC)
- [ ] **[skill: steam_knowledge_skill]** Extraer datos concretos de todas las secciones

---

## Dependencias entre archivos

```
intro_especs.md
    └── ../Anotaciones/datos_partida.md
    └── ../Anotaciones/intro.md

bases_diseño_seleccion_equipos_specs.md
    └── ../Anotaciones/datos_partida.md
    └── ../Anotaciones/Directrices_Dimensionamiento.md
    └── [skill: doc_tecnica_vapor] → catálogo Viessmann

red_vapor_specs.md
    └── ../Anotaciones/Red_vapor.md
    └── ../Anotaciones/Directrices_Dimensionamiento.md
    └── ../Anotaciones/adicional/Seleccion_diametros-codos.md

red_condensados_specs.md
    └── ../Anotaciones/Red_condensados.md
    └── ../Anotaciones/adicional/red_condensados_vapor_flash.md
    └── ../Anotaciones/Directrices_Dimensionamiento.md

aislamiento_termico_detalles_instalacion_specs.md
    └── ../Anotaciones/aislamiento.md
    └── ../Anotaciones/enterramiento.md
    └── ../Anotaciones/adicional/Altura_lineas_aereas.md
    └── ../Anotaciones/adicional/diferencia_altura_lineavapor-lineacondensados.md

conclusiones_y_limitaciones_specs.md
    └── ../Anotaciones/adicional/Comentarios_practicas.md
    └── (inferido de todas las secciones anteriores)
```

---

## Skills a integrar

| Skill | Cuándo usar | Referencia |
|-------|-------------|------------|
| `doc_tecnica_vapor` | Catálogos de equipos, normativas ISO/RITE, guías IDAE/Spirax | `../skills/doc_tecnica_vapor/skill.md` |
| `steam_knowledge_skill` | Extracción de datos técnicos de Anotaciones | `../skills/steam_knowledge_skill/skill.md` |
| `latex_drafting_skill` | Formato tablas booktabs, inserción de figuras | `../skills/latex_drafting_skill/skill.md` |
