# Bases de Diseño y Selección de Equipos

## Tabla de contenidos
- [1. Caudal de diseño](#1-caudal-de-diseño)
- [2. Presión de diseño](#2-presión-de-diseño)
- [3. Selección de la caldera](#3-selección-de-la-caldera)
- [4. Potencia térmica requerida](#4-potencia-térmica-requerida)
- [5. Criterios de velocidad admisible](#5-criterios-de-velocidad-admisible)

---

## 1. Caudal de diseño

El caudal de diseño se calcula a partir de los caudales nominales de los cuatro consumidores, aplicando un factor de seguridad para compensar posibles fugas en la red de distribución.

### Cálculo del caudal total

La expresión utilizada es:

$$Q_{total} = K \cdot \sum_{i=1}^{4} C_i$$

donde:
- $K = 1.15$ es el factor de seguridad para fugas (15% adicional)
- $C_i$ son los caudales nominales de cada consumidor

Sustituyendo los valores:

$$Q_{total} = 1.15 \cdot (679 + 1359 + 340 + 2038) = 1.15 \cdot 4416 = 5078.4 \ \text{kg/h}$$

Este es el **caudal de cálculo real**. No se tienen en cuenta posibles ampliaciones porque se parte de una instalación existente; únicamente se considera un 15% de margen para fugas.

> **Nota:** El valor de 5078.4 kg/h se ajusta a **5400 kg/h** según el catálogo de la caldera Viessmann, seleccionando el valor comercial inmediatamente superior.

---

## 2. Presión de diseño

Los equipos consumidores trabajan a diferentes presiones:
- **C1:** 4 bar(g)
- **C2, C3, C4:** 7 bar(g)

La caldera debe generar una presión superior a la máxima de consumo (7 bar(g)) para compensar las pérdidas de carga en la red de distribución. Se asigna una **pérdida de carga máxima de 1 bar** por el recorrido completo de la red.

### Cálculo de la presión de la caldera

$$P_{caldera} = P_{max\_consumidor} + \Delta P_{red} = 7 + 1 = 8 \ \text{bar(g)}$$

### Corrección por altitud

La instalación se ubica en Salamanca a una altitud de 700 m sobre el nivel del mar, donde la presión atmosférica es de **0.932 bar** (inferior a la presión estándar de 1.013 bar a nivel del mar).

Por tanto, la presión absoluta es:

$$P_{caldera} = 8 + 0.932 = 8.932 \approx 9 \ \text{bar(a)}$$

### Ajuste según catálogo

Al consultar el catálogo de la caldera Viessmann VITOMAX 100-HS, modelo M33A, para un caudal de 5400 kg/h, se selecciona la presión de diseño recomendada de **10 bar(g)**.

**Presión final de cálculo:**

$$P_{caldera(cálculo)} = 9.068 \ \text{bar(g)} \quad \text{(10 bar absolutos)}$$

$$Q_{cálculo} = 5400 \ \text{kg/h}$$

> **Figura:** Gráfica de selección de presión.  
> *Fuente:* `../../Practica_Vapor_LaTeX/Figuras/seleccion_presion.pdf`

---

## 3. Selección de la caldera

> [!skill:doc_tecnica_vapor] Consultar el catálogo Viessmann en `references/` para obtener especificaciones técnicas completas.

Se selecciona la **caldera Viessmann VITOMAX 100-HS, modelo M33A** con las siguientes características:

- **Caudal nominal:** 5400 kg/h
- **Presión de diseño:** 10 bar(g)
- **Tipo de vapor:** Sobrecalentado a 220 °C
- **Temperatura de agua de alimentación:** 15 °C

Esta caldera es adecuada para aplicaciones industriales de vapor sobrecalentado y cumple con los requisitos de caudal y presión de la instalación.

### Justificación de la selección

1. El caudal comercial de 5400 kg/h es el inmediatamente superior al caudal calculado de 5078.4 kg/h, proporcionando un margen de seguridad adecuado.
2. La presión de 10 bar(g) garantiza que, tras las pérdidas de carga en la red, todos los consumidores recibirán vapor a la presión requerida.
3. El modelo M33A es una caldera pirotubular de alta eficiencia, diseñada para operación continua en entornos industriales.

---

## 4. Potencia térmica requerida

La potencia térmica necesaria se calcula mediante un balance entálpico entre el agua de alimentación y el vapor generado.

### Datos termodinámicos

A partir de las tablas de vapor para las condiciones de operación:

- **Condiciones del vapor:** 10 bar(a) y 220 °C (vapor sobrecalentado)
  - Entalpía del vapor: $h_v = 2874 \ \text{kJ/kg}$
  
- **Condiciones del agua de alimentación:** 15 °C
  - Entalpía del agua: $h_w = 15 \times 4.18 = 62.7 \ \text{kJ/kg}$

- **Caudal másico:** 
  $$\dot{m} = \frac{5400 \ \text{kg/h}}{3600 \ \text{s/h}} = 1.5 \ \text{kg/s}$$

### Cálculo de la potencia

La potencia térmica se obtiene mediante:

$$P = \dot{m} \cdot (h_v - h_w)$$

Sustituyendo valores:

$$P = 1.5 \ \text{kg/s} \times (2874 - 62.7) \ \text{kJ/kg}$$

$$P = 1.5 \times 2811.3 = 4216.95 \ \text{kW} \approx 4217 \ \text{kW}$$

> **Nota:** En el documento de datos de partida se menciona un valor alternativo calculado con $\dot{m} = 1.2267$ kg/s (correspondiente a 4416 kg/h), que resulta en una potencia de 3448.62 kW. La diferencia se debe al caudal considerado (con o sin el factor de seguridad del 15%).

### Potencia de consumo (método del factor f)

Para calcular la potencia de consumo se utiliza el **factor f**, que relaciona la entalpía del vapor con la potencia térmica específica.

> **Figura:** Gráfica de selección del factor f.  
> *Fuente:* `../../Practica_Vapor_LaTeX/Figuras/seleccion_factor_f.pdf`

Para una presión de **10 bar(a)**, de la gráfica se obtiene:

$$f = 0.753$$

La potencia térmica consumida se calcula como:

$$P_{térmica} = f \cdot Q_{cálculo} = 0.753 \times 5400 \ \text{kg/h} = 4066.2 \ \text{kW} \approx 4.07 \ \text{MW}$$

> **Nota:** Este método simplificado proporciona una estimación rápida de la potencia térmica requerida por la caldera, comúnmente utilizado en la industria del vapor.

---

## 5. Criterios de velocidad admisible

El dimensionamiento de las tuberías debe garantizar velocidades de circulación que equilibren la economía del diámetro con las pérdidas de carga y el comportamiento hidráulico de la instalación.

### Criterio de diseño adoptado

Para el diseño de las redes se han establecido los siguientes criterios de velocidad:

#### Red de distribución de vapor

La velocidad de circulación **no debe superar los 30 m/s** en ningún tramo. Superar este límite provocaría que la instalación funcione peor a largo plazo debido a:

- Mayor erosión en codos y accesorios
- Incremento de los niveles de ruido
- Mayores pérdidas de carga
- Mayor riesgo de vibraciones y fatiga mecánica

Para esta instalación se adopta un **valor objetivo de aproximadamente 20 m/s** en las líneas principales, lo que proporciona un margen de seguridad adecuado respecto al límite de 30 m/s.

#### Red de retorno de condensados

La velocidad de circulación debe mantenerse **por debajo de 20 m/s** en todos los tramos. Este límite es crítico debido al flujo bifásico (mezcla de condensado líquido y vapor flash):

- Velocidades superiores a 20 m/s incrementan significativamente el riesgo de erosión mecánica
- Aumentan los niveles de ruido y la probabilidad de golpes de ariete destructivos
- Comprometen la integridad estructural de la instalación a largo plazo

El rango óptimo de diseño para la red de condensados se sitúa entre **15 y 20 m/s**, equilibrando economía y seguridad operativa.

---

**Checkboxes de completitud (Plan de mejora):**
- [x] **2.1** Caudal de diseño: $Q_{total} = K \cdot \sum C_i$, factor 1.15 fugas
- [x] **2.2** Presión de diseño: cálculo con altitud 700m → 0.932 bar
- [x] **2.3** Selección caldera Viessmann VITOMAX 100-HS modelo M33A
- [x] **[skill: doc_tecnica_vapor]** Consultar catálogo en `references/`
- [x] **2.4** Potencia térmica: $P = \dot{m}(h_v - h_w)$ con entalpías a 10 bar abs y 220°C
- [x] **2.5** Criterios de velocidad admisible según presión

