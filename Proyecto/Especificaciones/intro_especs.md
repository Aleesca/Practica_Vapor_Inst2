# Introducción

## Tabla de contenidos
- [1. Contexto del problema](#1-contexto-del-problema)
- [2. Ubicación y datos catastrales](#2-ubicación-y-datos-catastrales)
- [3. Consumidores y requisitos](#3-consumidores-y-requisitos)
- [4. Objetivos del trabajo](#4-objetivos-del-trabajo)
- [5. Referencias visuales](#5-referencias-visuales)

---

## 1. Contexto del problema

Este trabajo aborda el diseño de una instalación completa de vapor para una parcela industrial en Salamanca. El objetivo principal es dimensionar una red de distribución de vapor y una red de retorno de condensados para suministrar energía térmica a cuatro consumidores (C1, C2, C3 y C4) con diferentes requerimientos de caudal y presión.

La instalación parte de una configuración existente, por lo que no se contemplan ampliaciones futuras. El diseño debe garantizar el correcto funcionamiento hidráulico de ambas redes, minimizando las pérdidas de carga y asegurando que cada consumidor reciba vapor a la presión requerida. Adicionalmente, se dimensionará el aislamiento térmico de todas las líneas para cumplir con los criterios de seguridad establecidos en el RITE (Reglamento de Instalaciones Térmicas en los Edificios).

El vapor generado por la caldera será **vapor sobrecalentado a 220 °C**, con una temperatura de entrada del agua de alimentación de 15 °C. La altitud de 700 m sobre el nivel del mar (presión atmosférica de 0.932 bar) se tiene en cuenta para los cálculos de presión de diseño.

Un aspecto clave del trabajo es la correcta gestión del **vapor flash** generado en los purgadores de la red de condensados. Dado que la instalación no incluye un economizador, el aprovechamiento energético de este vapor flash se convierte en una medida de eficiencia térmica fundamental.

> [!skill:steam_knowledge_skill] Extraer datos técnicos de las anotaciones para alimentar todas las secciones de especificaciones.

---

## 2. Ubicación y datos catastrales

- **Ubicación:** Salamanca, España
- **Parcela:** A3
- **Referencia Catastral:** 5183601TL9358S0001KH
- **Altitud:** 700 m sobre el nivel del mar

La altitud es un dato relevante ya que afecta a la presión atmosférica local (0.932 bar en lugar de 1.013 bar a nivel del mar), lo cual debe considerarse en el cálculo de la presión absoluta de operación de la caldera.

> **Figura:** Plano de situación de la parcela A3.  
> *Fuente:* `../../Practica_Vapor_LaTeX/Figuras/plano_situacion.pdf`

---

## 3. Consumidores y requisitos

La instalación debe abastecer a cuatro consumidores con los siguientes requerimientos:

> [!skill:latex_drafting_skill] Formato de tabla con booktabs para presentación profesional.

| Consumidor | Caudal (kg/h) | Presión [bar(g)] |
|:----------:|:-------------:|:----------------:|
| C1         | 679           | 4                |
| C2         | 1359          | 7                |
| C3         | 340           | 7                |
| C4         | 2038          | 7                |


### Caudal de diseño

El caudal total de diseño se calcula considerando un factor de seguridad del 15% para compensar posibles fugas en la red:

$$Q_{total} = K \cdot \sum_{i=1}^{4} C_i = 1.15 \cdot (679 + 1359 + 340 + 2038) = 5078.4 \ \text{kg/h}$$

Este valor se redondea a **5400 kg/h** al consultar el catálogo de la caldera Viessmann VITOMAX 100-HS, modelo M33A, seleccionando el caudal comercial inmediatamente superior.

### Presión de diseño

La presión de diseño de la caldera se establece considerando:
1. La presión máxima requerida por los consumidores: **7 bar(g)** (C2, C3, C4)
2. Una pérdida de carga máxima admisible de **1 bar** en la red de distribución
3. La corrección por altitud (0.932 bar)

$$P_{caldera} = 7 + 1 = 8 \ \text{bar(g)}$$

$$P_{caldera} = 8 + 0.932 = 8.932 \approx 9 \ \text{bar(a)}$$

Consultando el catálogo Viessmann para un caudal de 5400 kg/h, la presión de diseño recomendada es **10 bar(g)**, lo que resulta en una presión de cálculo final de:

$$P_{caldera(cálculo)} = 9.068 \ \text{bar(g)} \quad (10 \ \text{bar abs})$$

> **Figura:** Gráficas de selección de presión y factor f.  
> *Fuentes:*  
> - `../../Practica_Vapor_LaTeX/Figuras/seleccion_presion.pdf`  
> - `../../Practica_Vapor_LaTeX/Figuras/seleccion_factor_f.pdf`

---

## 4. Objetivos del trabajo

Este trabajo tiene como finalidad responder a las siguientes preguntas técnicas:

1. **¿Qué caldera es adecuada para la instalación?**  
   Seleccionar el modelo comercial apropiado (Viessmann VITOMAX 100-HS M33A) y calcular su potencia térmica requerida.

2. **¿Cómo dimensionar la red de distribución de vapor?**  
   Determinar los diámetros de tubería, las pérdidas de carga y las velocidades de circulación en cada tramo, asegurando que todos los consumidores reciban vapor en condiciones adecuadas.

3. **¿Cómo diseñar la red de retorno de condensados?**  
   Calcular el porcentaje de vapor flash generado, dimensionar la red para flujo bifásico y establecer estrategias de aprovechamiento energético del vapor flash.

4. **¿Qué espesor de aislamiento térmico es necesario?**  
   Dimensionar el aislamiento de lana de roca para cada tramo (aéreo y soterrado) de forma que la temperatura superficial no supere los 30 °C, cumpliendo con el RITE.

5. **¿Cuáles son las mejores prácticas de instalación?**  
   Definir criterios de profundidad de enterramiento, altura de líneas aéreas, separación vertical entre vapor y condensados, y morfología de la zanja.

El desarrollo del trabajo incluye:
- Cálculos detallados de caudal, presión, velocidad y pérdidas de carga por tramo
- Selección de tuberías comerciales (DIN 2448 / Schedule 40/80)
- Dimensionamiento térmico exhaustivo con ecuaciones de transferencia de calor
- Generación de planos de situación, red de vapor y red de condensados
- Tablas resumen con datos técnicos de cada tramo

---

## 5. Referencias visuales

A lo largo del documento se referencian las siguientes figuras clave:

- **Plano de situación:** `../../Practica_Vapor_LaTeX/Figuras/plano_situacion.pdf`
- **Selección de presión:** `../../Practica_Vapor_LaTeX/Figuras/seleccion_presion.pdf`
- **Selección del factor f:** `../../Practica_Vapor_LaTeX/Figuras/seleccion_factor_f.pdf`
- **Dibujos de tramos:** `../../Practica_Vapor_LaTeX/Figuras/dibujos_tramos/`
- **Cálculos de tramos:** `../../Practica_Vapor_LaTeX/Figuras/calculos_tramos/`

---

**Checkboxes de completitud (Plan de mejora):**
- [x] **1.1** Contexto del problema (fuente: `../Anotaciones/adicional/Comentarios_practicas.md`)
- [x] **1.2** Ubicación y datos catastrales (fuente: `../Anotaciones/intro.md`, `../Anotaciones/datos_partida.md`)
- [x] **1.3** Tabla de consumidores C1-C4 con caudales y presiones (fuente: `../Anotaciones/datos_partida.md`)
- [x] **1.4** Objetivos del trabajo (qué preguntas se responden)
- [x] **1.5** Referencia a figuras: plano situación, `seleccion_factor_f.pdf`, `seleccion_presion.pdf`
- [x] **[skill: latex_drafting_skill]** Formato tablas booktabs
