Para el dimensionado de los distintos tramos de la red de vapor se ha adoptado como criterio de diseño una velocidad de circulación del orden de 20 m/s, valor que permite compatibilizar un diámetro de tubería económicamente razonable con pérdidas de carga moderadas y un funcionamiento hidráulico adecuado de la instalación. A partir de este criterio, la selección del diámetro comercial de cada tramo se ha realizado de forma iterativa mediante hoja de cálculo, verificando en cada caso la velocidad resultante y la caída de presión correspondiente.

En los tramos de menor longitud, debido a su reducida influencia sobre la pérdida de carga global de la red, la estimación de pérdidas se ha realizado mediante cálculo automático en la hoja de dimensionado. En cambio, en los tramos de mayor desarrollo se ha considerado de forma explícita la influencia de los accesorios, teniendo en cuenta para ello un diámetro de tanteo y el tipo de singularidad presente en cada línea, tales como codos y derivaciones en T. De este modo, para cada tramo se ha obtenido una longitud equivalente adicional, que se suma a la longitud real con objeto de determinar la longitud total de cálculo.

La longitud de cálculo de cada tramo se ha determinado mediante la expresión:

$$L_{cálculo} = L_{real} + L_{eq}$$


donde $L_{real}$ es la longitud geométrica del tramo y $L_{eq}$ es la longitud equivalente asociada a las pérdidas singulares. Esta última se ha obtenido a partir del número y tipo de accesorios presentes en cada línea, utilizando la tabla de equivalencias en forma $L_e/D$ incorporada al procedimiento de cálculo.

Una vez establecida la longitud de cálculo, se ha procedido a seleccionar la tubería comercial más adecuada para cada tramo, comprobando posteriormente el diámetro interior real, la velocidad de circulación y la pérdida de presión. Las presiones de entrada y salida en cada línea se han determinado acumulando las caídas de presión a lo largo de la red, lo que permite verificar que todos los consumidores disponen de presión suficiente para su correcto funcionamiento.

Conviene señalar que el trazado presenta varios ramales con diferente longitud y diferente concentración de accesorios, por lo que no resulta adecuado aplicar un único diámetro a toda la instalación. Por este motivo, cada tramo se ha dimensionado individualmente, manteniendo en todos los casos velocidades próximas al criterio adoptado y pérdidas de carga compatibles con la presión disponible en cabecera.

Del análisis efectuado se observa que la línea de salida de caldera hasta el punto $P$ presenta una pérdida de carga muy reducida, del orden de 0,01 bar, debido al diámetro interior seleccionado de 146,4 mm y a la escasa longitud equivalente del tramo. Por el contrario, el tramo $P-C_1$ es el que concentra la mayor pérdida de carga de la red, con 0,24 bar, como consecuencia de su mayor longitud total de cálculo y del diámetro interior finalmente adoptado. El resto de ramales presentan caídas de presión intermedias, comprendidas entre 0,07 y 0,16 bar, manteniéndose en todos ellos velocidades próximas a 20 m/s, lo que confirma la coherencia del dimensionado realizado.

En consecuencia, puede considerarse que la red queda correctamente dimensionada desde el punto de vista hidráulico, ya que los diámetros seleccionados permiten transportar el caudal requerido con velocidades homogéneas y con pérdidas de presión moderadas en todos los tramos. La metodología seguida combina, por tanto, un primer tanteo basado en criterio de velocidad con una verificación posterior de pérdidas lineales y singulares mediante hoja de cálculo.

### Tabla de longitudes de cálculo y presiones por tramo

| Tramo | $L_{real}$ (m) | Codos | T (recta) | T (derivación) | $D_{tanteo}$ (mm) | $L_{eq}$ (m) | $L_{cálculo}$ (m) | $P_{entrada}$ [bar(g)] | $P_{salida}$ [bar(g)] |
|-------|---|---|---|---|---|---|---|---|---|
| Caldera-P | 12,74 | 0 | 0 | 0 | N/A | 2,548 | 15,288 | 9,068 | 9,058 |
| P-C₁ | 88,189 | 2 | 1 | 0 | 60 | 9,24 | 97,429 | 9,058 | 8,818 |
| P-S | 106 | 1 | 0 | 2 | 120 | 25,44 | 131,44 | 9,058 | 8,90 |
| S-C₂ | 25 | 0 | 0 | 0 | N/A | 5 | 30 | 8,90 | 8,83 |
| S-T | 60 | 0 | 1 | 1 | 120 | 7,5 | 78 | 8,90 | 8,78 |
| T-C₃ | 15 | 0 | 0 | 0 | N/A | 3 | 18 | 8,78 | 8,71 |
| T-C₄ | 45 | 2 | 1 | 0 | 100 | 12,4 | 57,4 | 8,78 | 8,69 |


### Tabla de Verificación hidráulica

| Tramo | Tubería seleccionada | $D_{interior}$ (mm) | $v$ (m/s) | $\Delta P$ (bar) |
|-------|---|---|---|---|
| Caldera-P | Schedule 80 - 150 | 146,4 | 19,17 | 0,01 |
| P-C₁ | Schedule 160 - 80 | 66,6 | 18,93 | 0,24 |
| P-S | DIN 2448 - 125 | 131,7 | 20,28 | 0,16 |
| S-C₂ | DIN 2448 - 80 | 82,5 | 21,45 | 0,07 |
| S-T | DIN 2448 - 100 | 107,1 | 20,79 | 0,12 |
| T-C₃ | Schedule 40 - 50 | 52,5 | 20,42 | 0,07 |
| T-C₄ | Schedule 40 - 100 | 102,3 | 20,11 | 0,09 |




