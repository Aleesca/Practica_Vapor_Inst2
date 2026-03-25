Para el dimensionamiento del tramo de la red de condensados, se ha adoptado el criterio de velocidad recomendada para flujo bifásico (mezcla de condensado y vapor flash). Según la literatura técnica(Manual IDAE / Spirax Sarco), la velocidad de diseño en estas líneas debe mantenerse entre los 15 y 20 m/s. Velocidades inferiores indican sobredimensionamiento (mayor coste y mayores pérdidas térmicas), mientras que velocidades superiores elevan el riesgo de erosión y ruidos.

En este caso, al optar por una caldera sin economizador se vuelve aún más importante el aprovechamiento del vapor flash.

El porcentaje de vapor flash se obtiene como :

$$
\%vf = \frac{h_{lp1} - h_{lp2}}{h_{vp2} - h_{lp2}} \cdot 100
$$

El subíndice 1 se refiere a la red de vapor mientras que el 2 se refiere a la red de condensados. Donde hlp1 es la entalpía del líquido saturado a la presión de la red 
de vapor, hlp2 es la entalpía del líquido saturado a la presión de la 
red de condensados y hvp2 es la entalpía del vapor saturado a la 
presión de la red de condensados.

Como criterio de diseño se coge una presión de la red de condensados 1 bar menor a la presión del consumidor más pequeña, luego: 

$$
P_{red cond} = 4 - 1 = 3 \ \mathrm{bar(g)}
$$

Para el tramo Caldera-P 

Consultando en la tabla de vapor saturado con la siguientes condiciones a una temperatura de saturación de 143.7 ºC. Esta temperatura es la de la presión elegida al inicio de la red de condensados. 

$$
T_{sat} = 143.732 \ ^\circ\mathrm{C} \rightarrow \left\{
\begin{aligned}
h_{lp2} &= 605.236 \ \mathrm{kJ/kg} \\
h_{vp2} &= 2738.21 \ \mathrm{kJ/kg} \\
v_{vapor} &= 0.460957 \ \mathrm{m^{3}/kg} \ (99.97 \%) \\
v_{agua} &= 0.00108369 \ \mathrm{m^{3}/kg} \ (0.23 \%)
\end{aligned}
\right.
$$

La presión de la red vapor son de 9.068 bar(g) yendo a la tabla de vapor saturado se obtiene una temperatura de saturación de 180.2 ºC
$$
T_{sat} = 180.238 \ ^\circ\mathrm{C} \rightarrow 
h_{lp1} = 764.238 \ \mathrm{kJ/kg} 
$$

el porcentaje de vapor flash obtenido es: 

$$\%vf = \frac{764.238 - 605.236}{2738.21 - 605.236} \cdot 100 = 7.45 \% $$

por lo tanto el caudal de vapor flash a recircular es 

$$
Q_{vf} = vf \cdot Q_{cálculo} = 0.0745 \cdot 5400 = 402.54 \ \mathrm{Kg/h}
$$

Los tramos correspondientes se obtienen de la misma forma. Hay que tener en cuenta que la altura de la tubería de vapor y el eje de la tubería de condensados debe ser de al menos entre 0,5 metros y 1,5 metros. En este caso se ha optado por 1 m. Además se han tenido en cuenta otras diámetros de tanteo para obtener la longitud equivalente, ya que los primero cálculos arrojaban valores de diámetros inferiores a los de la red de vapor. 




### Tabla de Cálculos de Diámetros y Presiones

| Linea de condensados | Lreal (m) | Dtanteo (mm) | Leq (m) | Lcálculo (m) | Tamaño tubería (mm) | Pentrada [bar(g)] | Psalida [bar(g)] |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Caldera-P | 12.74 | N/A | 2.548 | 15.3 | 65 | 3 | 2.98 |
| P-C1 | 88.2 | 30 | 4.62 | 92.81 | 32 | 2.98 | 2.73 |
| P-S | 105 | 60 | 12.72 | 117.72 | 65 | 2.73 | 2.59 |
| S-C2 | 24 | 45 | 5.49 | 29.5 | 50 | 2.59 | 2.54 |
| S-T | 60 | 50 | 7.5 | 67.5 | 65 | 2.59 | 2.51 |
| T-C3 | 14 | N/A | 2.8 | 16.8 | 25 | 2.51 | 2.46 |
| T-C4 | 44 | 50 | 6.2 | 50.2 | 50 | 2.51 | 2.45 |

*Nota: Tuberías Schedule 40. Para la línea de condensados no se ha seguido le metodología anterior de dimensionado se elegía el diámetro a través de la tabla de diámetros de tuberías de la norma DIN 2448 entonces. Entonces se han cogido estas tuberías porque es el estándar para presiones industriales bajas como es este caso $\left(P_{caldera} = 10 bar(a)\right)$*

### Tabla de Verificación de Velocidades, Diámetros interiores y Caídas de Presión

| Linea de condensados | Dinterior (mm) | v (m/s) | $\Delta P$ (bar) |
| :--- | :---: | :---: | :---: |
| Caldera-P | 58 | 19.31 | 0.02 |
| P-C1 | 28 | 17.78 | 0.25 |
| P-S | 58 | 19.13 | 0.14 |
| S-C2 | 39 | 18.04 | 0.05 |
| S-T | 50 | 17.7 | 0.08 |
| T-C3 | 24 | 17.96 | 0.05 |
| T-C4 | 48 | 17.41 | 0.06 |
  





