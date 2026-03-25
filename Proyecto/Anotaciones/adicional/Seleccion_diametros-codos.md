# Justificación Técnica: Selección de Geometría de Codos y Especificación de Tubería (Schedule)

El diseño de una red de vapor eficiente requiere una selección rigurosa de materiales y geometrías que equilibre la integridad estructural con la minimización de las pérdidas energéticas. A continuación, se presenta la justificación técnica para la elección de los componentes de la instalación, operando bajo una presión de diseño de 10 bar.

## 1. Criterios de Selección de Codos de 90º

La pérdida de carga en los accesorios se evalúa mediante el concepto de **Longitud Equivalente ($Le$)**, que traduce la resistencia al flujo de un accesorio en metros adicionales de tubería recta. Según el *Manual Técnico de Diseño y Cálculo de Redes de Vapor* (Junta de Castilla y León, pág. 38) [1], la relación entre la longitud equivalente y el diámetro nominal ($Le/D$) es inversamente proporcional al radio de curvatura del codo:

*   **Codo de Radio Standard ($R \approx 1 \cdot D$):** Con una relación $Le/D = 32$, es la opción mecánicamente más compacta. Sin embargo, genera una zona de estancamiento y turbulencia mayor en el extradós de la curva, lo que se traduce en una caída de presión más acusada.
*   **Codo de Radio Mediano ($R \approx 1.5 \cdot D$):** Presenta una relación $Le/D = 26$. Esta geometría es la recomendada para líneas de transporte principal de vapor, ya que reduce la fricción interna y mejora el perfil de velocidades, alineándose con los objetivos de eficiencia energética descritos en el Capítulo 6 del manual de referencia [1].

**Decisión técnica:** Para el trazado principal de la red, se opta por el **Codo de Radio Mediano**. Esta elección reduce la pérdida de carga en aproximadamente un 18% respecto al codo estándar, permitiendo una mayor presión estática en el punto de consumo final.

## 2. Especificación de Tubería (Schedule) y Resistencia a la Presión

El espesor de pared, definido por el número de **Schedule (Sch.)**, es crítico para garantizar la seguridad ante la presión interna y la durabilidad frente a la corrosión. Según la clasificación del American Petroleum Institute (API) recogida en la documentación técnica (pág. 23) [1], el aumento del Schedule implica una pared más gruesa, pero reduce el área de paso efectiva.

*   **Schedule 40 (Standard Weight):** Es el estándar para vapor saturado a presiones industriales medias. Para un diámetro de 100 mm, ofrece un diámetro interior de 102,3 mm [1, pág. 24]. Dada la presión de la caldera de **10 bar** (temperatura de saturación de 184 °C), el Sch. 40 proporciona un factor de seguridad estructural amplio y maximiza el área de paso, manteniendo la velocidad del vapor dentro de los límites recomendados de 25-40 m/s (pág. 43) [1].
*   **Schedule 80 (Extra Strong):** Se caracteriza por una pared reforzada (97,2 mm de diámetro interior para DN 100). Su uso se justifica en diámetros pequeños ($\le 50$ mm) para aumentar la resistencia mecánica ante vibraciones, en uniones roscadas donde el tallado debilita la pared, y en la **red de retorno de condensados**. En esta última, el mayor espesor compensa la erosión provocada por el flujo bifásico y la corrosión por ácido carbónico, siguiendo las recomendaciones de diseño de Spirax Sarco integradas en el manual [1, Cap. 3].

## 3. Conclusión de la Selección para el Proyecto

Para una caldera de 10 bar, la apuesta técnica se resume en:
1.  **Distribución de Vapor:** Tubería **Schedule 40** con **Codos de Radio Mediano**, para optimizar el coste del acero y minimizar la caída de presión.
2.  **Retorno de Condensados y Conexiones de Instrumentación:** Tubería **Schedule 80**, garantizando una vida útil prolongada ante agentes corrosivos y fatiga mecánica.

---
### Bibliografía Empleada
[1] Ente Regional de la Energía de Castilla y León (EREN). *Manual Técnico de Diseño y Cálculo de Redes de Vapor: Eficiencia Energética en Redes de Vapor*. Junta de Castilla y León, 2010.
[2] Spirax Sarco. *Distribución de Vapor y Purga de Condensado: Guía de Referencia Técnica*. (Referencias iconográficas y de Le/D citadas en [1]).
