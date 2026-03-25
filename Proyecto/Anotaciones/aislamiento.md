# Estudio Técnico de Aislamiento Térmico (Red Completa)

Este documento establece el dimensionamiento detallado del aislamiento para cada tramo de la instalación, diferenciando por diámetros, temperatura de operación y ubicación (aéreo/soterrado), optimizando el espesor para reducir costes manteniendo la seguridad técnica.

## 1. Parámetros de Diseño y Metodología

*   **Temperaturas de Operación:**
    *   **Vapor ($T_{vap}$):** $220 \text{ °C}$
    *   **Condensados ($T_{cond}$):** $143.6 \text{ °C}$ (Saturación a 3 barg)
*   **Condiciones Ambientales:**
    *   **Aire Exterior:** $T_{amb} = 15 \text{ °C}$, $h_{ext} = 25 \text{ W/(m}^2\cdot\text{K)}$
    *   **Terreno:** $T_{terr} = 10 \text{ °C}$, $\lambda_{terr} = 1.2 \text{ W/(m}\cdot\text{K)}$, Profundidad $h_{eje} = 1.09 \text{ m}$
*   **Materiales:**
    *   **Aislamiento:** Lana de Roca ($\lambda_{aisl} = 0.04 \text{ W/(m}\cdot\text{K)}$)
    *   **Tubería:** Acero Carbono ($\lambda_{acero} = 50 \text{ W/(m}\cdot\text{K)}$)
*   **Criterio de Seguridad:** $T_{surf} < 30 \text{ °C}$ (RITE)

### 1.1. Ecuaciones de Transferencia de Calor

La pérdida de calor lineal ($q_L$, en W/m) se define como:
$$q_L = \frac{\Delta T}{\sum R}$$

Donde la resistencia térmica total $\sum R$ incluye:
1.  **Resistencia de la Tubería ($R_{pipe}$):** $$R_{pipe} = \frac{\ln(r_1 / r_{int})}{2 \pi \lambda_{acero}}$$
2.  **Resistencia del Aislamiento ($R_{aisl}$):** $$R_{aisl} = \frac{\ln(r_2 / r_1)}{2 \pi \lambda_{aisl}}$$
3.  **Resistencia Exterior:**
    *   **Aéreo ($R_{surf}$):** $$R_{surf} = \frac{1}{\pi d_e h_{ext}}$$
    *   **Soterrado ($R_{terr}$):** $$R_{terr} = \frac{\ln(2 \cdot h_{eje} / r_2)}{2\pi \cdot \lambda_{terr}}$$
4.  **Resistencia de Canalización/Arena ($R_{can}$):** $\approx 0.05 \text{ m}\cdot\text{K/W}$ (solo para tramos soterrados).

---

## 2. Cálculos Exhaustivos: Red de Distribución de Vapor (220 ºC)

### TR1 (Caldera-P) - DN 150 (Aéreo)
*   **Radios:** $r_{int} = 73.2 \text{ mm}$, $r_1 = 84.15 \text{ mm}$ (Sch 80), $e = 100 \text{ mm} \rightarrow r_2 = 184.15 \text{ mm}$
*   **Resistencias:**
    *   $R_{pipe} = \ln(84.15 / 73.2) / (2 \pi \cdot 50) = \mathbf{0.0004 \text{ mK/W}}$
    *   $R_{aisl} = \ln(184.15 / 84.15) / (2 \pi \cdot 0.04) = \mathbf{3.115 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.3683 \cdot 25) = \mathbf{0.035 \text{ mK/W}}$
*   **Flujo y Seguridad:**
    *   $R_{tot} = 0.0004 + 3.115 + 0.035 = \mathbf{3.150 \text{ mK/W}}$
    *   $q_L = (220 - 15) / 3.150 = \mathbf{65.1 \text{ W/m}}$
    *   $T_{surf} = 15 + 65.1 \cdot 0.035 = \mathbf{17.3 \text{ ºC}}$

### TR2 (P-C1) - DN 80 (Soterrado)
*   **Radios:** $r_{int} = 33.3 \text{ mm}$, $r_1 = 44.45 \text{ mm}$ (Sch 160), $e = 50 \text{ mm} \rightarrow r_2 = 94.45 \text{ mm}$
*   **Resistencias:**
    *   $R_{pipe} = \ln(44.45 / 33.3) / (2 \pi \cdot 50) = \mathbf{0.0009 \text{ mK/W}}$
    *   $R_{aisl} = \ln(94.45 / 44.45) / (2 \pi \cdot 0.04) = \mathbf{2.999 \text{ mK/W}}$
    *   $R_{can} = \mathbf{0.050 \text{ mK/W}}$
    *   $R_{terr} = \ln(2 \cdot 1.0945 / 0.09445) / (2 \pi \cdot 1.2) = \mathbf{0.417 \text{ mK/W}}$
*   **Flujo:**
    *   $R_{tot} = 0.0009 + 2.999 + 0.050 + 0.417 = \mathbf{3.467 \text{ mK/W}}$
    *   $q_L = (220 - 10) / 3.467 = \mathbf{60.59 \text{ W/m}}$

### TR3 (P-S) - DN 125 (Aéreo)
*   **Radios:** $r_{int} = 65.85 \text{ mm}$, $r_1 = 70.65 \text{ mm}$ (Sch 20), $e = 100 \text{ mm} \rightarrow r_2 = 170.65 \text{ mm}$
*   **Resistencias:**
    *   $R_{pipe} = \ln(70.65 / 65.85) / (314.16) = \mathbf{0.0002 \text{ mK/W}}$
    *   $R_{aisl} = \ln(170.65 / 70.65) / (0.2513) = \mathbf{3.504 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.3413 \cdot 25) = \mathbf{0.037 \text{ mK/W}}$
*   **Flujo y Seguridad:**
    *   $R_{tot} = 3.541 \text{ mK/W} \rightarrow q_L = (205) / 3.541 = \mathbf{57.9 \text{ W/m}}$
    *   $T_{surf} = 15 + 57.9 \cdot 0.037 = \mathbf{17.1 \text{ ºC}}$

### TR4 (S-C2) - DN 80 (Aéreo)
*   **Radios:** $r_{int} = 41.25 \text{ mm}$, $r_1 = 44.45 \text{ mm}$ (Sch 10), $e = 80 \text{ mm} \rightarrow r_2 = 124.45 \text{ mm}$
*   **Resistencias:** 
    *   $R_{pipe} = \ln(44.45/41.25) / 314 = \mathbf{0.0002 \text{ mK/W}}$
    *   $R_{aisl} = \ln(124.45/44.45) / 0.251 = \mathbf{4.095 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.2489 \cdot 25) = \mathbf{0.051 \text{ mK/W}}$
*   **Flujo y Seguridad:** 
    *   $R_{tot} = \mathbf{4.146 \text{ mK/W}}$
    *   $q_L = 205 / 4.146 = \mathbf{49.4 \text{ W/m}}$
    *   $T_{surf} = 15 + 49.4 \cdot 0.051 = \mathbf{17.5 \text{ ºC}}$

### TR5 (S-T) - DN 100 (Aéreo)
*   **Radios:** $r_{int} = 53.55 \text{ mm}$, $r_1 = 57.15 \text{ mm}$ (Sch 10), $e = 80 \text{ mm} \rightarrow r_2 = 137.15 \text{ mm}$
*   **Resistencias:** 
    *   $R_{pipe} = \ln(57.15/53.55) / 314 = \mathbf{0.0002 \text{ mK/W}}$
    *   $R_{aisl} = \ln(137.15/57.15) / 0.251 = \mathbf{3.484 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.2743 \cdot 25) = \mathbf{0.046 \text{ mK/W}}$
*   **Flujo y Seguridad:** 
    *   $R_{tot} = \mathbf{3.530 \text{ mK/W}}$
    *   $q_L = 205 / 3.530 = \mathbf{58.1 \text{ W/m}}$
    *   $T_{surf} = 15 + 58.1 \cdot 0.046 = \mathbf{17.7 \text{ ºC}}$

### TR6 (T-C3) - DN 50 (Aéreo)
*   **Radios:** $r_{int} = 26.25 \text{ mm}$, $r_1 = 30.15 \text{ mm}$ (Sch 40), $e = 80 \text{ mm} \rightarrow r_2 = 110.15 \text{ mm}$
*   **Resistencias:** 
    *   $R_{pipe} = \ln(30.15/26.25) / 314 = \mathbf{0.0004 \text{ mK/W}}$
    *   $R_{aisl} = \ln(110.15/30.15) / 0.251 = \mathbf{5.153 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.2203 \cdot 25) = \mathbf{0.058 \text{ mK/W}}$
*   **Flujo y Seguridad:** 
    *   $R_{tot} = \mathbf{5.211 \text{ mK/W}}$
    *   $q_L = 205 / 5.211 = \mathbf{39.3 \text{ W/m}}$
    *   $T_{surf} = 15 + 39.3 \cdot 0.058 = \mathbf{17.3 \text{ ºC}}$

### TR7 (T-C4) - DN 100 (Aéreo)
*   **Radios:** $r_{int} = 51.15 \text{ mm}$, $r_1 = 57.15 \text{ mm}$ (Sch 40), $e = 80 \text{ mm} \rightarrow r_2 = 137.15 \text{ mm}$
*   **Resistencias:** 
    *   $R_{pipe} = \ln(57.15/51.15) / 314 = \mathbf{0.0004 \text{ mK/W}}$
    *   $R_{aisl} = \mathbf{3.484 \text{ mK/W}}$
    *   $R_{surf} = \mathbf{0.046 \text{ mK/W}}$
*   **Flujo y Seguridad:** 
    *   $R_{tot} = \mathbf{3.530 \text{ mK/W}}$
    *   $q_L = 205 / 3.530 = \mathbf{58.1 \text{ W/m}}$
    *   $T_{surf} = \mathbf{17.7 \text{ ºC}}$

---

## 3. Cálculos Exhaustivos: Red de Retorno de Condensados (~143.6 ºC)

### TR1 (Caldera-P) - DN 65 (Aéreo)
*   **Radios:** $r_{int} = 29.0 \text{ mm}$, $r_1 = 36.5 \text{ mm}$ (Sch 80), $e = 50 \text{ mm} \rightarrow r_2 = 86.5 \text{ mm}$
*   **Resistencias:** $R_{aisl} = \ln(86.5/36.5)/0.251 = \mathbf{3.433 \text{ mK/W}}$, $R_{surf} = 1/(\pi \cdot 0.173 \cdot 25) = \mathbf{0.074 \text{ mK/W}}$
*   **Flujo y Seguridad:** $q_L = (143.6 - 15) / 3.507 = \mathbf{36.7 \text{ W/m}}$, $T_{surf} = 15 + 36.7 \cdot 0.074 = \mathbf{17.7 \text{ ºC}}$

### TR2 (P-C1) - DN 32 (Soterrado)
*   **Radios:** $r_{int} = 14.0 \text{ mm}$, $r_1 = 21.2 \text{ mm}$ (Sch 160), $e = 40 \text{ mm} \rightarrow r_2 = 61.2 \text{ mm}$
*   **Resistencias:** $R_{aisl} = \ln(61.2/21.2)/0.251 = \mathbf{4.223 \text{ mK/W}}$, $R_{can} = 0.050$, $R_{terr} = \ln(2.18/0.0612)/(2\pi \cdot 1.2) = \mathbf{0.474}$
*   **Flujo:** $q_L = (143.6 - 10) / 4.747 = \mathbf{28.1 \text{ W/m}}$

### TR3 (P-S) - DN 65 (Aéreo)
*   **Radios:** $r_{int} = 29.0 \text{ mm}$, $r_1 = 36.5 \text{ mm}$, $e = 50 \text{ mm} \rightarrow r_2 = 86.5 \text{ mm}$
*   **Resistencias:** $R_{aisl} = \mathbf{3.433 \text{ mK/W}}$, $R_{surf} = \mathbf{0.074 \text{ mK/W}}$
*   **Flujo y Seguridad:** $q_L = (128.6) / 3.507 = \mathbf{36.7 \text{ W/m}}$, $T_{surf} = \mathbf{17.7 \text{ ºC}}$

### TR4 (S-C2) - DN 40 (Aéreo)
*   **Radios:** $r_{int} = 19.5 \text{ mm}$, $r_1 = 24.15 \text{ mm}$, $e = 40 \text{ mm} \rightarrow r_2 = 64.15 \text{ mm}$
*   **Resistencias:** $R_{aisl} = \ln(64.15/24.15)/0.251 = \mathbf{3.886 \text{ mK/W}}$, $R_{surf} = 1/(\pi \cdot 0.1283 \cdot 25) = \mathbf{0.099 \text{ mK/W}}$
*   **Flujo:** $q_L = 128.6 / 3.986 = \mathbf{32.3 \text{ W/m}}$, $T_{surf} = \mathbf{18.2 \text{ ºC}}$

### TR5 (S-T) - DN 50 (Aéreo)
*   **Radios:** $r_{int} = 24.6 \text{ mm}$, $r_1 = 30.15 \text{ mm}$ (Sch 80), $e = 50 \text{ mm} \rightarrow r_2 = 80.15 \text{ mm}$
*   **Resistencias:** 
    *   $R_{pipe} = \ln(30.15/24.6) / 314 = \mathbf{0.0006 \text{ mK/W}}$
    *   $R_{aisl} = \ln(80.15/30.15) / 0.251 = \mathbf{3.891 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.1603 \cdot 25) = \mathbf{0.079 \text{ mK/W}}$
*   **Flujo y Seguridad:** 
    *   $R_{tot} = \mathbf{3.971 \text{ mK/W}}$
    *   $q_L = 128.6 / 3.971 = \mathbf{32.4 \text{ W/m}}$
    *   $T_{surf} = 15 + 32.4 \cdot 0.079 = \mathbf{17.6 \text{ ºC}}$

### TR6 (T-C3) - DN 25 (Aéreo)
*   **Radios:** $r_{int} = 12.1 \text{ mm}$, $r_1 = 16.7 \text{ mm}$ (Sch 80), $e = 40 \text{ mm} \rightarrow r_2 = 56.7 \text{ mm}$
*   **Resistencias:** 
    *   $R_{aisl} = \ln(56.7/16.7) / 0.251 = \mathbf{4.868 \text{ mK/W}}$
    *   $R_{surf} = 1 / (\pi \cdot 0.1134 \cdot 25) = \mathbf{0.112 \text{ mK/W}}$
*   **Flujo y Seguridad:** 
    *   $R_{tot} = \mathbf{4.980 \text{ mK/W}}$
    *   $q_L = 128.6 / 4.980 = \mathbf{25.8 \text{ W/m}}$
    *   $T_{surf} = 15 + 25.8 \cdot 0.112 = \mathbf{17.9 \text{ ºC}}$

### TR7 (T-C4) - DN 50 (Aéreo)
*   **Radios:** $r_{int} = 24.6 \text{ mm}$, $r_1 = 30.15 \text{ mm}$, $e = 50 \text{ mm} \rightarrow r_2 = 80.15 \text{ mm}$
*   **Resistencias:** $R_{aisl} = \mathbf{3.891 \text{ mK/W}}$, $R_{surf} = \mathbf{0.079 \text{ mK/W}}$
*   **Flujo y Seguridad:** $q_L = \mathbf{32.4 \text{ W/m}}$, $T_{surf} = \mathbf{17.6 \text{ ºC}}$

---

## 4. Tablas Resumen de Dimensionamiento

### Red de Distribución de Vapor (220 ºC)

| Tramo | Ubicación | DN (mm) | Espesor ($e$) | $\sum R$ (mK/W) | $q_L$ (W/m) | $T_{surf}$ (ºC) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TR1 (Caldera-P)** | Aéreo | 150 | **100 mm** | 3.150 | 65.1 | 17.3 |
| **TR2 (P-C1)** | **Soterrado** | 80 | **50 mm** | 3.467 | 60.6 | N/A |
| **TR3 (P-S)** | Aéreo | 125 | **100 mm** | 3.541 | 57.9 | 17.1 |
| **TR4 (S-C2)** | Aéreo | 80 | **80 mm** | 4.146 | 49.4 | 17.5 |
| **TR5 (S-T)** | Aéreo | 100 | **80 mm** | 3.530 | 58.1 | 17.7 |
| **TR6 (T-C3)** | Aéreo | 50 | **80 mm** | 5.211 | 39.3 | 17.3 |
| **TR7 (T-C4)** | Aéreo | 100 | **80 mm** | 3.530 | 58.1 | 17.7 |

### Red de Retorno de Condensados (~143.6 ºC)

| Tramo | Ubicación | DN (Aprox) | Espesor ($e$) | $\sum R$ (mK/W) | $q_L$ (W/m) | $T_{surf}$ (ºC) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **TR1 (Caldera-P)** | Aéreo | 65 | **50 mm** | 3.507 | 36.7 | 17.7 |
| **TR2 (P-C1)** | **Soterrado** | 32 | **40 mm** | 4.747 | 28.1 | N/A |
| **TR3 (P-S)** | Aéreo | 65 | **50 mm** | 3.507 | 36.7 | 17.7 |
| **TR4 (S-C2)** | Aéreo | 40 | **40 mm** | 3.986 | 32.3 | 18.2 |
| **TR5 (S-T)** | Aéreo | 50 | **50 mm** | 3.971 | 32.4 | 17.6 |
| **TR6 (T-C3)** | Aéreo | 25 | **40 mm** | 4.980 | 25.8 | 17.9 |
| **TR7 (T-C4)** | Aéreo | 50 | **50 mm** | 3.971 | 32.4 | 17.6 |

---

## 5. Criterios de Selección y Conclusiones

Se establece un criterio de aislamiento basado en el diámetro nominal (DN) y el tipo de red, priorizando la **eficiencia energética industrial** y el cumplimiento del **Procedimiento Alternativo del RITE** para temperaturas superiores a 180 °C.

### Justificación Técnica: Estandarización vs. Optimización
Aunque matemáticamente es posible optimizar el espesor para cada tramo individual (milímetro a milímetro), la práctica industrial estándar (basada en guías de **Isover, IDAE e ISO 12241**) recomienda el uso de **"Buckets" o rangos de DN**. Esta estandarización reduce significativamente los costes logísticos, simplifica el inventario de materiales en obra y facilita el mantenimiento futuro, compensando con creces el ligero sobrecoste de material en algunos tramos.

### Red de Vapor (220 ºC)
*   **DN $\geq$ 125:** Espesor de **100 mm**. (Garantiza pérdidas < 80 W/m).
*   **DN 50 - 100:** Espesor de **80 mm**.
*   **DN $<$ 50:** Espesor de **60 mm**.
*   **Tramo Soterrado (TR2):** Se limita el espesor a **50 mm** para cumplir con la profundidad del eje ($h_{eje} = 1.09$ m) y la geometría de la zanja calculada en `@Anotaciones/enterramiento.md`.

### Red de Condensados (143.6 ºC)
*   **DN $\geq$ 50:** Espesor de **50 mm**.
*   **DN $<$ 50:** Espesor de **40 mm**.

**Resultados de Seguridad:** Con estos nuevos espesores, la temperatura superficial en todos los tramos aéreos se reduce a niveles cercanos a la temperatura ambiente ($\Delta T < 5$ ºC), eliminando cualquier riesgo de quemaduras y maximizando el retorno energético a la caldera.

## Bibliografía
- **ISO 12241:2022:** Thermal insulation for building equipment and industrial installations — Calculation rules.
- **IDAE:** Guía Técnica de Diseño y Cálculo del Aislamiento Térmico de Conducciones, Aparatos y Equipos.
- **RITE (RD 1027/2007):** Reglamento de Instalaciones Térmicas en los Edificios.
- **EREN:** Manual de Eficiencia Energética en Redes de Vapor y Condensados.
