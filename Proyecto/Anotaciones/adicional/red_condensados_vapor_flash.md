# Gestión del Vapor Flash en Redes de Condensados

## 1. Introducción y Problemática del Flujo Bifásico

En el diseño termohidráulico de redes de retorno de condensados, uno de los fenómenos críticos a gestionar es la formación de **vapor flash** (o revaporizado). Este fenómeno termodinámico ocurre debido a la descompresión isotérmica que sufre el condensado al pasar a través del purgador desde una presión superior (la de la red de distribución) a una inferior (la del colector de retorno) [[Manual] Redes_de_vapor.pdf, Cap. 3, Sec. 2.1].

Si el vapor flash no se separa del condensado líquido, la red de retorno operará en régimen de flujo bifásico. Esto presenta severas desventajas técnicas y económicas:
*   **Sobredimensionamiento de líneas:** Aunque el vapor flash representa un porcentaje pequeño en masa (típicamente en torno al 7%), su volumen específico es enormemente mayor que el del líquido. Esto obliga a incrementar drásticamente los diámetros nominales de las tuberías para evitar superar las velocidades admisibles. El manual ilustra cómo la separación del flash puede reducir el diámetro necesario de 41 mm a tan solo 19 mm [[Manual] Redes_de_vapor.pdf, págs. 66-67].
*   **Velocidades límite e inestabilidad:** En un flujo bifásico de condensados, las velocidades deben limitarse estrictamente a 15-20 m/s para prevenir severos problemas de erosión mecánica y la aparición de ruidos y golpes de ariete destructivos por el arrastre de condensado [[Manual] Redes_de_vapor.pdf, pág. 66].

## 2. Recomendación Técnica: Separación del Vapor Flash

Frente a la circulación en flujo bifásico, la directriz de ingeniería es **separar el vapor flash del condensado líquido** instalando un tanque separador o revaporizador (Flash Vessel) a la salida de las estaciones de purga principales.

La separación física de ambas fases permite:
1.  **Reducción del diámetro del colector de retorno:** Al vehicular únicamente agua en fase líquida por la tubería principal de retorno hacia la sala de calderas, el área de paso necesaria se minimiza, reduciendo exponencialmente los costes de instalación (tubería, soportación y aislamientos térmicos) [[Manual] Redes_de_vapor.pdf, Cap. 3, Sec. 2.1].
2.  **Mitigación de riesgos mecánicos:** Se estabiliza el flujo, eliminando la principal causa de golpes de ariete por arrastre de bolsas de líquido a altas velocidades de vapor.

## 3. Estrategia de Eficiencia Energética: Reutilización (Aprovechamiento)

Es imperativo aclarar que la "eliminación" del vapor flash del colector principal de retorno de líquidos **no implica en absoluto su purga a la atmósfera** (lo cual supondría una ineficiencia inaceptable). Por el contrario, la normativa de diseño estipula que *"hoy en día no se concibe una red de condensados de una instalación medianamente grande sin aprovechamiento de vapor flash"* [[Manual] Redes_de_vapor.pdf, Cap. 5, Sec. 1.1, pág. 91].

En escenarios técnicos donde el generador de vapor **carece de economizador**, la recuperación entálpica del vapor flash se erige como la medida de eficiencia térmica más relevante del sistema. Las estrategias de reaprovechamiento técnico incluyen:

*   **Precalentamiento del tanque de alimentación (Recomendación Principal):** El vapor flash separado en el tanque revaporizador se inyecta directamente en el tanque de almacenamiento de agua de alimentación de la caldera. La condensación transfiere todo su calor latente al agua de aporte, incrementando su temperatura. Esto reduce de forma directa el salto entálpico que el quemador de la caldera debe suplir, compensando en gran medida el déficit térmico provocado por la ausencia del economizador.
*   **Alimentación de consumidores de baja presión:** El revaporizado puede ser canalizado para alimentar equipos secundarios que operen a la presión del tanque flash (o inferior, mediante estaciones reductoras), proporcionando energía térmica "gratuita" a procesos auxiliares como baterías de calentamiento de aire [[Manual] Redes_de_vapor.pdf, Cap. 5, Sec. 1.1, Fig. 24].

**Conclusión:**
El diseño termohidráulico riguroso exige la instalación de tanques separadores de flash. Por su parte inferior se evacúa el condensado en fase puramente líquida (optimizando la inversión en la línea de retorno de condensados), mientras que por la parte superior se capta y reutiliza el 100% del vapor flash generado para el precalentamiento del agua de alimentación, maximizando la eficiencia energética global del ciclo.