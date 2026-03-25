## Morfología del Enterramiento

Para el diseño de la canalización subterránea se ha proyectado una sección tipo de ingeniería que garantiza la integridad estructural y la eficiencia térmica. La morfología se define mediante un sistema de capas estratificadas referenciadas a la **Cota de Rasante ($\pm 0.00$)**, siguiendo el siguiente orden descendente:

*   **Nivel de Superficie a -0.80 m (Relleno de Tierras):** Capa superior compuesta por terreno natural o zahorras seleccionadas, compactadas mecánicamente para absorber las solicitaciones dinámicas del entorno.
*   **Nivel -0.80 m a -0.90 m (Losa de Protección Mecánica):** Se dispone una losa de hormigón armado (típicamente HA-25) de 10 cm de espesor. Su función es actuar como "escudo mecánico" y repartidor de cargas, protegiendo la zona de arena de presiones puntuales y avisando de la presencia de instalaciones críticas en caso de excavaciones futuras.
*   **Nivel -0.90 m a -1.34 m (Bloque Envolvente de Arena):** Zona de seguridad térmica y mecánica compuesta por arena de río lavada que ocupa el **ancho total de la zanja (1.50 m)**. Este material proporciona un lecho elástico que permite el libre movimiento longitudinal de las tuberías debido a las dilataciones térmicas.
    *   **Configuración de Redes:** Las tuberías se disponen en paralelo con una **separación horizontal entre ejes de 1.00 m**. El ancho de la excavación ($B = 1.50 \text{ m}$) se dimensiona bajo criterios de ingeniería para garantizar un margen lateral de compactación de $\approx 17.2 \text{ cm}$ a cada lado, considerando los diámetros exteriores reales con aislamiento según el estudio térmico:
        *   **Red Vapor (DN 80):** $OD = 88.9 \text{ mm}$ + Aisl. $50 \text{ mm} \rightarrow D_{ext} = 88.9 + (2 \times 50) = \mathbf{188.9 \text{ mm}}$.
        *   **Red Condensados (DN 32):** $OD = 42.4 \text{ mm}$ + Aisl. $40 \text{ mm} \rightarrow D_{ext} = 42.4 + (2 \times 40) = \mathbf{122.4 \text{ mm}}$.
        *   **Cálculo de Ancho:** $1.00 + (0.1889/2) + (0.1224/2) + (2 \times 0.1722) = \mathbf{1.50 \text{ m}}$.
    *   **Lecho de Apoyo:** La base de la zanja cuenta con una cama de 15 cm de arena nivelada que se extiende por toda la superficie inferior de la excavación compactada.



## Deducción de la Profundidad y Geometría del Enterramiento

Para no suponer el metro de enterramiento sin justificar, deducimos la profundidad real del eje ($h_{eje}$) sumando las distintas capas de la zanja desde la superficie hacia abajo:

1.  **Relleno de tierra libre (Cobertura):** Fijamos una cobertura mínima normativa de **$0.80 \text{ m}$** de tierra sobre las protecciones de la tubería para absorber cargas.
2.  **Tapa de hormigón:** Se incluye una losa o tapa de hormigón de **$0.10 \text{ m}$** ($10 \text{ cm}$) como protección mecánica, estándar para cruces o zonas de tránsito ligero en canalizaciones de vapor (fuente: manuales de obra civil y guías de aislamiento de tuberías enterradas).
3.  **Margen sobre el aislamiento:** Se exige un margen de aire/arena de **$0.10 \text{ m}$** ($10 \text{ cm}$) sobre el aislamiento térmico.
4.  **Aislamiento y Tubería ($r_2$):** 
    *   **Especificación de Tubería:** Se utiliza acero **Schedule 160 (DN 80)**. Según las tablas de dimensiones estándar (ANSI/ASME B36.10 / DIN 2448) recogidas en el *Catálogo General de Tubacero*, una tubería con diámetro interior de **$66.6 \text{ mm}$** tiene un Diámetro Exterior (OD) fijo de **$88.9 \text{ mm}$** (3.500 pulgadas).
    *   **Radio de acero ($r_1$):** $88.9 / 2 = \mathbf{44.45 \text{ mm}}$.
    *   **Aislamiento:** Lana de Roca de **$50 \text{ mm}$**.
    *   **Radio Exterior Total ($r_2$):** $44.45 + 50 = \mathbf{94.45 \text{ mm}} \approx \mathbf{0.0945 \text{ m}}$.

**Cálculo de la Profundidad del Eje ($h_{eje}$):**
$$h_{eje} = \text{Tierra} + \text{Hormigón} + \text{Margen} + r_2 = 0.80 + 0.10 + 0.10 + 0.0945 = \mathbf{1.0945 \text{ m}} \approx \mathbf{1.09 \text{ m}}$$


**Cálculo de la Zanja Total ($H$):**
Añadimos la cama inferior de arena:
$$H = h_{eje} + r_2 + \text{Cama inferior (0.15 m)} = 1.0945 + 0.0945 + 0.15 = \mathbf{1.339 \text{ m}} \approx \mathbf{1.34 \text{ m}}$$

