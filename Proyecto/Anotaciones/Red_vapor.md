Para el dimensionado de los distintos tramos de la red de vapor se ha adoptado como criterio de diseño una velocidad de circulación del orden de 20 m/s, valor que permite compatibilizar un diámetro de tubería económicamente razonable con pérdidas de carga moderadas y un funcionamiento hidráulico adecuado de la instalación. A partir de este criterio, la selección del diámetro comercial de cada tramo se ha realizado de forma iterativa mediante hoja de cálculo, verificando en cada caso la velocidad resultante y la caída de presión correspondiente.

En los tramos de menor longitud, debido a su reducida influencia sobre la pérdida de carga global de la red, la estimación de pérdidas se ha realizado mediante cálculo automático en la hoja de dimensionado. En cambio, en los tramos de mayor desarrollo se ha considerado de forma explícita la influencia de los accesorios, teniendo en cuenta para ello un diámetro de tanteo y el tipo de singularidad presente en cada línea, tales como codos y derivaciones en T. De este modo, para cada tramo se ha obtenido una longitud equivalente adicional, que se suma a la longitud real con objeto de determinar la longitud total de cálculo.

La longitud de cálculo de cada tramo se ha determinado mediante la expresión:

$$L_{cálculo} = L_{real} + L_{eq}$$


donde $L_{real}$ es la longitud geométrica del tramo y $L_{eq}$ es la longitud equivalente asociada a las pérdidas singulares. Esta última se ha obtenido a partir del número y tipo de accesorios presentes en cada línea, utilizando la tabla de equivalencias en forma $L_e/D$ incorporada al procedimiento de cálculo.

Una vez establecida la longitud de cálculo, se ha procedido a seleccionar la tubería comercial más adecuada para cada tramo, comprobando posteriormente el diámetro interior real, la velocidad de circulación y la pérdida de presión. Las presiones de entrada y salida en cada línea se han determinado acumulando las caídas de presión a lo largo de la red, lo que permite verificar que todos los consumidores disponen de presión suficiente para su correcto funcionamiento.

Conviene señalar que el trazado presenta varios ramales con diferente longitud y diferente concentración de accesorios, por lo que no resulta adecuado aplicar un único diámetro a toda la instalación. Por este motivo, cada tramo se ha dimensionado individualmente, manteniendo en todos los casos velocidades próximas al criterio adoptado y pérdidas de carga compatibles con la presión disponible en cabecera.

Del análisis efectuado se observa que la línea de salida de caldera hasta el punto $P$ presenta una pérdida de carga muy reducida, del orden de 0,01 bar, debido al diámetro interior seleccionado de 146,4 mm y a la escasa longitud equivalente del tramo. Por el contrario, el tramo $P-C_1$ es el que concentra la mayor pérdida de carga de la red, con 0,24 bar, como consecuencia de su mayor longitud total de cálculo y del diámetro interior finalmente adoptado. El resto de ramales presentan caídas de presión intermedias, comprendidas entre 0,07 y 0,16 bar, manteniéndose en todos ellos velocidades próximas a 20 m/s, lo que confirma la coherencia del dimensionado realizado.

En consecuencia, puede considerarse que la red queda correctamente dimensionada desde el punto de vista hidráulico, ya que los diámetros seleccionados permiten transportar el caudal requerido con velocidades homogéneas y con pérdidas de presión moderadas en todos los tramos. La metodología seguida combina, por tanto, un primer tanteo basado en criterio de velocidad con una verificación posterior de pérdidas lineales y singulares mediante hoja de cálculo.

El dimensionado hidráulico de cada tramo se resume a continuación para su integración en el texto: el tramo Caldera-P utiliza tubería Schedule 80 - 150 (v=19,17 m/s, $\Delta P$=0,01 bar); el tramo P-C₁ emplea Schedule 160 - 80 (v=18,93 m/s, $\Delta P$=0,24 bar); P-S usa DIN 2448 - 125 (v=20,28 m/s, $\Delta P$=0,16 bar); S-C₂ con DIN 2448 - 80 (v=21,45 m/s, $\Delta P$=0,07 bar); S-T utiliza DIN 2448 - 100 (v=20,79 m/s, $\Delta P$=0,12 bar); T-C₃ con Schedule 40 - 50 (v=20,42 m/s, $\Delta P$=0,07 bar); y finalmente T-C₄ con Schedule 40 - 100 (v=20,11 m/s, $\Delta P$=0,09 bar).

---

<!-- PÁGINA HORIZONTAL INDEPENDIENTE -->
### Tablas de Verificación (Formato Horizontal)

#### 1. Accesorios por tramo y cálculo de longitudes equivalentes
| Tramo | $L_{real}$ (m) | Codos | T (recta) | T (derivación) | $D_{tanteo}$ (mm) | $L_{eq}$ (m) | $L_{cálculo}$ (m) |
|-------|---|---|---|---|---|---|---|
| Caldera-P | 12,74 | 0 | 0 | 0 | N/A | 2,548 | 15,288 |
| P-C₁ | 88,189 | 2 | 1 | 0 | 60 | 9,24 | 97,429 |
| P-S | 106 | 1 | 0 | 2 | 120 | 25,44 | 131,44 |
| S-C₂ | 25 | 0 | 0 | 0 | N/A | 5 | 30 |
| S-T | 60 | 0 | 1 | 1 | 120 | 7,5 | 78 |
| T-C₃ | 15 | 0 | 0 | 0 | N/A | 3 | 18 |
| T-C₄ | 45 | 2 | 1 | 0 | 100 | 12,4 | 57,4 |

#### 2. Presiones disponibles vs. requeridas en los consumidores
| Consumidor | $P_{disponible}$ [bar(g)] | $P_{requerida}$ [bar(g)] | Margen [bar] |
|------------|---------------------------|--------------------------|--------------|
| C₁ | 8,818 | 4,0 | +4,818 |
| C₂ | 8,830 | 7,0 | +1,830 |
| C₃ | 8,710 | 7,0 | +1,710 |
| C₄ | 8,690 | 7,0 | +1,690 |

#### 3. Pérdida de carga acumulada hasta cada consumidor
| Consumidor | Ruta | $\Delta P_{acumulada}$ (bar) |
|------------|------|------------------------------|
| C₁ | Caldera $\rightarrow$ P $\rightarrow$ C₁ | 0,01 + 0,24 = 0,25 |
| C₂ | Caldera $\rightarrow$ P $\rightarrow$ S $\rightarrow$ C₂ | 0,01 + 0,16 + 0,07 = 0,24 |
| C₃ | Caldera $\rightarrow$ P $\rightarrow$ S $\rightarrow$ T $\rightarrow$ C₃ | 0,01 + 0,16 + 0,12 + 0,07 = 0,36 |
| C₄ | Caldera $\rightarrow$ P $\rightarrow$ S $\rightarrow$ T $\rightarrow$ C₄ | 0,01 + 0,16 + 0,12 + 0,09 = 0,38 |




