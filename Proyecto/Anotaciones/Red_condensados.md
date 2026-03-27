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




El dimensionamiento hidráulico se integra en el diseño de la siguiente manera: el tramo Caldera-P (DN 65) opera a 19,31 m/s con $\Delta P$=0,02 bar; P-C₁ (DN 32) a 17,78 m/s con $\Delta P$=0,25 bar; P-S (DN 65) a 19,13 m/s con $\Delta P$=0,14 bar; S-C₂ (DN 50) a 18,04 m/s con $\Delta P$=0,05 bar; S-T (DN 65) a 17,70 m/s con $\Delta P$=0,08 bar; T-C₃ (DN 25) a 17,96 m/s con $\Delta P$=0,05 bar; y finalmente T-C₄ (DN 50) a 17,41 m/s con $\Delta P$=0,06 bar.

---

<!-- PÁGINA HORIZONTAL INDEPENDIENTE -->
### Tablas de Verificación (Formato Horizontal)

#### 1. Accesorios por tramo y cálculo de longitudes equivalentes
| Tramo | $L_{real}$ (m) | Codos | T (recta) | T (derivación) | $D_{tanteo}$ (mm) | $L_{eq}$ (m) | $L_{cálculo}$ (m) |
|-------|---|---|---|---|---|---|---|
| Caldera-P | 12,74 | 0 | 0 | 0 | N/A | 2,548 | 15,30 |
| P-C₁ | 88,20 | 2 | 1 | 0 | 30 | 4,62 | 92,81 |
| P-S | 105,00 | 1 | 0 | 2 | 60 | 12,72 | 117,72 |
| S-C₂ | 24,00 | 0 | 0 | 0 | 45 | 5,49 | 29,50 |
| S-T | 60,00 | 0 | 1 | 1 | 50 | 7,50 | 67,50 |
| T-C₃ | 14,00 | 0 | 0 | 0 | N/A | 2,80 | 16,80 |
| T-C₄ | 44,00 | 2 | 1 | 0 | 50 | 6,20 | 50,20 |

#### 2. Presiones disponibles vs. requeridas en los consumidores
| Consumidor | $P_{disponible}$ (calculada) [bar(g)] | $P_{requerida}$ (red colector) [bar(g)] |
|------------|---------------------------------------|-----------------------------------------|
| C₁ | 2,73 | 3,0 |
| C₂ | 2,54 | 3,0 |
| C₃ | 2,46 | 3,0 |
| C₄ | 2,45 | 3,0 |

*Nota: La presión disponible se indica según el nodo de cálculo de la línea de condensados para mantener la estructura simétrica con la red de vapor.*

#### 3. Pérdida de carga acumulada hasta cada consumidor
| Consumidor | Ruta de retorno | $\Delta P_{acumulada}$ (bar) |
|------------|-----------------|------------------------------|
| C₁ | Caldera $\rightarrow$ P $\rightarrow$ C₁ | 0,02 + 0,25 = 0,27 |
| C₂ | Caldera $\rightarrow$ P $\rightarrow$ S $\rightarrow$ C₂ | 0,02 + 0,14 + 0,05 = 0,21 |
| C₃ | Caldera $\rightarrow$ P $\rightarrow$ S $\rightarrow$ T $\rightarrow$ C₃ | 0,02 + 0,14 + 0,08 + 0,05 = 0,29 |
| C₄ | Caldera $\rightarrow$ P $\rightarrow$ S $\rightarrow$ T $\rightarrow$ C₄ | 0,02 + 0,14 + 0,08 + 0,06 = 0,30 |
  





