# Aislamiento Térmico y Detalles de Instalación

## Tabla de contenidos
- [1. Parámetros de diseño y metodología](#1-parámetros-de-diseño-y-metodología)
- [2. Ecuaciones de transferencia de calor](#2-ecuaciones-de-transferencia-de-calor)
- [3. Cálculos exhaustivos: Red de vapor (220 °C)](#3-cálculos-exhaustivos-red-de-vapor-220-c)
- [4. Cálculos exhaustivos: Red de condensados (143.6 °C)](#4-cálculos-exhaustivos-red-de-condensados-1436-c)
- [5. Tablas resumen de dimensionamiento](#5-tablas-resumen-de-dimensionamiento)
- [6. Criterios de estandarización por rangos DN](#6-criterios-de-estandarización-por-rangos-dn)
- [7. Morfología del enterramiento](#7-morfología-del-enterramiento)
- [8. Deducción de la profundidad del eje](#8-deducción-de-la-profundidad-del-eje)
- [9. Altura de las líneas aéreas](#9-altura-de-las-líneas-aéreas)
- [10. Separación vertical vapor/condensados](#10-separación-vertical-vaporcondensados)
- [11. Referencias normativas](#11-referencias-normativas)

---

## 1. Parámetros de diseño y metodología

Este documento establece el dimensionamiento detallado del aislamiento para cada tramo de la instalación, diferenciando por diámetros, temperatura de operación y ubicación (aéreo/soterrado), optimizando el espesor para reducir costes manteniendo la seguridad técnica.

### 1.1. Temperaturas de operación

- **Vapor:** $T_{vap} = 220 \ \text{°C}$
- **Condensados:** $T_{cond} = 143.6 \ \text{°C}$ (Saturación a 3 bar(g))

### 1.2. Condiciones ambientales

- **Aire exterior:**
  - Temperatura ambiente: $T_{amb} = 15 \ \text{°C}$
  - Coeficiente de convección-radiación: $h_{ext} = 25 \ \text{W/(m}^2\cdot\text{K)}$

- **Terreno (tramos soterrados):**
  - Temperatura del terreno: $T_{terr} = 10 \ \text{°C}$
  - Conductividad térmica del terreno: $\lambda_{terr} = 1.2 \ \text{W/(m}\cdot\text{K)}$
  - Profundidad del eje: $h_{eje} = 1.09 \ \text{m}$

### 1.3. Materiales

- **Aislamiento:** Lana de Roca
  - Conductividad térmica: $\lambda_{aisl} = 0.04 \ \text{W/(m}\cdot\text{K)}$

- **Tubería:** Acero al Carbono
  - Conductividad térmica: $\lambda_{acero} = 50 \ \text{W/(m}\cdot\text{K)}$

### 1.4. Criterio de seguridad

Según el **RITE (Reglamento de Instalaciones Térmicas en los Edificios, RD 1027/2007)**, la temperatura superficial del aislamiento en zonas accesibles debe cumplir:

$$T_{surf} < 30 \ \text{°C}$$

Este criterio garantiza que no existe riesgo de quemaduras por contacto accidental.

---

## 2. Ecuaciones de transferencia de calor

### 2.1. Pérdida de calor lineal

La pérdida de calor por unidad de longitud ($q_L$, en W/m) se define como:

$$q_L = \frac{\Delta T}{\sum R}$$

donde $\Delta T$ es la diferencia de temperatura entre el fluido y el ambiente, y $\sum R$ es la resistencia térmica total por unidad de longitud.

### 2.2. Resistencias térmicas

La resistencia térmica total incluye varios componentes en serie:

#### 2.2.1. Resistencia de la tubería ($R_{pipe}$)

$$R_{pipe} = \frac{\ln(r_1 / r_{int})}{2 \pi \lambda_{acero}}$$

donde:
- $r_{int}$: Radio interior de la tubería (m)
- $r_1$: Radio exterior de la tubería (m)
- $\lambda_{acero} = 50 \ \text{W/(m}\cdot\text{K)}$

> **Nota:** En la práctica, esta resistencia es despreciable frente a las demás debido a la alta conductividad del acero.

#### 2.2.2. Resistencia del aislamiento ($R_{aisl}$)

$$R_{aisl} = \frac{\ln(r_2 / r_1)}{2 \pi \lambda_{aisl}}$$

donde:
- $r_2$: Radio exterior del aislamiento (m)
- $\lambda_{aisl} = 0.04 \ \text{W/(m}\cdot\text{K)}$

Esta es la **resistencia térmica dominante** del sistema.

#### 2.2.3. Resistencia exterior

La resistencia exterior depende del tipo de instalación:

**a) Tramos aéreos ($R_{surf}$):**

$$R_{surf} = \frac{1}{\pi d_e h_{ext}}$$

donde:
- $d_e = 2 r_2$: Diámetro exterior del aislamiento (m)
- $h_{ext} = 25 \ \text{W/(m}^2\cdot\text{K)}$: Coeficiente combinado de convección y radiación

**b) Tramos soterrados ($R_{terr}$):**

$$R_{terr} = \frac{\ln(2 h_{eje} / r_2)}{2\pi \lambda_{terr}}$$

donde:
- $h_{eje} = 1.09 \ \text{m}$: Profundidad del eje de la tubería
- $\lambda_{terr} = 1.2 \ \text{W/(m}\cdot\text{K)}$

#### 2.2.4. Resistencia de canalización/arena ($R_{can}$)

Para tramos soterrados, se considera una resistencia adicional debida a la capa de arena que envuelve la tubería:

$$R_{can} \approx 0.05 \ \text{m}\cdot\text{K/W}$$

---

## 3. Cálculos exhaustivos: Red de vapor (220 °C)

### TR1 (Caldera-P) - DN 150 (Aéreo)

**Geometría:**
- Radio interior: $r_{int} = 73.2 \ \text{mm}$
- Radio exterior tubería: $r_1 = 84.15 \ \text{mm}$ (Schedule 80)
- Espesor de aislamiento: $e = 100 \ \text{mm}$
- Radio exterior total: $r_2 = 184.15 \ \text{mm}$

**Resistencias térmicas:**
$$R_{pipe} = \frac{\ln(84.15 / 73.2)}{2 \pi \times 50} = 0.0004 \ \text{m}\cdot\text{K/W}$$

$$R_{aisl} = \frac{\ln(184.15 / 84.15)}{2 \pi \times 0.04} = 3.115 \ \text{m}\cdot\text{K/W}$$

$$R_{surf} = \frac{1}{\pi \times 0.3683 \times 25} = 0.035 \ \text{m}\cdot\text{K/W}$$

**Flujo de calor y verificación de seguridad:**
$$R_{tot} = 0.0004 + 3.115 + 0.035 = 3.150 \ \text{m}\cdot\text{K/W}$$

$$q_L = \frac{220 - 15}{3.150} = 65.1 \ \text{W/m}$$

$$T_{surf} = 15 + 65.1 \times 0.035 = 17.3 \ \text{°C} \quad \checkmark \ (< 30 \ \text{°C})$$

---

### TR2 (P-C1) - DN 80 (Soterrado)

**Geometría:**
- $r_{int} = 33.3 \ \text{mm}$, $r_1 = 44.45 \ \text{mm}$ (Sch 160)
- Espesor: $e = 50 \ \text{mm}$, $r_2 = 94.45 \ \text{mm}$

**Resistencias:**
$$R_{pipe} = 0.0009 \ \text{m}\cdot\text{K/W}$$
$$R_{aisl} = 2.999 \ \text{m}\cdot\text{K/W}$$
$$R_{can} = 0.050 \ \text{m}\cdot\text{K/W}$$
$$R_{terr} = \frac{\ln(2 \times 1.0945 / 0.09445)}{2\pi \times 1.2} = 0.417 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 0.0009 + 2.999 + 0.050 + 0.417 = 3.467 \ \text{m}\cdot\text{K/W}$$
$$q_L = \frac{220 - 10}{3.467} = 60.59 \ \text{W/m}$$

> **Nota:** En tramos soterrados no se calcula $T_{surf}$ porque no hay superficie expuesta al contacto humano.

---

### TR3 (P-S) - DN 125 (Aéreo)

**Geometría:**
- $r_{int} = 65.85 \ \text{mm}$, $r_1 = 70.65 \ \text{mm}$ (Schedule 20)
- Espesor: $e = 100 \ \text{mm}$, $r_2 = 170.65 \ \text{mm}$

**Resistencias:**
$$R_{pipe} = 0.0002 \ \text{m}\cdot\text{K/W}$$
$$R_{aisl} = 3.504 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.037 \ \text{m}\cdot\text{K/W}$$

**Flujo y seguridad:**
$$R_{tot} = 3.541 \ \text{m}\cdot\text{K/W}$$
$$q_L = \frac{205}{3.541} = 57.9 \ \text{W/m}$$
$$T_{surf} = 15 + 57.9 \times 0.037 = 17.1 \ \text{°C} \quad \checkmark$$

---

### TR4 (S-C2) - DN 80 (Aéreo)

**Geometría:**
- $r_{int} = 41.25 \ \text{mm}$, $r_1 = 44.45 \ \text{mm}$ (Sch 10)
- Espesor: $e = 80 \ \text{mm}$, $r_2 = 124.45 \ \text{mm}$

**Resistencias:**
$$R_{pipe} = 0.0002 \ \text{m}\cdot\text{K/W}$$
$$R_{aisl} = 4.095 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.051 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 4.146 \ \text{m}\cdot\text{K/W}$$
$$q_L = \frac{205}{4.146} = 49.4 \ \text{W/m}$$
$$T_{surf} = 15 + 49.4 \times 0.051 = 17.5 \ \text{°C} \quad \checkmark$$

---

### TR5 (S-T) - DN 100 (Aéreo)

**Geometría:**
- $r_{int} = 53.55 \ \text{mm}$, $r_1 = 57.15 \ \text{mm}$ (Sch 10)
- Espesor: $e = 80 \ \text{mm}$, $r_2 = 137.15 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 3.484 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.046 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 3.530 \ \text{m}\cdot\text{K/W}$$
$$q_L = 58.1 \ \text{W/m}$$
$$T_{surf} = 17.7 \ \text{°C} \quad \checkmark$$

---

### TR6 (T-C3) - DN 50 (Aéreo)

**Geometría:**
- $r_{int} = 26.25 \ \text{mm}$, $r_1 = 30.15 \ \text{mm}$ (Sch 40)
- Espesor: $e = 80 \ \text{mm}$, $r_2 = 110.15 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 5.153 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.058 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 5.211 \ \text{m}\cdot\text{K/W}$$
$$q_L = 39.3 \ \text{W/m}$$
$$T_{surf} = 17.3 \ \text{°C} \quad \checkmark$$

---

### TR7 (T-C4) - DN 100 (Aéreo)

**Geometría:**
- $r_{int} = 51.15 \ \text{mm}$, $r_1 = 57.15 \ \text{mm}$ (Sch 40)
- Espesor: $e = 80 \ \text{mm}$, $r_2 = 137.15 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 3.484 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.046 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 3.530 \ \text{m}\cdot\text{K/W}$$
$$q_L = 58.1 \ \text{W/m}$$
$$T_{surf} = 17.7 \ \text{°C} \quad \checkmark$$

---

## 4. Cálculos exhaustivos: Red de condensados (143.6 °C)

### TR1 (Caldera-P) - DN 65 (Aéreo)

**Geometría:**
- $r_{int} = 29.0 \ \text{mm}$, $r_1 = 36.5 \ \text{mm}$ (Sch 80)
- Espesor: $e = 50 \ \text{mm}$, $r_2 = 86.5 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 3.433 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.074 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 3.507 \ \text{m}\cdot\text{K/W}$$
$$q_L = \frac{143.6 - 15}{3.507} = 36.7 \ \text{W/m}$$
$$T_{surf} = 15 + 36.7 \times 0.074 = 17.7 \ \text{°C} \quad \checkmark$$

---

### TR2 (P-C1) - DN 32 (Soterrado)

**Geometría:**
- $r_{int} = 14.0 \ \text{mm}$, $r_1 = 21.2 \ \text{mm}$ (Sch 160)
- Espesor: $e = 40 \ \text{mm}$, $r_2 = 61.2 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 4.223 \ \text{m}\cdot\text{K/W}$$
$$R_{can} = 0.050 \ \text{m}\cdot\text{K/W}$$
$$R_{terr} = 0.474 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 4.747 \ \text{m}\cdot\text{K/W}$$
$$q_L = \frac{143.6 - 10}{4.747} = 28.1 \ \text{W/m}$$

---

### TR3 (P-S) - DN 65 (Aéreo)

**Geometría:**
- Idéntico a TR1 de condensados

**Flujo:**
$$q_L = 36.7 \ \text{W/m}$$
$$T_{surf} = 17.7 \ \text{°C} \quad \checkmark$$

---

### TR4 (S-C2) - DN 40 (Aéreo)

**Geometría:**
- $r_{int} = 19.5 \ \text{mm}$, $r_1 = 24.15 \ \text{mm}$
- Espesor: $e = 40 \ \text{mm}$, $r_2 = 64.15 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 3.886 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.099 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$q_L = 32.3 \ \text{W/m}$$
$$T_{surf} = 18.2 \ \text{°C} \quad \checkmark$$

---

### TR5 (S-T) - DN 50 (Aéreo)

**Geometría:**
- $r_{int} = 24.6 \ \text{mm}$, $r_1 = 30.15 \ \text{mm}$ (Sch 80)
- Espesor: $e = 50 \ \text{mm}$, $r_2 = 80.15 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 3.891 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.079 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 3.971 \ \text{m}\cdot\text{K/W}$$
$$q_L = 32.4 \ \text{W/m}$$
$$T_{surf} = 17.6 \ \text{°C} \quad \checkmark$$

---

### TR6 (T-C3) - DN 25 (Aéreo)

**Geometría:**
- $r_{int} = 12.1 \ \text{mm}$, $r_1 = 16.7 \ \text{mm}$ (Sch 80)
- Espesor: $e = 40 \ \text{mm}$, $r_2 = 56.7 \ \text{mm}$

**Resistencias:**
$$R_{aisl} = 4.868 \ \text{m}\cdot\text{K/W}$$
$$R_{surf} = 0.112 \ \text{m}\cdot\text{K/W}$$

**Flujo:**
$$R_{tot} = 4.980 \ \text{m}\cdot\text{K/W}$$
$$q_L = 25.8 \ \text{W/m}$$
$$T_{surf} = 17.9 \ \text{°C} \quad \checkmark$$

---

### TR7 (T-C4) - DN 50 (Aéreo)

**Geometría:**
- Idéntico a TR5

**Flujo:**
$$q_L = 32.4 \ \text{W/m}$$
$$T_{surf} = 17.6 \ \text{°C} \quad \checkmark$$

---

## 5. Tablas resumen de dimensionamiento

> [!skill:latex_drafting_skill] Formato tablas con booktabs para presentación profesional.

### 5.1. Red de distribución de vapor (220 °C)

| Tramo              | Ubicación  | DN (mm) | Espesor ($e$) | $\sum R$ (m·K/W) | $q_L$ (W/m) | $T_{surf}$ (°C) |
|:-------------------|:-----------|:-------:|:--------------|:----------------:|:-----------:|:---------------:|
| **TR1 (Caldera-P)** | Aéreo      | 150     | **100 mm**    | 3.150            | 65.1        | 17.3            |
| **TR2 (P-C1)**      | **Soterrado** | 80      | **50 mm**     | 3.467            | 60.6        | N/A             |
| **TR3 (P-S)**       | Aéreo      | 125     | **100 mm**    | 3.541            | 57.9        | 17.1            |
| **TR4 (S-C2)**      | Aéreo      | 80      | **80 mm**     | 4.146            | 49.4        | 17.5            |
| **TR5 (S-T)**       | Aéreo      | 100     | **80 mm**     | 3.530            | 58.1        | 17.7            |
| **TR6 (T-C3)**      | Aéreo      | 50      | **80 mm**     | 5.211            | 39.3        | 17.3            |
| **TR7 (T-C4)**      | Aéreo      | 100     | **80 mm**     | 3.530            | 58.1        | 17.7            |

### 5.2. Red de retorno de condensados (~143.6 °C)

| Tramo              | Ubicación  | DN (mm) | Espesor ($e$) | $\sum R$ (m·K/W) | $q_L$ (W/m) | $T_{surf}$ (°C) |
|:-------------------|:-----------|:-------:|:--------------|:----------------:|:-----------:|:---------------:|
| **TR1 (Caldera-P)** | Aéreo      | 65      | **50 mm**     | 3.507            | 36.7        | 17.7            |
| **TR2 (P-C1)**      | **Soterrado** | 32      | **40 mm**     | 4.747            | 28.1        | N/A             |
| **TR3 (P-S)**       | Aéreo      | 65      | **50 mm**     | 3.507            | 36.7        | 17.7            |
| **TR4 (S-C2)**      | Aéreo      | 40      | **40 mm**     | 3.986            | 32.3        | 18.2            |
| **TR5 (S-T)**       | Aéreo      | 50      | **50 mm**     | 3.971            | 32.4        | 17.6            |
| **TR6 (T-C3)**      | Aéreo      | 25      | **40 mm**     | 4.980            | 25.8        | 17.9            |
| **TR7 (T-C4)**      | Aéreo      | 50      | **50 mm**     | 3.971            | 32.4        | 17.6            |

---

## 6. Criterios de estandarización por rangos DN

### 6.1. Justificación técnica: estandarización vs. optimización

Aunque matemáticamente es posible optimizar el espesor para cada tramo individual (milímetro a milímetro), la **práctica industrial estándar** (basada en guías de Isover, IDAE e ISO 12241) recomienda el uso de **"buckets" o rangos de DN**.

Esta estandarización:
- Reduce significativamente los costes logísticos
- Simplifica el inventario de materiales en obra
- Facilita el mantenimiento futuro
- Compensa con creces el ligero sobrecoste de material en algunos tramos

### 6.2. Red de vapor (220 °C)

- **DN ≥ 125:** Espesor de **100 mm**. Garantiza pérdidas < 80 W/m.
- **DN 50 - 100:** Espesor de **80 mm**.
- **DN < 50:** Espesor de **60 mm**.
- **Tramo soterrado (TR2):** Se limita el espesor a **50 mm** para cumplir con la profundidad del eje ($h_{eje} = 1.09$ m) y la geometría de la zanja.

### 6.3. Red de condensados (143.6 °C)

- **DN ≥ 50:** Espesor de **50 mm**.
- **DN < 50:** Espesor de **40 mm**.

### 6.4. Resultados de seguridad

Con estos espesores estandarizados, la temperatura superficial en todos los tramos aéreos se reduce a niveles cercanos a la temperatura ambiente ($\Delta T < 5$ °C), eliminando cualquier riesgo de quemaduras y maximizando el retorno energético a la caldera.

---

## 7. Morfología del enterramiento

Para el diseño de la canalización subterránea se ha proyectado una sección tipo de ingeniería que garantiza la integridad estructural y la eficiencia térmica. La morfología se define mediante un **sistema de capas estratificadas** referenciadas a la **Cota de Rasante (±0.00)**, siguiendo el siguiente orden descendente:

### Nivel de superficie a -0.80 m (Relleno de tierras)

Capa superior compuesta por terreno natural o zahorras seleccionadas, compactadas mecánicamente para absorber las solicitaciones dinámicas del entorno.

### Nivel -0.80 m a -0.90 m (Losa de protección mecánica)

Se dispone una **losa de hormigón armado (típicamente HA-25)** de 10 cm de espesor. Su función es actuar como:
- "Escudo mecánico" y repartidor de cargas
- Protección de la zona de arena ante presiones puntuales
- Aviso de presencia de instalaciones críticas en caso de excavaciones futuras

### Nivel -0.90 m a -1.34 m (Bloque envolvente de arena)

Zona de seguridad térmica y mecánica compuesta por **arena de río lavada** que ocupa el **ancho total de la zanja (1.50 m)**. Este material proporciona:
- Un lecho elástico que permite el libre movimiento longitudinal de las tuberías debido a las dilataciones térmicas
- Drenaje natural del agua de infiltración

#### Configuración de redes

Las tuberías se disponen en paralelo con una **separación horizontal entre ejes de 1.00 m**. El ancho de la excavación ($B = 1.50$ m) se dimensiona bajo criterios de ingeniería para garantizar un margen lateral de compactación de ≈17.2 cm a cada lado.

**Diámetros exteriores considerados:**
- **Red Vapor (DN 80):** $OD = 88.9$ mm + Aisl. 50 mm → $D_{ext} = 188.9$ mm
- **Red Condensados (DN 32):** $OD = 42.4$ mm + Aisl. 40 mm → $D_{ext} = 122.4$ mm

**Cálculo del ancho de zanja:**
$$B = 1.00 + \frac{0.1889}{2} + \frac{0.1224}{2} + 2 \times 0.1722 = 1.50 \ \text{m}$$

#### Lecho de apoyo

La base de la zanja cuenta con una **cama de 15 cm de arena nivelada** que se extiende por toda la superficie inferior de la excavación compactada.

---

## 8. Deducción de la profundidad del eje

Para justificar la profundidad de enterramiento, se deducen las dimensiones sumando las distintas capas desde la superficie hacia abajo:

### Componentes de la profundidad

1. **Relleno de tierra libre (Cobertura):** 0.80 m
2. **Tapa de hormigón:** 0.10 m (10 cm) como protección mecánica
3. **Margen sobre el aislamiento:** 0.10 m (10 cm) de aire/arena
4. **Aislamiento y tubería:**
   - Tubería DN 80 Schedule 160: $OD = 88.9$ mm → Radio $r_1 = 44.45$ mm
   - Aislamiento: 50 mm → Radio total $r_2 = 94.45$ mm ≈ 0.0945 m

### Cálculo de la profundidad del eje ($h_{eje}$)

$$h_{eje} = \text{Tierra} + \text{Hormigón} + \text{Margen} + r_2$$
$$h_{eje} = 0.80 + 0.10 + 0.10 + 0.0945 = 1.0945 \ \text{m} \approx 1.09 \ \text{m}$$

### Cálculo de la zanja total ($H$)

Añadiendo la cama inferior de arena:

$$H = h_{eje} + r_2 + \text{Cama inferior}$$
$$H = 1.0945 + 0.0945 + 0.15 = 1.339 \ \text{m} \approx 1.34 \ \text{m}$$

---

## 9. Altura de las líneas aéreas

Se recomienda que las tuberías aéreas de vapor y condensados se instalen **por debajo de la altura de las naves (20 m)**, idealmente sobre **puentes de tuberías (pipe racks)** a una altura comprendida entre **4.5 y 6 metros**.

### Justificación técnica

1. **Pendientes y purga de condensados:** Las líneas deben instalarse con pendiente descendente (≥40 mm por cada 10 m) para permitir el drenaje por gravedad. Alturas excesivas complican la purga.

2. **Accesibilidad y mantenimiento:** Instalaciones a 4.5-6 m son accesibles con plataformas elevadoras móviles estándar. A más de 20 m, el mantenimiento se vuelve complejo, costoso y peligroso.

3. **Coste y soporte estructural:** Construir estructuras de soporte a más de 20 m de altura incrementa drásticamente los costes. Requiere pilares más robustos y cimentaciones más profundas para soportar el peso y las cargas de viento.

4. **Eliminación de aire:** En el arranque, el aire es desplazado por el vapor hacia los puntos más altos del sistema. Llevar la red a más de 20 m crea "puntos altos" artificiales donde el aire tiende a acumularse, obligando a instalar eliminadores de aire automáticos en cotas de difícil acceso.

5. **Dilatación térmica:** Las líneas de vapor aéreas sufren gran dilatación térmica. Gestionarla mediante liras o compensadores es estructuralmente más estable y sencillo en pórticos a alturas moderadas (5-6 m).

### Conclusión

A menos que sea estrictamente necesario salvar la nave por encima, **la recomendación es mantener las tuberías aéreas a unos 5-6 metros de altura**. Esto garantiza una purga por gravedad eficiente, previene problemas de golpes de ariete y facilita enormemente el mantenimiento.

---

## 10. Separación vertical vapor/condensados

La **línea de vapor debe ir siempre por encima de la línea de condensados**, con una diferencia de altura recomendada de **entre 0.5 metros y 1.5 metros** entre ejes.

### Razones técnicas

1. **Purga por gravedad:** El condensado formado en la línea de vapor fluye por gravedad a través del purgador y cae hacia el colector de condensados. Si la línea de condensados estuviera al mismo nivel o por encima, el purgador tendría que elevar el líquido, generando contrapresión y riesgo de anegamiento.

2. **Espacio físico para el pozo de goteo (Drip Leg):** Para recoger el condensado antes de que entre al purgador, se debe construir un pozo de goteo apuntando hacia abajo. La profundidad mínima debe estar comprendida entre **250 mm y 700 mm**.

3. **Espacio para la estación de purga:** Debajo del pozo de goteo se extrae el condensado lateralmente hacia el purgador. Esta "estación de purga" requiere espacio físico para instalar:
   - Válvula de corte previa
   - Filtro (tipo "Y")
   - Purgador de condensados
   - Mirilla o válvula de prueba (opcional)
   - Válvula de retención (fundamental para que el condensado no retorne)
   - Válvula de corte posterior

Todo este conjunto exige ese espacio libre de **0.5 a 1 metro mínimo** por debajo de la tubería principal de vapor.

### Diseño adoptado en el proyecto

En los planos y perfiles, la línea de vapor principal se sitúa a **6 metros** de altura y la línea de retorno de condensados paralela a ella pero a **5 metros** de altura. Desde la línea de vapor a 6 m, se instalan bajantes (pozos de goteo y purgadores) cada 30-50 metros que descargan directamente por gravedad sobre la línea de condensados situada a 5 m.

---

## 11. Referencias normativas

> [!skill:doc_tecnica_vapor] Referencias técnicas de normativas y guías especializadas.

- **ISO 12241:2022:** *Thermal insulation for building equipment and industrial installations — Calculation rules.*

- **IDAE:** *Guía Técnica de Diseño y Cálculo del Aislamiento Térmico de Conducciones, Aparatos y Equipos.*

- **RITE (RD 1027/2007):** *Reglamento de Instalaciones Térmicas en los Edificios.*

- **EREN:** *Manual de Eficiencia Energética en Redes de Vapor y Condensados.* Ente Regional de la Energía de Castilla y León, 2010.

---

**Checkboxes de completitud (Plan de mejora):**
- [x] **5.1** Parámetros de diseño: $T_{vap}=220°C$, $T_{cond}=143.6°C$, $T_{amb}=15°C$, $h_{ext}=25$ W/(m²·K)
- [x] **5.2** Materiales: lana de roca $\lambda=0.04$, acero $\lambda=50$
- [x] **5.3** Criterio seguridad: $T_{surf} < 30°C$ (RITE)
- [x] **5.4** Ecuaciones de transferencia de calor: $q_L$, $R_{pipe}$, $R_{aisl}$, $R_{surf}$, $R_{terr}$, $R_{can}$
- [x] **5.5** Cálculos exhaustivos red vapor: TR1-TR7 con radios, resistencias, flujo y seguridad
- [x] **5.6** Cálculos exhaustivos red condensados: TR1-TR7
- [x] **5.7** Tabla resumen dimensionamiento red vapor (7 tramos)
- [x] **5.8** Tabla resumen dimensionamiento red condensados (7 tramos)
- [x] **5.9** Criterios de estandarización por rangos DN
- [x] **5.10** Morfología del enterramiento: capas estratificadas
- [x] **5.11** Deducción de profundidad $h_{eje}=1.09$m y geometría zanja
- [x] **5.12** Altura líneas aéreas: 4.5-6m recomendado, por debajo de naves
- [x] **5.13** Separación vertical vapor/condensados: 0.5-1.5m
- [x] **[skill: doc_tecnica_vapor]** Referencias: ISO 12241, RITE (RD 1027/2007), IDAE, EREN
- [x] **[skill: latex_drafting_skill]** Formato tablas resumen
