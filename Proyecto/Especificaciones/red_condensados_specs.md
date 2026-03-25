# Red de Retorno de Condensados

## Tabla de contenidos
- [1. Criterio de diseño: flujo bifásico](#1-criterio-de-diseño-flujo-bifásico)
- [2. Fenómeno del vapor flash](#2-fenómeno-del-vapor-flash)
- [3. Presión de la red de condensados](#3-presión-de-la-red-de-condensados)
- [4. Propiedades termofísicas](#4-propiedades-termofísicas)
- [5. Cálculo del caudal de vapor flash](#5-cálculo-del-caudal-de-vapor-flash)
- [6. Consideraciones geométricas de instalación](#6-consideraciones-geométricas-de-instalación)
- [7. Selección de tuberías: Schedule 40](#7-selección-de-tuberías-schedule-40)
- [8. Gestión y aprovechamiento del vapor flash](#8-gestión-y-aprovechamiento-del-vapor-flash)
- [9. Tablas resumen](#9-tablas-resumen)

---

## 1. Criterio de diseño: flujo bifásico

Para el dimensionamiento de la red de condensados, se ha adoptado el criterio de **velocidad recomendada para flujo bifásico** (mezcla de condensado líquido y vapor flash).

Según la literatura técnica especializada (Manual IDAE, Spirax Sarco, EREN), la **velocidad de diseño en líneas de condensados debe mantenerse entre 15 y 20 m/s**:

- **Velocidades inferiores a 15 m/s:** Indican sobredimensionamiento, lo que conlleva:
  - Mayor coste de inversión en tubería
  - Mayor superficie de intercambio térmico (mayores pérdidas térmicas)
  - Menor velocidad de retorno del condensado

- **Velocidades superiores a 20 m/s:** Elevan significativamente:
  - El riesgo de erosión mecánica en codos y accesorios
  - Los niveles de ruido
  - La probabilidad de golpes de ariete destructivos

Por tanto, el rango de 15-20 m/s representa el **equilibrio óptimo entre coste, eficiencia energética y seguridad operativa**.

---

## 2. Fenómeno del vapor flash

Cuando el condensado sale del consumidor a través del purgador, experimenta una **descompresión isotérmica** desde la presión de la red de vapor (≈9 bar(g)) hasta la presión de la red de condensados (3 bar(g)). Esta caída de presión provoca que parte del condensado se **revaporice instantáneamente**, fenómeno conocido como **vapor flash** o revaporizado.

El porcentaje de vapor flash se calcula mediante un balance entálpico:

$$\%vf = \frac{h_{lp1} - h_{lp2}}{h_{vp2} - h_{lp2}} \times 100$$

donde:
- $h_{lp1}$: Entalpía del líquido saturado a la presión de la red de vapor
- $h_{lp2}$: Entalpía del líquido saturado a la presión de la red de condensados
- $h_{vp2}$: Entalpía del vapor saturado a la presión de la red de condensados

Los subíndices 1 y 2 hacen referencia a la red de vapor y a la red de condensados, respectivamente.

### Importancia del vapor flash

Aunque el vapor flash representa un porcentaje pequeño en masa (típicamente 7-8%), **su volumen específico es enormemente mayor que el del líquido** (aproximadamente 400 veces mayor). Por tanto:

- **En masa:** ~7% de vapor, ~93% de líquido
- **En volumen:** ~98% de vapor, ~2% de líquido

Esto obliga a dimensionar la red de condensados considerando principalmente el caudal volumétrico del vapor flash, no el del líquido.

---

## 3. Presión de la red de condensados

Como criterio de diseño, se establece una **presión de la red de condensados 1 bar menor que la presión del consumidor de menor presión**. Esto garantiza que:

1. Los purgadores pueden evacuar el condensado por diferencia de presión
2. Se minimiza la contrapresión sobre los equipos consumidores
3. Se facilita el drenaje por gravedad hacia el colector principal

Dado que el consumidor de menor presión es **C1 a 4 bar(g)**, la presión de la red de condensados es:

$$P_{red \ cond} = P_{min} - 1 = 4 - 1 = 3 \ \text{bar(g)}$$

Esta presión se mantiene relativamente constante a lo largo de la red gracias al diseño conservador (pérdidas de carga moderadas).

---

## 4. Propiedades termofísicas

### 4.1. Condiciones en la red de condensados (3 bar(g))

Consultando las tablas de vapor saturado para una presión de **3 bar(g)** (4.013 bar(a)), se obtiene una temperatura de saturación de **143.732 °C**:

$$T_{sat} = 143.732 \ ^\circ\text{C} \rightarrow \begin{cases}
h_{lp2} = 605.236 \ \text{kJ/kg} \\
h_{vp2} = 2738.21 \ \text{kJ/kg} \\
v_{vapor} = 0.460957 \ \text{m}^3\text{/kg} \quad (99.97\% \ \text{en volumen}) \\
v_{agua} = 0.00108369 \ \text{m}^3\text{/kg} \quad (0.23\% \ \text{en volumen})
\end{cases}$$

Estas propiedades confirman la enorme diferencia de volumen específico entre las dos fases, lo que justifica el criterio de dimensionamiento basado en el vapor flash.

### 4.2. Condiciones en la red de vapor (9.068 bar(g))

Consultando las tablas de vapor saturado para la presión de salida de la caldera (**9.068 bar(g)**, equivalente a ~10 bar(a)), se obtiene una temperatura de saturación de **180.238 °C**:

$$T_{sat} = 180.238 \ ^\circ\text{C} \rightarrow h_{lp1} = 764.238 \ \text{kJ/kg}$$

---

## 5. Cálculo del caudal de vapor flash

### 5.1. Porcentaje de vapor flash (Tramo Caldera-P)

Sustituyendo en la fórmula del porcentaje de vapor flash:

$$\%vf = \frac{h_{lp1} - h_{lp2}}{h_{vp2} - h_{lp2}} \times 100 = \frac{764.238 - 605.236}{2738.21 - 605.236} \times 100$$

$$\%vf = \frac{159.002}{2132.974} \times 100 = 7.45\%$$

### 5.2. Caudal másico de vapor flash

El caudal de vapor flash que retorna por la red de condensados es:

$$Q_{vf} = \%vf \times Q_{cálculo} = 0.0745 \times 5400 = 402.54 \ \text{kg/h}$$

Este caudal es el que **debe recircularse al tanque de alimentación de la caldera** para aprovechar su contenido energético. En las instalaciones sin economizador, como es el caso, el aprovechamiento del vapor flash se convierte en la medida de eficiencia térmica más importante.

### 5.3. Cálculo para tramos ramificados

Los tramos correspondientes a cada ramal se calculan de la misma forma, considerando:
- El caudal másico específico del ramal
- Las condiciones de presión local (aunque la presión en la red de condensados varía poco)
- La configuración geométrica del tramo

Hay que tener en cuenta que **la altura del eje de la tubería de vapor y el eje de la tubería de condensados debe diferir entre 0.5 y 1.5 metros**. En este caso se ha optado por una diferencia de **1 metro**, que permite:
- Instalar el pozo de goteo (drip leg) de 0.5-0.7 m
- Colocar la estación de purga (válvula + filtro + purgador + retención)
- Garantizar el drenaje por gravedad hacia el colector de condensados

---

## 6. Consideraciones geométricas de instalación

### 6.1. Separación vertical entre vapor y condensados

La **línea de vapor debe ir siempre por encima de la línea de condensados**, con una diferencia de altura recomendada de **0.5 a 1.5 metros** entre ejes.

Esta disposición cumple varios objetivos críticos:

1. **Purga por gravedad:** El condensado formado en la línea de vapor fluye por gravedad a través del purgador y cae hacia el colector de condensados. Si la línea de condensados estuviera al mismo nivel o por encima, el purgador tendría que elevar el líquido, generando contrapresión, riesgo de anegamiento y graves problemas de golpes de ariete.

2. **Espacio para el pozo de goteo:** Para recoger el condensado antes de que entre al purgador, se debe construir un pozo de goteo (drip leg) apuntando hacia abajo. La profundidad mínima recomendada está comprendida entre **250 mm y 700 mm** (Manual del Vapor, Cap. 7).

3. **Espacio para la estación de purga:** Debajo del pozo de goteo se instala lateralmente el conjunto de purga:
   - Válvula de corte previa
   - Filtro tipo Y
   - Purgador de condensados
   - Mirilla o válvula de prueba (opcional)
   - Válvula de retención (fundamental para evitar retorno)
   - Válvula de corte posterior

Todo este conjunto requiere el espacio libre vertical de 0.5-1 metro mínimo por debajo de la tubería principal de vapor.

**Disposición adoptada en el proyecto:**
- Línea de vapor a **6 metros** de altura
- Línea de retorno de condensados a **5 metros** de altura
- Diferencia vertical: **1 metro**

### 6.2. Altura de las líneas aéreas

Las tuberías aéreas de vapor y condensados se han diseñado para instalarse **por debajo de la altura de las naves (20 m)**, sobre **puentes de tuberías (pipe racks)** a una altura comprendida entre **4.5 y 6 metros**.

Esta decisión se justifica por:

1. **Pendientes y purga:** Las líneas deben instalarse con pendiente descendente (≥40 mm por cada 10 m) para permitir el drenaje por gravedad. Alturas excesivas complican enormemente la purga.

2. **Accesibilidad y mantenimiento:** Instalaciones a 4.5-6 m son accesibles con plataformas elevadoras móviles estándar. A más de 20 m, el mantenimiento se vuelve complejo, costoso y peligroso.

3. **Coste estructural:** Soportes a gran altura incrementan drásticamente los costes de pilares y cimentaciones.

4. **Eliminación de aire:** Llevar la red a más de 20 m crea "puntos altos" artificiales donde el aire tiende a acumularse, obligando a instalar eliminadores de aire automáticos en cotas de difícil acceso.

5. **Dilatación térmica:** Gestionar la dilatación mediante liras o compensadores es estructuralmente más estable y sencillo en pórticos a alturas moderadas.

---

## 7. Selección de tuberías: Schedule 40

Para la línea de condensados se ha optado por **tuberías Schedule 40** en lugar de seguir la metodología de selección por norma DIN 2448 utilizada en la red de vapor.

### Justificación técnica

1. **Presión de operación:** La red de condensados opera a una presión relativamente baja (3 bar(g)), dentro del rango estándar de aplicación del Schedule 40.

2. **Estándar industrial:** El Schedule 40 es el **estándar para presiones industriales bajas** ($P_{caldera} \leq 10$ bar(a)), ampliamente utilizado en instalaciones de vapor de pequeño y mediano tamaño.

3. **Resistencia a la corrosión:** El **mayor espesor de pared del Schedule 40** (respecto a alternativas ligeras) compensa la erosión provocada por:
   - El flujo bifásico (mezcla líquido-vapor)
   - La corrosión por ácido carbónico (CO₂ disuelto en el condensado)
   - El desgaste por arrastre de partículas

4. **Disponibilidad comercial:** Mayor disponibilidad de accesorios, válvulas y conexiones en Schedule 40 para diámetros pequeños (DN 25 a DN 65).

5. **Recomendación técnica:** Según las guías de Spirax Sarco y el Manual EREN, el Schedule 40 (o superior) es la especificación recomendada para redes de retorno de condensados en este rango de presiones.

---

## 8. Gestión y aprovechamiento del vapor flash

### 8.1. Problemática del flujo bifásico

Si el vapor flash no se separa del condensado líquido, la red de retorno opera en régimen de **flujo bifásico continuo**. Esto presenta severas desventajas técnicas y económicas:

- **Sobredimensionamiento de líneas:** Aunque el vapor flash representa ~7% en masa, su enorme volumen específico obliga a incrementar drásticamente los diámetros nominales de las tuberías. El Manual de Redes de Vapor (págs. 66-67) ilustra cómo la separación del flash puede **reducir el diámetro necesario de 41 mm a tan solo 19 mm**.

- **Velocidades límite e inestabilidad:** En flujo bifásico, las velocidades deben limitarse estrictamente a 15-20 m/s para prevenir erosión mecánica y golpes de ariete destructivos.

### 8.2. Recomendación: Separación del vapor flash

La directriz de ingeniería es **separar el vapor flash del condensado líquido** instalando un **tanque separador o revaporizador (Flash Vessel)** a la salida de las estaciones de purga principales.

La separación física de ambas fases permite:

1. **Reducción del diámetro del colector de retorno:** Al vehicular únicamente agua en fase líquida por la tubería principal hacia la sala de calderas, el área de paso necesaria se minimiza, reduciendo exponencialmente los costes de instalación (tubería, soportación y aislamientos térmicos).

2. **Mitigación de riesgos mecánicos:** Se estabiliza el flujo, eliminando la principal causa de golpes de ariete por arrastre de bolsas de líquido a altas velocidades.

### 8.3. Estrategia de eficiencia energética

Es imperativo aclarar que la **"eliminación" del vapor flash del colector principal NO implica su purga a la atmósfera** (lo cual sería una ineficiencia inaceptable).

La normativa de diseño estipula que *"hoy en día no se concibe una red de condensados de una instalación medianamente grande sin aprovechamiento de vapor flash"* (Manual EREN, Cap. 5, Sec. 1.1, pág. 91).

En escenarios donde el generador de vapor **carece de economizador** (como es nuestro caso), la recuperación entálpica del vapor flash se erige como la **medida de eficiencia térmica más relevante** del sistema.

### 8.4. Estrategias de reutilización

Las estrategias técnicas de aprovechamiento incluyen:

#### 8.4.1. Precalentamiento del tanque de alimentación (Recomendación Principal)

El vapor flash separado en el tanque revaporizador se **inyecta directamente en el tanque de almacenamiento de agua de alimentación de la caldera**. La condensación transfiere todo su calor latente al agua de aporte, incrementando su temperatura.

**Beneficios:**
- Reduce el salto entálpico que el quemador de la caldera debe suplir
- Compensa en gran medida el déficit térmico provocado por la ausencia del economizador
- Mejora la eficiencia global del ciclo térmico

#### 8.4.2. Alimentación de consumidores de baja presión

El revaporizado puede ser canalizado para alimentar equipos secundarios que operen a la presión del tanque flash (o inferior, mediante estaciones reductoras), proporcionando energía térmica "gratuita" a procesos auxiliares como:
- Baterías de calentamiento de aire
- Precalentamiento de fluidos de proceso
- Calefacción de naves o servicios

### 8.5. Conclusión del diseño

El diseño termohidráulico riguroso exige la instalación de **tanques separadores de flash**:

- Por su **parte inferior** se evacúa el condensado en fase puramente líquida (optimizando la inversión en la línea de retorno)
- Por la **parte superior** se capta y reutiliza el **100% del vapor flash** generado para el precalentamiento del agua de alimentación, maximizando la eficiencia energética global del ciclo

---

## 9. Tablas resumen

> [!skill:latex_drafting_skill] Formato tablas resumen en orientación A4 horizontal para mejor legibilidad.

### 9.1. Tabla de cálculos de diámetros y presiones por tramo

| Línea de condensados | $L_{real}$ (m) | $D_{tanteo}$ (mm) | $L_{eq}$ (m) | $L_{cálculo}$ (m) | Tamaño tubería (mm) | $P_{entrada}$ [bar(g)] | $P_{salida}$ [bar(g)] |
|:---------------------|---------------:|------------------:|-------------:|------------------:|--------------------:|-----------------------:|----------------------:|
| Caldera-P            | 12.74          | N/A               | 2.548        | 15.3              | 65                  | 3.00                   | 2.98                  |
| P-C1                 | 88.2           | 30                | 4.62         | 92.81             | 32                  | 2.98                   | 2.73                  |
| P-S                  | 105            | 60                | 12.72        | 117.72            | 65                  | 2.73                   | 2.59                  |
| S-C2                 | 24             | 45                | 5.49         | 29.5              | 50                  | 2.59                   | 2.54                  |
| S-T                  | 60             | 50                | 7.5          | 67.5              | 65                  | 2.59                   | 2.51                  |
| T-C3                 | 14             | N/A               | 2.8          | 16.8              | 25                  | 2.51                   | 2.46                  |
| T-C4                 | 44             | 50                | 6.2          | 50.2              | 50                  | 2.51                   | 2.45                  |

**Nota:** Tuberías Schedule 40. Los tramos con $D_{tanteo}$ = N/A utilizan un 20% de $L_{real}$ como $L_{eq}$.

### 9.2. Tabla de verificación de velocidades, diámetros interiores y caídas de presión

| Línea de condensados | $D_{interior}$ (mm) | $v$ (m/s) | $\Delta P$ (bar) |
|:---------------------|--------------------:|----------:|-----------------:|
| Caldera-P            | 58                  | 19.31     | 0.02             |
| P-C1                 | 28                  | 17.78     | 0.25             |
| P-S                  | 58                  | 19.13     | 0.14             |
| S-C2                 | 39                  | 18.04     | 0.05             |
| S-T                  | 50                  | 17.70     | 0.08             |
| T-C3                 | 24                  | 17.96     | 0.05             |
| T-C4                 | 48                  | 17.41     | 0.06             |

**Observaciones:**
- Todas las velocidades se encuentran dentro del rango recomendado de 15-20 m/s para flujo bifásico.
- La pérdida de carga máxima acumulada es de 0.55 bar (tramo P-C1), que no compromete el funcionamiento de los purgadores.
- Los diámetros interiores son menores que los de la red de vapor, lo cual es coherente con el menor caudal másico de retorno.

---

> **Figuras:** Los croquis de tramos y las hojas de cálculo detalladas se encuentran en:  
> - `../../Practica_Vapor_LaTeX/Figuras/dibujos_tramos/`  
> - `../../Practica_Vapor_LaTeX/Figuras/calculos_tramos/`

---

**Checkboxes de completitud (Plan de mejora):**
- [x] **4.1** Criterio de diseño: flujo bifásico, velocidad 15-20 m/s
- [x] **4.2** Fórmula vapor flash: $\%vf = \frac{h_{lp1} - h_{lp2}}{h_{vp2} - h_{lp2}} \times 100$
- [x] **4.3** Presión de la red: $P_{red \ cond} = P_{min} - 1$ bar = 3 bar(g)
- [x] **4.4** Propiedades termofísicas a $T_{sat}=143.7°C$ y a $T_{sat}=180.2°C$
- [x] **4.5** Caudal de vapor flash: $Q_{vf} = vf \times Q_{cálculo} = 402.54$ kg/h
- [x] **4.6** Nota sobre separación vapor/condensados (diferencia altura 0.5-1.5m)
- [x] **4.7** Justificación Schedule 40 vs DIN2448 para condensados
- [x] **4.8** Gestión y aprovechamiento del vapor flash
- [x] **4.9** Tabla: cálculos de diámetros y presiones por tramo
- [x] **4.10** Tabla: verificación de velocidades e interiores
- [x] **[skill: latex_drafting_skill]** Formato tablas resumen en A4 horizontal
