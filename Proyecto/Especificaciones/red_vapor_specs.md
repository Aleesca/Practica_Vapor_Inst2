# Red de Distribución de Vapor

## Tabla de contenidos
- [1. Criterio de diseño](#1-criterio-de-diseño)
- [2. Metodología de cálculo](#2-metodología-de-cálculo)
- [3. Longitud de cálculo](#3-longitud-de-cálculo)
- [4. Propiedades del vapor (Tramo Caldera-P)](#4-propiedades-del-vapor-tramo-caldera-p)
- [5. Selección de tuberías y accesorios](#5-selección-de-tuberías-y-accesorios)
- [6. Desarrollo por tramos](#6-desarrollo-por-tramos)
- [7. Tablas resumen](#7-tablas-resumen)

---

## 1. Criterio de diseño

Para el dimensionado de los distintos tramos de la red de vapor se ha adoptado como **criterio de diseño una velocidad de circulación del orden de 20 m/s**. Este valor permite compatibilizar un diámetro de tubería económicamente razonable con pérdidas de carga moderadas y un funcionamiento hidráulico adecuado de la instalación.

La selección del diámetro comercial de cada tramo se ha realizado de forma **iterativa mediante hoja de cálculo**, verificando en cada caso la velocidad resultante y la caída de presión correspondiente.

---

## 2. Metodología de cálculo

A partir del criterio de velocidad objetivo (≈ 20 m/s), la metodología seguida es:

1. **Identificación volumétrica:** Consultar las tablas termodinámicas para obtener el volumen específico ($v$ en m³/kg) según la presión y temperatura del vapor.

2. **Caudal volumétrico:** Calcular $\dot{V} = \dot{m} \times v$ para cada tramo según el caudal másico correspondiente.

3. **Estimación del diámetro:** A partir de la velocidad objetivo, calcular el área de paso requerida $A = \dot{V} / v_{objetivo}$ y obtener el diámetro teórico.

4. **Selección comercial:** Elegir el diámetro comercial (DIN 2448 o Schedule 40/80) inmediatamente superior al calculado.

5. **Longitud equivalente:** Para los tramos de mayor desarrollo, calcular la longitud equivalente de los accesorios (codos, T) utilizando el diámetro de tanteo y las relaciones $L_e/D$ de las tablas técnicas.

6. **Verificación hidráulica:** Con el diámetro comercial seleccionado, verificar:
   - La velocidad real de circulación
   - La pérdida de presión mediante ecuaciones de Darcy-Weisbach
   - Las presiones de entrada y salida del tramo

7. **Iteración:** Si la velocidad o la pérdida de carga no son aceptables, ajustar el diámetro y repetir el cálculo.

En los tramos de menor longitud, debido a su reducida influencia sobre la pérdida de carga global de la red, la estimación de pérdidas se ha realizado mediante **cálculo automático en la hoja de dimensionado**. En cambio, en los tramos de mayor desarrollo se ha considerado de forma explícita la influencia de los accesorios.

---

## 3. Longitud de cálculo

La longitud de cálculo de cada tramo se ha determinado mediante la expresión:

$$L_{cálculo} = L_{real} + L_{eq}$$

donde:
- $L_{real}$ es la longitud geométrica del tramo (medida sobre el plano)
- $L_{eq}$ es la longitud equivalente asociada a las pérdidas singulares (codos, derivaciones en T, reducciones, etc.)

La longitud equivalente se obtiene a partir del número y tipo de accesorios presentes en cada línea, utilizando la tabla de equivalencias en forma $L_e/D$ incorporada al procedimiento de cálculo. Para los accesorios considerados:

- **Codo de radio mediano (90°):** $L_e/D = 26$
- **T (paso recto):** $L_e/D = 60$
- **T (derivación):** $L_e/D = 90$

Una vez establecida la longitud de cálculo, se procede a seleccionar la tubería comercial más adecuada para cada tramo, comprobando posteriormente el diámetro interior real, la velocidad de circulación y la pérdida de presión.

Las presiones de entrada y salida en cada línea se determinan **acumulando las caídas de presión** a lo largo de la red, lo que permite verificar que todos los consumidores disponen de presión suficiente para su correcto funcionamiento.

---

## 4. Propiedades del vapor (Tramo Caldera-P)

Para el primer tramo (Caldera-P), las propiedades termofísicas del vapor se obtienen de las tablas de vapor sobrecalentado a **10 bar(a) y 220 °C**:

- **Entalpía específica:** $h_v = 2874 \ \text{kJ/kg}$
- **Calor específico:** $c_e = 2.08 \ \text{kJ/(kg·K)}$
- **Densidad relativa (respecto al agua):** $\rho_{relativa} = 0.00485$ (aproximadamente)
- **Densidad absoluta:** $\gamma = 4.85 \ \text{kg/m}^3$
- **Viscosidad dinámica:** $\mu = 1.74 \times 10^{-5} \ \text{Pa·s}$
- **Viscosidad cinemática:** $\vartheta = \mu / \gamma = 3.59 \times 10^{-6} \ \text{m}^2\text{/s}$

Estas propiedades se utilizan en el cálculo del número de Reynolds, el factor de fricción de Darcy y las pérdidas de carga en el primer tramo. Para los tramos posteriores, las propiedades se recalculan en función de la presión local, aunque las variaciones suelen ser pequeñas dado el moderado nivel de pérdida de carga de la red.

---

## 5. Selección de tuberías y accesorios

### 5.1. Tuberías

Para esta instalación se han seleccionado tuberías según dos especificaciones:

- **DIN 2448:** Norma europea para tuberías de acero sin soldadura. Se utiliza para diámetros grandes y medios (DN 80 a DN 150).
- **Schedule 40 / 80 / 160:** Clasificación API (American Petroleum Institute) utilizada principalmente en aplicaciones industriales. Se emplea para diámetros pequeños y para tramos que requieren mayor espesor de pared.

#### Justificación de la selección

La elección entre DIN 2448 y Schedule depende de varios factores:

1. **Schedule 40 (Standard Weight):** Estándar para vapor saturado a presiones industriales medias. Para la presión de 10 bar(g), el Schedule 40 proporciona un factor de seguridad estructural amplio y maximiza el área de paso, manteniendo la velocidad del vapor dentro de los límites recomendados.

2. **Schedule 80 (Extra Strong):** Pared reforzada, utilizada en:
   - Diámetros pequeños (DN ≤ 50 mm) para aumentar la resistencia mecánica ante vibraciones
   - Uniones roscadas donde el tallado debilita la pared
   - Tramos de alta velocidad o donde se requiere mayor robustez

3. **Schedule 160:** Pared muy reforzada, empleada en aplicaciones críticas o cuando el espesor adicional compensa riesgos de corrosión o erosión.

4. **DIN 2448:** Se ha utilizado en tramos principales de mayor diámetro (DN 100 a DN 125) por su disponibilidad comercial en el mercado europeo y su relación coste-prestaciones.

### 5.2. Codos

Se han seleccionado **codos de radio mediano** ($R \approx 1.5 \times D$) con una relación **$L_e/D = 26$**.

Esta geometría:
- Reduce la fricción interna respecto a los codos de radio estándar ($L_e/D = 32$)
- Mejora el perfil de velocidades
- Disminuye la pérdida de carga en aproximadamente un 18%
- Es la opción recomendada para líneas principales de transporte de vapor

**Fuente:** Manual Técnico de Diseño y Cálculo de Redes de Vapor (EREN, pág. 38)

---

## 6. Desarrollo por tramos

A continuación se presenta el análisis detallado de cada tramo de la red de vapor. Para cada uno se incluye:

- Croquis del tramo
- Cálculo del caudal másico
- Cálculo de longitudes (real, equivalente y de cálculo)
- Selección del diámetro comercial
- Cálculo del caudal volumétrico
- Cálculo de la velocidad de circulación
- Verificación de pérdida de presión

> **Nota:** Las figuras de croquis de tramos se encuentran en:  
> `../../Practica_Vapor_LaTeX/Figuras/dibujos_tramos/`
> 
> Las hojas de cálculo detalladas se encuentran en:  
> `../../Practica_Vapor_LaTeX/Figuras/calculos_tramos/`

### Observaciones del análisis

Del análisis efectuado se observa que:

- La **línea de salida de caldera hasta el punto P** presenta una pérdida de carga muy reducida, del orden de **0.01 bar**, debido al diámetro interior seleccionado de 146.4 mm y a la escasa longitud equivalente del tramo.

- El **tramo P-C₁** es el que concentra la mayor pérdida de carga de la red, con **0.24 bar**, como consecuencia de:
  - Su mayor longitud total de cálculo (97.4 m)
  - El diámetro interior adoptado (66.6 mm, Schedule 160)
  - La presencia de accesorios (2 codos + 1 T paso recto)

- El resto de ramales presentan caídas de presión intermedias, comprendidas entre **0.07 y 0.16 bar**.

- En todos los tramos se mantienen velocidades próximas a **20 m/s**, lo que confirma la coherencia del dimensionado realizado.

Conviene señalar que el trazado presenta varios ramales con diferente longitud y diferente concentración de accesorios, por lo que **no resulta adecuado aplicar un único diámetro a toda la instalación**. Por este motivo, cada tramo se ha dimensionado individualmente, manteniendo en todos los casos velocidades próximas al criterio adoptado y pérdidas de carga compatibles con la presión disponible en cabecera.

En consecuencia, puede considerarse que la **red queda correctamente dimensionada desde el punto de vista hidráulico**, ya que los diámetros seleccionados permiten transportar el caudal requerido con velocidades homogéneas y con pérdidas de presión moderadas en todos los tramos.

---

## 7. Tablas resumen

> [!skill:latex_drafting_skill] Formato tablas resumen en orientación A4 horizontal para mejor legibilidad.

### 7.1. Tabla de longitudes de cálculo y presiones por tramo

| Tramo        | $L_{real}$ (m) | Codos | T (recta) | T (deriv.) | $D_{tanteo}$ (mm) | $L_{eq}$ (m) | $L_{cálculo}$ (m) | $P_{entrada}$ [bar(g)] | $P_{salida}$ [bar(g)] |
|:-------------|---------------:|------:|----------:|-----------:|------------------:|-------------:|------------------:|-----------------------:|----------------------:|
| Caldera-P    | 12.74          | 0     | 0         | 0          | N/A               | 2.548        | 15.288            | 9.068                  | 9.058                 |
| P-C₁         | 88.189         | 2     | 1         | 0          | 60                | 9.24         | 97.429            | 9.058                  | 8.818                 |
| P-S          | 106            | 1     | 0         | 2          | 120               | 25.44        | 131.44            | 9.058                  | 8.90                  |
| S-C₂         | 25             | 0     | 0         | 0          | N/A               | 5            | 30                | 8.90                   | 8.83                  |
| S-T          | 60             | 0     | 1         | 1          | 120               | 7.5          | 78                | 8.90                   | 8.78                  |
| T-C₃         | 15             | 0     | 0         | 0          | N/A               | 3            | 18                | 8.78                   | 8.71                  |
| T-C₄         | 45             | 2     | 1         | 0          | 100               | 12.4         | 57.4              | 8.78                   | 8.69                  |

**Notas:**
- Los tramos con $D_{tanteo}$ = N/A utilizan un 20% de $L_{real}$ como $L_{eq}$ (tramos cortos sin accesorios significativos).
- La presión de entrada del primer tramo es la presión de caldera (9.068 bar(g)).
- La presión de salida de un tramo es la presión de entrada del tramo siguiente (acumulación de pérdidas).

### 7.2. Tabla de verificación hidráulica

| Tramo        | Tubería seleccionada     | $D_{interior}$ (mm) | $v$ (m/s) | $\Delta P$ (bar) |
|:-------------|:-------------------------|--------------------:|----------:|-----------------:|
| Caldera-P    | Schedule 80 - DN 150     | 146.4               | 19.17     | 0.010            |
| P-C₁         | Schedule 160 - DN 80     | 66.6                | 18.93     | 0.240            |
| P-S          | DIN 2448 - DN 125        | 131.7               | 20.28     | 0.158            |
| S-C₂         | DIN 2448 - DN 80         | 82.5                | 21.45     | 0.070            |
| S-T          | DIN 2448 - DN 100        | 107.1               | 20.79     | 0.120            |
| T-C₃         | Schedule 40 - DN 50      | 52.5                | 20.42     | 0.070            |
| T-C₄         | Schedule 40 - DN 100     | 102.3               | 20.11     | 0.090            |

**Observaciones:**
- Todas las velocidades se encuentran en el rango objetivo de 18-22 m/s.
- La pérdida de carga total acumulada desde la caldera hasta C₁ es de 0.25 bar (la mayor de la red).
- La pérdida de carga total acumulada desde la caldera hasta C₄ es de 0.38 bar.
- Todos los consumidores reciben vapor a presión superior a la requerida.

---

**Checkboxes de completitud (Plan de mejora):**
- [x] **3.1** Criterio de diseño: velocidad ~20 m/s como objetivo
- [x] **3.2** Metodología de cálculo: iterativa con hoja de cálculo, verificación velocidad y caída presión
- [x] **3.3** Fórmula de longitud de cálculo: $L_{cálculo} = L_{real} + L_{eq}$
- [x] **3.4** Propiedades del vapor solo en primer tramo: $h_v$, $\gamma$, $c_e$, $\rho_{relativa}$, $\mu$, $\vartheta$
- [x] **3.5** Selección de tuberías: DIN2448 / Schedule 40/80 según justificación
- [x] **3.6** Selección de codos: radio mediano Le/D=26
- [x] **3.7** Desarrollo por tramos con cálculos detallados
- [x] **3.8** Tabla: longitudes de cálculo y presiones por tramo
- [x] **3.9** Tabla: verificación hidráulica
- [x] **[skill: latex_drafting_skill]** Formato tablas resumen en A4 horizontal
