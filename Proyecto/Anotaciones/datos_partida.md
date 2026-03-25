# Datos de partida 

Vapor sobrecalentado a 220ºC
Temperatura de entrada del agua a la caldera: 15ºC
- Ubicación: Salamanca.
- Parcela: A3.
- Referencia Catastral: 5183601TL9358S0001KH
- Altitud: 700 m


| Consumidor | Caudal (kg/h) | Presión (bar(g)) |
|-----------|---------------|------------------|
| C1        | 679           | 4                |
| C2        | 1359          | 7                |
| C3        | 340           | 7                |
| C4        | 2038          | 7                |


## Caudal del diseño

$$Q_{total} = K \cdot \left(C1 + C2 + C3 + C4 \right)$$

$$Q_{total} = 1.15 \cdot \left(679 + 1359 + 340 + 2038 \right) = 5078.4 \ \mathrm{kg/h}$$

Este es el caudal de cálculo real. No se tienen en cuenta posibles ampliaciones porque ya se parte de una instalación existente. únicamente se tienen en cuenta un 15 \% de fugas.

## Presión de diseño

Los equipos trabajan a diferentes presiones.
-	C1: 4 bar(g)
-	C2, C3, C4: 7 bar(g)
La caldera debe generar una presión superior a la máxima de consumo (7 bar(g)) para compensar las pérdidas de carga en la red de distribución. Se asigna una pérdida de carga máximo por tramo de 1 bar: 

$$P_{caldera} = 7 + 1 = 8 \ \mathrm{bar(g)}$$

Se tiene en cuenta la presión atmosférica a 700 m = 0.932 bar

$$P_{caldera} = 8 + 0.932 = 8.932 \approx 9 \mathrm{bar(a)}$$

Se visita al catálogo de la caldera Viessman VITOMAX 100-HS, modelo M33A y para un caudal de 5400 kg/h se coge el valor inmediato superior, luego la presión de cálculo es de 10 bar(g)

Por lo tanto: 

$$P_{caldera(cálculo)} = 9.068 \ \mathrm{bar(g)}$$
$$Q_{cálculo} = 5400 \ \mathrm{kg/h}$$
y vemos que la presión de diseño recomendada es de 10 bar(g) para

Potencia térmica calculada 

Potencia térmica calculada (P):

Caudal másico total $$ \dot{m}: 4.416 kg/h \rightarrow 4.416/3.600 = 1,2267 kg/s$$
Entalpía vapor sobrecalentado $h_v$: $$2.874 kJ/kg  (10 bar abs y 220ºC)$$
Entalpía agua de alimentación $h_w$: $$15ºC \cdot 4,18 kJ/(kg·ºC)=62,7 kJ/kg$$

$$P= ṁ·(h_v-h_w )$$
$$P=1,2267 kg/s·(2.874 kJ/kg-62.7kJ/kg)$$
$$P=3.448,62 kW$$


## Potencia de consumo 

Para calcular la potencia de consumo, se debe calcular el factor f, que se obtiene a partir de la siguiente gráfica.

En nuestro caso se utilizará una presión de 10 bar: 
$$ f = 0.753 $$

se calcula la potencia consumida como 

$$P_{térmica} = 0.753 \cdot 5400 \ \mathrm{kg/h} = 3012 \ \mathrm{KW}$$
