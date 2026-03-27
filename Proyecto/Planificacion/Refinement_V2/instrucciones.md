# Instrucciones de Refinamiento - Versión 2

## 2.2 Red de Distribución de Vapor

### Apartados 2.2.4, 2.2.5 y 2.2.6

**Problema identificado:**
- Se están incluyendo cálculos innecesarios (repetitivos)
- Hay un exceso de tablas generadas

**Solución:**
- Incluir una tabla en formato A4 horizontal donde se incluya el resumen de todos los cálculos

### Clarificación del Cálculo de Caudales (R2-8)

**Problema identificado:**
- No existe una explicación sistemática de cómo se distribuyen los caudales en la red de vapor
- Los caudales de cada tramo aparecen sin justificación de su origen
- El lector no puede verificar de dónde provienen los valores

**Solución:**
Añadir al inicio de la sección 2.2 (antes de los criterios de dimensionado):

1. **Párrafo explicativo** sobre la topología ramificada de la red
2. **Tabla de distribución de caudales** por nodos de bifurcación:

| Nodo | Caudal entrada [kg/h] | Derivaciones | Caudales salida [kg/h] |
|------|----------------------|--------------|----------------------|
| Caldera | --- | 1 | 5400 (total) |
| P | 5400 | 2 | 679 (C1) + 3737 (P-S) |
| S | 3737 | 2 | 1359 (C2) + 2378 (S-T) |
| T | 2378 | 2 | 340 (C3) + 2038 (C4) |

3. **Lista de cálculo de caudales** por tramo:
   - TR1 (Caldera-P): Σ Ci = 5400 kg/h
   - TR2 (P-C1): C1 = 679 kg/h
   - TR3 (P-S): C2 + C3 + C4 = 1359 + 340 + 2038 = 3737 kg/h
   - TR4 (S-C2): C2 = 1359 kg/h
   - TR5 (S-T): C3 + C4 = 340 + 2038 = 2378 kg/h
   - TR6 (T-C3): C3 = 340 kg/h
   - TR7 (T-C4): C4 = 2038 kg/h

**Ubicación recomendada:** Después de línea 575, antes del párrafo "Criterio de velocidad"

## 2.3 Dimensionado Hidráulico de la Red de Condensados

**Instrucción:**
- Integrar la `Tabla 2.32` y `Tabla 2.33` en una hoja resumen en horizontal en una página dedicada en A4 horizontal
- Luego, a continuación en una página en vertical, seguir con las conclusiones

## 2.4 Aislamiento Térmico

### 2.4.2 Aislamiento de tuberías aéreas

**Instrucción:**
- En la `Tabla 2.36`, reducir el tamaño del texto

## Directrices Generales sobre Tablas

**Aplicable a:** Red de vapor y red de condensados

1. **Checkboxes:** Toda checkbox de las tablas se eliminará
2. **Columnas de unidades:** La columna de unidades de cualquier tabla se eliminará. Las unidades se pondrán en el encabezado de fila o columna correspondiente

## Directrices Generales sobre Conclusiones

**Instrucción:**
- En el desarrollo previo a las limitaciones descritas hay que descartar valores numéricos de la prosa escrita (esto no es el objetivo de una conclusión)
- Solo dejar aquellos valores que son más significativos
- Hay valores en esta conclusión que sobran

## Revisión de Redacción y Citas Bibliográficas (R2-7)

**Problema identificado:**
- Hay zonas del documento donde se referencia a normativa pero luego no se aplica el comando `\cite{}`
- Esto afecta la trazabilidad de fuentes y la integridad académica del documento

**Fuentes afectadas identificadas:**
- **DIN 2448**: Mencionada en múltiples ubicaciones sin `\cite{}`
- **Spirax Sarco**: Referenciada como guía técnica sin citar en varias secciones
- **IDAE**: Guías de eficiencia energética mencionadas sin cita
- **ISO 12241**: Norma de aislamiento térmico sin citar

**Solución:**
1. Revisar todo el documento buscando menciones de normativa sin `\cite{}`
2. Añadir `\cite{}` correspondiente a cada mención
3. Verificar que las claves de cita existen en el archivo `.bib`
4. Si faltan entradas en el `.bib`, añadirlas según el formato estándar del proyecto

**Ejemplo de corrección:**
- ANTES: "...según la norma DIN 2448, los diámetros normalizados..."
- DESPUÉS: "...según la norma DIN 2448 \cite{DIN2448}, los diámetros normalizados..."

- ANTES: "...recomendado por las guías del IDAE y fabricantes..."
- DESPUÉS: "...recomendado por las guías del IDAE \cite{IDAE2014} y fabricantes..."
