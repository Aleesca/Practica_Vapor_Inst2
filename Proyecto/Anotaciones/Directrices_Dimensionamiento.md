# Directrices para el Dimensionamiento de Redes de Vapor y Condensados

Este documento resume las directrices técnicas extraídas de la documentación para el correcto diseño y dimensionamiento de instalaciones de vapor.

## 1. Dimensionamiento de la Red Principal de Vapor

El objetivo es asegurar el transporte de energía limitando la abrasión, el ruido y la pérdida de presión.

### Metodología de Cálculo
1. **Identificación Volumétrica:** Consultar tablas termodinámicas para obtener el volumen específico (v en m3/kg) según la presión y temperatura.
2. **Caudal Volumétrico:** V = m_punto x v.
3. **Sección Transversal:** Establecer velocidad admisible (C) y calcular el área: A = V / C.
4. **Diámetro Físico:** $D = \frac{\sqrt4 x V}{\pi \times C}$. Seleccionar siempre el diámetro comercial superior (API Schedule 40 u 80).

### Criterios de Velocidad Máxima
* **Líneas principales (Vapor Saturado):** Entre 25 y 40 m/s.
* **Según presión:**
    * < 2 bar: 30 m/s
    * 2-5 bar: 35 m/s
    * 5-10 bar: 40 m/s
    * 10-25 bar: 50 m/s
* **Líneas de gran longitud:** Restringir a 15 m/s para evitar caídas de presión excesivas.
* **Derivaciones cortas:** Entre 25 y 35 m/s.

---

## 2. Dimensionamiento de la Red de Retorno de Condensados

La red maneja un flujo bifásico debido al **vapor flash** generado en los purgadores.

### Pasos Críticos
1. **Cálculo de Vapor Flash:** Determinar el porcentaje de revaporizado mediante balance entálpico. Aunque en masa es bajo (~7%), volumétricamente ocupa más del 98% del espacio.
2. **Dimensionamiento por Revaporizado:** El diámetro del colector debe dimensionarse usando el caudal másico del revaporizado.
3. **Velocidad Bifásica:** Para mitigar golpes de ariete, la velocidad de la fase de revaporizado no debe superar los **15 - 20 m/s**.

---

## 3. Criterios Técnicos y Recomendaciones de Instalación

### Disposición Mecánica
* **Pendiente:** Mínimo de 40 mm por cada 10 m lineales en dirección del flujo.
* **Reducciones:** Usar siempre reductores **excéntricos** con la parte plana en la base inferior (evita acumulación de condensados).
* **Pozos de Goteo:** Instalar cada 30-50 m en tramos rectos y en puntos bajos. El diámetro del pozo debe ser igual al del colector (hasta 150 mm).

### Conexionado y Accesorios
* **Derivaciones:** Las tomas a equipos deben salir siempre por la **parte superior** (generatriz superior) de la tubería principal para captar el vapor más seco.
* **Filtros:** Instalar con la cámara transversal al eje horizontal (nunca hacia abajo).
* **Válvulas de Retención:** Instalar aguas abajo de cada purgador para evitar retornos presurizados durante paradas.

---
*Documento generado automáticamente a partir de la fuente: Práctica de vapor (NotebookLM)*
