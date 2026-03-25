# Conclusiones y Limitaciones

## Tabla de contenidos
- [1. Conclusiones principales](#1-conclusiones-principales)
- [2. Refuerzo de conceptos teóricos](#2-refuerzo-de-conceptos-teóricos)
- [3. Limitaciones del trabajo](#3-limitaciones-del-trabajo)
- [4. Trabajos futuros](#4-trabajos-futuros)

---

## 1. Conclusiones principales

> [!skill:steam_knowledge_skill] Extraer datos concretos de todas las secciones anteriores para sintetizar los hallazgos principales.

El presente trabajo ha permitido diseñar y dimensionar una instalación completa de vapor para una parcela industrial en Salamanca (700 m altitud), que suministra vapor sobrecalentado a 220 °C a cuatro consumidores con diferentes requerimientos de caudal y presión. Los principales hallazgos se resumen a continuación:

### 1.1. Selección de equipos y parámetros de diseño

- Se ha seleccionado la **caldera Viessmann VITOMAX 100-HS, modelo M33A** con un caudal nominal de **5400 kg/h** y una presión de diseño de **10 bar(g)** (9.068 bar(g) considerando la corrección por altitud).

- La potencia térmica requerida es de aproximadamente **4.2 MW**, calculada mediante balance entálpico entre el agua de alimentación a 15 °C y el vapor sobrecalentado a 220 °C y 10 bar(a).

- El caudal de diseño incluye un **factor de seguridad del 15%** para compensar fugas, resultando en un caudal de cálculo de 5400 kg/h (superior al caudal nominal de 4416 kg/h).

### 1.2. Red de distribución de vapor

- El dimensionamiento de la red de vapor se ha realizado adoptando como criterio una **velocidad de circulación objetivo de ~20 m/s**, valor que permite compatibilizar un diámetro económico con pérdidas de carga moderadas.

- Los diámetros seleccionados varían entre **DN 50 (Schedule 40)** y **DN 150 (Schedule 80)**, combinando normas DIN 2448 y Schedule según el diámetro y las condiciones de operación.

- Las **pérdidas de carga** en la red son moderadas, oscilando entre **0.01 bar** (tramo Caldera-P) y **0.24 bar** (tramo P-C₁, el más largo). La pérdida de carga total máxima acumulada hasta el consumidor más alejado (C₄) es de **0.38 bar**, valor inferior al criterio de diseño de 1 bar.

- Todos los consumidores reciben vapor a presión suficiente para su correcto funcionamiento, con velocidades homogéneas próximas a 20 m/s en todos los tramos.

### 1.3. Red de retorno de condensados

- La red de condensados se ha dimensionado considerando el **flujo bifásico** (mezcla de condensado líquido y vapor flash), adoptando como criterio de diseño velocidades entre **15 y 20 m/s**.

- El **porcentaje de vapor flash** calculado es de **7.45%** en masa, que representa aproximadamente el **98% en volumen** debido al elevado volumen específico del vapor (≈400 veces mayor que el líquido).

- El caudal de vapor flash que retorna a la caldera es de **402.54 kg/h**. Dado que la instalación no cuenta con economizador, el **aprovechamiento del vapor flash mediante precalentamiento del agua de alimentación** se convierte en la medida de eficiencia térmica más importante del sistema.

- Se recomienda la instalación de **tanques separadores de flash (Flash Vessel)** para separar físicamente el vapor del líquido, reduciendo el diámetro necesario del colector de retorno y mitigando riesgos de golpes de ariete.

- La presión de diseño de la red de condensados es de **3 bar(g)**, 1 bar inferior a la presión del consumidor de menor presión (C1 a 4 bar(g)), garantizando el correcto funcionamiento de los purgadores.

### 1.4. Aislamiento térmico

- El dimensionamiento del aislamiento se ha realizado garantizando que la **temperatura superficial no supere los 30 °C** en todos los tramos aéreos, cumpliendo con el criterio de seguridad del RITE.

- En todos los tramos analizados, las temperaturas superficiales calculadas están comprendidas entre **17.1 °C y 18.2 °C**, con un $\Delta T < 5$ °C respecto a la temperatura ambiente, eliminando cualquier riesgo de quemaduras por contacto accidental.

- Se ha adoptado un criterio de **estandarización por rangos DN** en lugar de optimización individual por tramo, siguiendo las recomendaciones de las guías IDAE, ISO 12241 y manuales industriales. Este enfoque reduce costes logísticos, simplifica el inventario y facilita el mantenimiento.

- Los espesores de aislamiento adoptados son:
  - **Red de vapor (220 °C):** 100 mm (DN ≥ 125), 80 mm (DN 50-100), 50 mm (tramo soterrado)
  - **Red de condensados (143.6 °C):** 50 mm (DN ≥ 50), 40 mm (DN < 50)

- Las pérdidas térmicas lineales oscilan entre **25.8 W/m** (tramo T-C₃ de condensados, el más pequeño) y **65.1 W/m** (tramo Caldera-P de vapor, el de mayor diámetro).

### 1.5. Detalles de instalación

- Para los tramos soterrados, se ha deducido una **profundidad del eje de 1.09 m**, considerando las capas de tierra (0.80 m), hormigón (0.10 m), margen sobre aislamiento (0.10 m) y el radio exterior de la tubería aislada (0.0945 m).

- La **altura recomendada para las líneas aéreas** es de **5-6 metros** sobre puentes de tuberías (pipe racks), por debajo de la altura de las naves (20 m), garantizando accesibilidad para mantenimiento y facilitando el drenaje por gravedad.

- La **separación vertical entre la línea de vapor y la línea de condensados** se ha establecido en **1 metro** (vapor a 6 m, condensados a 5 m), permitiendo la instalación de pozos de goteo y estaciones de purga con drenaje por gravedad.

---

## 2. Refuerzo de conceptos teóricos

El desarrollo de este trabajo ha permitido reforzar y aplicar de manera práctica los conceptos teóricos estudiados en el aula, integrando conocimientos de:

### 2.1. Termodinámica aplicada

- Uso de **tablas de vapor saturado y sobrecalentado** para obtener propiedades termofísicas (entalpías, volúmenes específicos, temperaturas de saturación).
- Cálculo de **balances entálpicos** para determinar la potencia térmica de la caldera y el porcentaje de vapor flash en la red de condensados.
- Aplicación de conceptos de **cambio de fase** y comportamiento de fluidos bifásicos.

### 2.2. Mecánica de fluidos

- Aplicación de la **ecuación de Darcy-Weisbach** para el cálculo de pérdidas de carga por fricción en tuberías.
- Cálculo de **longitudes equivalentes** para singularidades (codos, derivaciones en T) utilizando relaciones $L_e/D$ de tablas técnicas.
- Determinación de **velocidades de circulación** y verificación de criterios hidráulicos para evitar erosión, ruidos y golpes de ariete.
- Diseño de redes ramificadas con **acumulación de pérdidas de presión** tramo a tramo.

### 2.3. Transferencia de calor

- Aplicación de ecuaciones de **conducción radial en cilindros** para calcular resistencias térmicas en tuberías aisladas.
- Cálculo de **resistencias térmicas en serie** (tubería, aislamiento, superficie exterior, terreno).
- Determinación de **flujos de calor lineales** ($q_L$) y temperaturas superficiales ($T_{surf}$) para verificación de seguridad.
- Comprensión del efecto de la **conductividad térmica** de diferentes materiales (acero, lana de roca, terreno) sobre las pérdidas energéticas.

### 2.4. Ingeniería de instalaciones industriales

- Consulta e interpretación de **catálogos comerciales** de calderas (Viessmann), tuberías (DIN 2448, Schedule) y accesorios.
- Aplicación de **normativas técnicas** (RITE, ISO 12241, guías IDAE y EREN) para el diseño de instalaciones de vapor.
- Comprensión de **criterios de estandarización industrial** (rangos DN) versus optimización matemática individual.
- Diseño de **detalles constructivos** (zanjas, profundidades de enterramiento, alturas de líneas aéreas, estaciones de purga).

En definitiva, el trabajo ha permitido integrar conocimientos multidisciplinares de forma coherente, tomando decisiones de ingeniería fundamentadas en criterios técnicos, normativos y económicos, tal como se requiere en la práctica profesional.

---

## 3. Limitaciones del trabajo

El presente trabajo se ha centrado en el dimensionamiento termohidráulico de las redes de vapor y condensados y en el diseño del aislamiento térmico. Sin embargo, existen varios aspectos que no se han incluido en el alcance del estudio:

### 3.1. Elementos de control y seguridad

- **Purgadores de vapor:** No se ha realizado la selección específica de los modelos comerciales de purgadores (termodinámicos, termostáticos, de boya, etc.) ni su ubicación detallada en cada punto de purga. Se ha asumido su presencia conceptual en el diseño.

- **Válvulas de control y regulación:** No se han dimensionado ni especificado las válvulas de control de presión, válvulas de retención, válvulas de alivio, válvulas motorizadas, etc.

- **Instrumentación:** No se ha diseñado el sistema de medida y monitorización (manómetros, termómetros, caudalímetros, transmisores de presión/temperatura, etc.).

- **Sistemas de seguridad:** No se han considerado en detalle los sistemas de alivio de sobrepresión, válvulas de seguridad, discos de ruptura, protecciones contra sobrecalentamiento, etc.

### 3.2. Automatización y control

- No se ha desarrollado el sistema de control automático de la caldera ni de la red (arranque/parada, regulación de presión, control de nivel del tanque de alimentación, etc.).

- No se ha diseñado el sistema SCADA o sistema de gestión energética para monitorización y optimización operativa.

### 3.3. Tratamiento de agua

- No se ha diseñado el sistema de tratamiento de agua de alimentación (descalcificación, desoxigenación, control de pH, dosificación de productos químicos).

- No se han considerado los sistemas de purga de fondo de caldera ni los criterios de calidad del agua para prevenir incrustaciones y corrosión.

### 3.4. Aspectos económicos

- No se ha realizado un **análisis de coste del ciclo de vida (Life Cycle Cost, LCC)** que compare diferentes alternativas de diseño considerando costes de inversión inicial, operación, mantenimiento y eficiencia energética a largo plazo.

- No se ha efectuado un análisis de rentabilidad o payback de las medidas de eficiencia energética propuestas (aprovechamiento del vapor flash, espesor de aislamiento óptimo económico, etc.).

### 3.5. Otros elementos

- **Economizador:** La instalación no incluye un economizador (intercambiador de calor que aprovecha los gases de escape de la caldera para precalentar el agua de alimentación), lo cual podría mejorar la eficiencia global del sistema.

- **Desaireador:** No se ha considerado un sistema de desaireación del agua de alimentación para eliminar gases disueltos (oxígeno, CO₂) que causan corrosión.

- **Estructura y soportación:** No se han diseñado en detalle los soportes, anclajes, liras de dilatación, compensadores de expansión térmica, pipe racks, cimentaciones, etc.

- **Planos constructivos detallados:** Aunque se referencian planos de situación y croquis conceptuales, no se han desarrollado planos constructivos completos con todos los detalles de montaje, soldaduras, conexionado, etc.

---

## 4. Trabajos futuros

Como líneas de trabajo futuro se proponen:

1. **Estudio de viabilidad técnico-económica de la instalación de un economizador:** Analizar el potencial de ahorro energético y el período de retorno de la inversión de incorporar un economizador en los gases de escape de la caldera. Este equipo podría precalentar el agua de alimentación de 15 °C a 80-90 °C, reduciendo significativamente el consumo de combustible. Se recomienda realizar simulaciones térmicas y comparar diferentes tecnologías comerciales (economizadores de tubos rectos, serpenteados, de aletas, etc.).

2. **Automatización del sistema de gestión de purgadores y optimización del retorno de condensados:** Implementar un sistema automático de monitorización del estado de los purgadores mediante sensores de temperatura o ultrasonidos que permita detectar fallos (bloqueo o fuga continua). Adicionalmente, diseñar un sistema inteligente de gestión del tanque separador de flash con control de nivel y válvulas motorizadas que optimice el aprovechamiento energético del vapor flash. Evaluar la incorporación de bombas de retorno de condensados con variador de frecuencia para mejorar la eficiencia del ciclo.

3. **Análisis de coste del ciclo de vida (Life Cycle Cost, LCC) de diferentes alternativas de aislamiento térmico:** Realizar un estudio económico detallado que compare diferentes espesores de aislamiento, materiales (lana de roca, poliuretano, silicato cálcico, aerogel) y configuraciones (aislamiento simple, doble capa, etc.) considerando:
   - Coste de inversión inicial (material + instalación)
   - Pérdidas energéticas anuales y coste del combustible
   - Costes de mantenimiento y reposición
   - Vida útil del aislamiento
   - Impacto ambiental (emisiones de CO₂)
   
   Este análisis permitiría identificar la solución óptima desde el punto de vista técnico-económico a largo plazo (típicamente 20-25 años).

---

**Checkboxes de completitud (Plan de mejora):**
- [x] **6.1** Conclusiones: resumen de hallazgos (velocidades ~20 m/s, presiones moderadas, $T_{surf}<30°C$)
- [x] **6.2** Refuerzo teórico: mención a ecuaciones aplicadas (Darcy-Weisbach, resistencias térmicas)
- [x] **6.3** Limitaciones: elementos no incluidos (purgadores, automatización, LCC, economizador)
- [x] **6.4** Trabajos futuros: 3 puntos concretos (economizador, automatización purgadores, análisis LCC)
- [x] **[skill: steam_knowledge_skill]** Extraer datos concretos de todas las secciones
