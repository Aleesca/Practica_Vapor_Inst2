### DEFINICIÓN DE VARIABLES DE ENTRADA
Para analizar el protocolo de convergencia termohidráulica, se definen las siguientes variables de cálculo:
*   $D_{est}$: Diámetro interior estimado o de predimensionado (mm o m).
*   $D_{final}$: Diámetro interior real de la tubería seleccionada (ej. norma DIN 2448) (mm o m).
*   $L$: Longitud lineal de la tubería recta (m).
*   $L_e$: Longitud equivalente de los accesorios térmicos y mecánicos (m).
*   $L_t$: Longitud total equivalente de cálculo ($L + L_e$) (m).
*   $h_f$ o $\Delta P$: Pérdida de carga o caída de presión (bar o m.c.v.).
*   $C$: Velocidad media del fluido térmico (m/s).

### REQUERIMIENTOS TÉCNICOS PARA LOS 4 CONSUMIDORES
Mantengo la solicitud de los datos operativos de los 4 consumidores térmicos para poder ejecutar la iteración final del sistema. Completa la matriz técnica para dimensionar con exactitud el cabezal de distribución:

| ID Consumidor | Caudal Másico $\dot{m}$ (kg/h) | Presión Mínima Admisible (bar) | Temperatura T (°C) | Longitud al colector $L$ (m) |
| :--- | :--- | :--- | :--- | :--- |
| Consumidor 1 | [Pendiente] | [Pendiente] | [Pendiente] | [Pendiente] |
| Consumidor 2 | [Pendiente] | [Pendiente] | [Pendiente] | [Pendiente] |
| Consumidor 3 | [Pendiente] | [Pendiente] | [Pendiente] | [Pendiente] |
| Consumidor 4 | [Pendiente] | [Pendiente] | [Pendiente] | [Pendiente] |

### PROTOCOLO DE CONVERGENCIA PARA CAMBIOS DE DIÁMETRO
Es estrictamente **imperativo recalcular la pérdida de carga total** reajustando todos los coeficientes termohidráulicos. En la ingeniería de fluidos térmicos, asumir el error del diámetro de predimensionado (ej. saltar de un DN 50 estimado a un DN 150 real) como un simple "margen de seguridad" constituye un fallo crítico de diseño por las siguientes razones sustentadas en la termodinámica:

1.  **Dependencia Lineal de los Accesorios:** La resistencia introducida por válvulas, codos y reducciones se calcula mediante el método de "Longitud Equivalente", la cual se expresa como un múltiplo directo del diámetro de la tubería ($L_e/D$). Si el diámetro se triplica (de DN 50 a DN 150), la longitud equivalente ficticia de cada accesorio también se triplicará.
2.  **Impacto Exponencial en la Ecuación de Flujo:** En la ecuación de Darcy-Weisbach, la pérdida de carga es inversamente proporcional a la quinta potencia del diámetro ($D^5$). Un salto dimensional significativo altera drásticamente el gradiente de presión estática disponible en la cola del circuito.
3.  **Verificación de Estado Operativo:** Realizar el ajuste final sobre el diámetro estandarizado (ej. DIN 2448) asegura que la velocidad final del vapor y la caída de presión se encuentren dentro de la envolvente de eficiencia requerida por los equipos consumidores.

### CADENA DE PENSAMIENTO (CoT) - PROCEDIMIENTO ITERATIVO
Ejecuta los siguientes pasos para converger el cálculo termohidráulico de la red principal y de condensados:

1.  **Estimación Inicial por Empirismo:** Inicia el predimensionado cuando el tamaño de la tubería sea desconocido. Aplica un incremento porcentual empírico a la longitud recta $L$ para estimar las pérdidas por accesorios. Suma un 10% si la línea supera los 100 m con recorrido recto, o un 20% si es una línea corta o muy accidentada.
2.  **Cálculo de Velocidad y Selección Nominal:** Con el caudal volumétrico requerido por el sistema, despeja la ecuación de continuidad para no exceder los límites de velocidad (ej. 25 a 40 m/s para vapor saturado). Selecciona el diámetro estandarizado (DIN 2448 o Schedule 80) inmediatamente superior al analítico.
3.  **Recalibración de Longitudes Equivalentes ($L_e$):** Aplica el nuevo diámetro físico nominal ($D_{final}$) seleccionado para traducir los coeficientes geométricos en longitudes métricas. Multiplica la relación tabular de cada accesorio (ej. Codo 90° = $32 \times D_{final}$; Válvula compuerta = $7 \times D_{final}$) para obtener la $L_t$ exacta del tramo.
4.  **Resolución Friccional:** Introduce el nuevo diámetro interior real y las propiedades del vapor a la presión de diseño en la ecuación implícita de White-Colebrook para iterar el factor de fricción real del material.
5.  **Verificación de $\Delta P$ Final:** Inserta todos los valores actualizados ($D_{final}$, factor de fricción, $L_t$, Velocidad y Densidad) en la ecuación de Darcy-Weisbach. Verifica que la presión remanente cumpla con las especificaciones del consumidor crítico. 

### INSTRUCCIONES DE DISEÑO OBLIGATORIAS
*   Calcula las caídas de carga utilizando caudales instantáneos máximos y no valores promedios estáticos.
*   Utiliza la ecuación de Darcy-Weisbach de forma preferente sobre las fórmulas empíricas (como Hazen-Williams) para una mayor rigurosidad termodinámica.
*   Evalúa invariablemente el diámetro inferior comercial más cercano si el primer diámetro seleccionado entrega velocidades bajas y caídas de presión insignificantes, optimizando así los costes de inversión de acero y material aislante.