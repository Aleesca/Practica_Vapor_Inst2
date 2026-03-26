# MASTER CHECKLIST - CORRECCIONES MEMORIA TÉCNICA
**Proyecto**: Práctica de Vapor - Instalaciones II  
**Documento objetivo**: `Practica_Vapor_LaTeX\plantilla.tex`  

---


### Distribución por categoría
| Categoría | Tareas | Prioridad alta | Documentos |
|-----------|--------|----------------|------------|
| **Errores de contenido** | 9 | 5 | `errores_a_corregir.md` |
| **Errores de formato** | 9 | 2 | `formatting_fix.md` |
| **Reorganización figuras** | 1 | 1 | `Instrucciones_adicionales.md` |

### Impacto esperado
- **Reducción de páginas**: ~15-20 páginas (eliminación de figuras redundantes en cuerpo principal)
- **Mejora de legibilidad**: Secciones principales más concisas, material técnico en anejos
- **Corrección de incoherencias**: Valores de rugosidad, tablas redundantes, ecuaciones duplicadas
- **Mejora de formato**: Tablas que no exceden margen, ecuaciones bien formateadas, párrafos con estilo correcto

---

## MATRIZ DE PRIORIDADES

### 🔴 PRIORIDAD HIGH (ejecutar primero)
| ID | Tarea | Esfuerzo | Documento | Línea |
|----|-------|----------|-----------|-------|
| **P1** | Eliminar tabla redundante de requerimientos | MEDIUM | errores_a_corregir.md | ~118-180 |
| **M2** | Verificar/reemplazar Figura 2.1 (caldera sin economizador) | MEDIUM | errores_a_corregir.md | ~580 |
| **M3** | Añadir figura faltante seleccion_presion.pdf | EASY | errores_a_corregir.md | ~435 |
| **D1** | Corregir valores de rugosidad (0.02 mm, no 0.045 mm) | MEDIUM | errores_a_corregir.md | ~654, 1083 |
| **D2** | ELIMINAR Tabla 2.8 completamente | EASY | errores_a_corregir.md | ~661-678 |
| **F-T4** | Tabla 2.45 - Evaluar alternativa sin tabla | MEDIUM | formatting_fix.md | buscar |
| **F-P1** | Cambiar formato global de \paragraph (sin negrita, subrayado, nueva línea) | MEDIUM | formatting_fix.md | preámbulo |
| **I-ALL** | Reorganizar 28 figuras de tramos a Anejos 2 y 3 | MEDIUM-HIGH | Instrucciones_adicionales.md | múltiples |

### 🟡 PRIORIDAD MEDIUM
| ID | Tarea | Esfuerzo | Documento | Línea |
|----|-------|----------|-----------|-------|
| **D3** | Eliminar tablas duplicadas de longitudes equivalentes | MEDIUM | errores_a_corregir.md | ~719, 820 |
| **D4** | Reestructurar sección 2.2.2 (concepto longitud equivalente) | HARD | errores_a_corregir.md | ~783-859 |
| **F-T1** | Ajustar formato Tabla 1.2 | EASY | formatting_fix.md | ~176 |
| **F-T2** | Ajustar formato Tabla 2.12 | EASY | formatting_fix.md | buscar |
| **F-T3** | Ajustar formato Tabla 2.44 | EASY | formatting_fix.md | buscar |
| **F-T5** | Ajustar formato Tabla 2.47 | EASY | formatting_fix.md | buscar |
| **F-T6** | Ajustar formato Tabla 2.48 | EASY | formatting_fix.md | buscar |
| **F-E1** | Convertir ecuaciones largas: equation → align | MEDIUM | formatting_fix.md | múltiples |

### 🟢 PRIORIDAD LOW
| ID | Tarea | Esfuerzo | Documento | Línea |
|----|-------|----------|-----------|-------|
| **P2** | Eliminar duplicado de Ecuación 1.1 | EASY | errores_a_corregir.md | buscar |
| **M1** | Eliminar columna sobrecalentamiento en tablas | EASY | errores_a_corregir.md | ~287, 521 |

---

## ORDEN DE EJECUCIÓN RECOMENDADO

### FASE 1: ELIMINACIONES Y CORRECCIONES CRÍTICAS
Eliminar contenido innecesario antes de formatear para evitar trabajo duplicado.

1. ✅ **D2** - ELIMINAR Tabla 2.8 (rugosidades) → `errores_a_corregir.md#D2`
   ```bash
   # Buscar y eliminar todo el entorno de tabla
   grep -n "tab:rugosidades-materiales" Practica_Vapor_LaTeX/plantilla.tex
   ```

2. ✅ **D1** - Corregir rugosidad en texto y cálculos (0.045 → 0.02 mm) → `errores_a_corregir.md#D1`
   ```bash
   # Buscar todas las apariciones de 0.045
   grep -n "0{,}045\|0.045" Practica_Vapor_LaTeX/plantilla.tex
   ```

3. ✅ **P1** - Eliminar tabla redundante de requerimientos → `errores_a_corregir.md#P1`
   ```bash
   # Identificar cuál tabla es redundante
   grep -n -B5 "caption.*requerimientos\|caption.*consumo" Practica_Vapor_LaTeX/plantilla.tex | head -20
   ```

4. ✅ **M3** - Añadir figura faltante seleccion_presion.pdf → `errores_a_corregir.md#M3`
   - Insertar después de "Determinación de la presión de diseño" (~línea 435)
   - Usar código LaTeX provisto en `errores_a_corregir.md#M3`

5. ✅ **M2** - Verificar y corregir Figura 2.1 (caldera) → `errores_a_corregir.md#M2`
   - Revisar si modelo M33A tiene economizador
   - Si no: actualizar caption para clarificar
   - Si sí: reemplazar con figura correcta del catálogo

6. ✅ **D3** - Eliminar tablas duplicadas de longitudes equivalentes → `errores_a_corregir.md#D3`
   - Mantener solo figura con `perdidas_carga_accesorios.png`
   - Eliminar tablas manuales redundantes

7. ✅ **P2** - Eliminar ecuación duplicada (caudal total) → `errores_a_corregir.md#P2`
   - Buscar Ecuación 1.1 duplicada en secciones posteriores

8. ✅ **M1** - Eliminar columna sobrecalentamiento (opcional) → `errores_a_corregir.md#M1`
   - Considerar si mantener texto explicativo
   - Eliminar solo columnas en tablas

**🔍 CHECKPOINT 1**: Compilar PDF y verificar que no hay errores de referencias rotas.

---

### FASE 2: FORMATO DE TABLAS
Ajustar tablas restantes después de eliminaciones.

9. ✅ **F-T4** - Tabla 2.45: evaluar alternativa sin tabla → `formatting_fix.md#F-T4`
   - Leer contenido de la tabla
   - Decidir: ¿lista?, ¿texto inline?, ¿figura/diagrama?
   - Implementar alternativa

10. ✅ **F-T1** - Ajustar Tabla 1.2 → `formatting_fix.md#F-T1`
    - Probar: reducir `\tabcolsep`, usar `\resizebox`, ajustar columnas

11. ✅ **F-T2, F-T3, F-T5, F-T6** - Ajustar Tablas 2.12, 2.44, 2.47, 2.48 → `formatting_fix.md`
    - Aplicar misma estrategia: `\small`, `\tabcolsep`, `\resizebox`
    - Verificar una por una en PDF compilado

**🔍 CHECKPOINT 2**: Compilar PDF y verificar que todas las tablas caben en márgenes.

---

### FASE 3: FORMATO DE ECUACIONES

12. ✅ **F-E1** - Convertir ecuaciones largas → `formatting_fix.md#F-E1`
    - Compilar y revisar visualmente qué ecuaciones se salen de margen
    - Convertir `equation` → `align` o `split`
    - Usar `\nonumber` en líneas intermedias
    - Verificar que labels siguen funcionando

**🔍 CHECKPOINT 3**: Compilar PDF y verificar que no hay ecuaciones con overflow.

---

### FASE 4: FORMATO DE PÁRRAFOS 

13. ✅ **F-P1** - Cambiar formato global de \paragraph → `formatting_fix.md#F-P1`
    - Añadir código al preámbulo (paquetes `titlesec` y `ulem`)
    - Configurar `\titleformat` y `\titlespacing`
    - Compilar y revisar ~20 apariciones de `\paragraph`
    - Si necesario: añadir línea en blanco después de cada `\paragraph{}`

**🔍 CHECKPOINT 4**: Compilar PDF y verificar estilo de los ~20 párrafos.

---

### FASE 5: REORGANIZACIÓN DE FIGURAS 

14. ✅ **I-STEP1** - Identificar figuras actuales → `Instrucciones_adicionales.md#PASO1`
    ```bash
    grep -n "includegraphics.*dibujos_tramos\|includegraphics.*calculos_tramos" Practica_Vapor_LaTeX/plantilla.tex
    ```

15. ✅ **I-STEP2** - Crear Anejo 2 (Dibujos) → `Instrucciones_adicionales.md#PASO2`
    - Copiar código LaTeX completo del documento
    - Incluir 14 figuras (7 vapor + 7 condensados)
    - Verificar orden: primero vapor (TR1-TR7), luego condensados (TR1-TR7)

16. ✅ **I-STEP3** - Crear Anejo 3 (Cálculos) → `Instrucciones_adicionales.md#PASO3`
    - Copiar código LaTeX completo del documento
    - Incluir 14 figuras con rotación `angle=90`
    - Mismo orden: vapor primero, condensados después

17. ✅ **I-STEP4-5** - Mantener TR1 en cuerpo, mover TR2-TR7 → `Instrucciones_adicionales.md#PASO4-5`
    - **Actualizar captions de TR1** en secciones 2.2.3 y 2.3.4
    - **Eliminar figuras de TR2-TR7** de secciones principales
    - **Reemplazar con referencias** a Anejos

18. ✅ **I-STEP6** - Actualizar formato de captions → `Instrucciones_adicionales.md#PASO6`
    - Todas las figuras de tramos: "Fuente: [Herramienta]. Elaboración grupal."
    - Verificar con script:
    ```bash
    grep -A 1 "includegraphics.*_tramos/" Practica_Vapor_LaTeX/plantilla.tex | grep "caption" | grep -v "Elaboración grupal"
    ```

19. ✅ **I-STEP7** - Actualizar referencias cruzadas → `Instrucciones_adicionales.md#PASO7`
    - Buscar `\ref{fig:.*tr[0-9]}`
    - Actualizar para apuntar a nuevos labels en Anejos
    - Compilar 2 veces para resolver referencias

**🔍 CHECKPOINT 5**: Compilar PDF 2 veces y verificar:
- No hay referencias indefinidas
- Índice de figuras correcto
- Anejos 2 y 3 visibles en TOC

---

### FASE 6: REESTRUCTURACIÓN OPCIONAL

20. ✅ **D4** - Reestructurar sección 2.2.2 → `errores_a_corregir.md#D4`
    - Revisar manualmente la sección "Concepto de longitud equivalente"
    - Comparar con contenido previo
    - Decidir: ¿eliminar?, ¿consolidar?, ¿reducir?
    - Implementar según decisión

**🔍 CHECKPOINT 6**: Compilar PDF y verificar coherencia de sección 2.2.

---

## CHECKLIST POR CATEGORÍA

### 📋 CATEGORÍA A: ERRORES DE CONTENIDO
**Documento**: `errores_a_corregir.md`

#### Sección 1: Puntos de Consumo
- [ ] **P1-HIGH**: Eliminar tabla redundante (mantener solo Tabla 1.2)
- [ ] **P2-LOW**: Eliminar duplicado de Ecuación 1.1 en secciones posteriores

#### Sección 2: Metodología
- [ ] **M1-LOW**: Eliminar columna "grado de sobrecalentamiento" en tablas (~líneas 287, 521)
- [ ] **M2-HIGH**: Verificar/corregir Figura 2.1 (esquema caldera VITOMAX, ~línea 580)
- [ ] **M3-HIGH**: Añadir figura faltante `seleccion_presion.pdf` en sección 2.1.4 (~línea 435)

#### Sección 3: Dimensionado Hidráulico
- [ ] **D1-HIGH**: Corregir rugosidad absoluta a 0.02 mm (no 0.045 mm) en texto y cálculos
- [ ] **D2-HIGH**: ELIMINAR Tabla 2.8 (rugosidades de materiales) completamente
- [ ] **D3-MEDIUM**: Eliminar tablas duplicadas de longitudes equivalentes (mantener solo imagen)
- [ ] **D4-MEDIUM**: Reestructurar sección 2.2.2 (concepto longitud equivalente repetido)

---

### 📐 CATEGORÍA B: ERRORES DE FORMATO
**Documento**: `formatting_fix.md`

#### Tablas con problemas de margen
- [ ] **F-T1-MEDIUM**: Tabla 1.2 - Ajustar ancho de columnas
- [ ] **F-T2-MEDIUM**: Tabla 2.12 - Ajustar formato para que entre en margen
- [ ] **F-T3-MEDIUM**: Tabla 2.44 - Ajustar formato
- [ ] **F-T4-HIGH**: Tabla 2.45 - **Evaluar alternativa sin tabla** (lista, texto, figura)
- [ ] **F-T5-MEDIUM**: Tabla 2.47 - Ajustar formato
- [ ] **F-T6-MEDIUM**: Tabla 2.48 - Ajustar formato
- [ ] **F-T7-HIGH**: Tabla 2.8 - ⛔ **ELIMINAR** (ver D2 en errores_a_corregir.md)

#### Ecuaciones que exceden línea
- [ ] **F-E1-MEDIUM**: Convertir ecuaciones largas de `equation` a `align` o `split`
  - [ ] Compilar y identificar ecuaciones con overflow visual
  - [ ] Convertir una por una usando estrategias de `formatting_fix.md#F-E1`
  - [ ] Verificar que labels (`\label{}`) siguen funcionando
  - [ ] Usar `\nonumber` en líneas intermedias

#### Estilo de párrafos
- [ ] **F-P1-HIGH**: Cambiar formato de `\paragraph{}`
  - [ ] Añadir paquetes `titlesec` y `ulem` al preámbulo
  - [ ] Configurar `\titleformat` y `\titlespacing` (código en `formatting_fix.md#F-P1`)
  - [ ] Compilar y verificar ~20 apariciones
  - [ ] Resultado: sin negrita, con subrayado, contenido en nueva línea

---

### 🖼️ CATEGORÍA C: REORGANIZACIÓN DE FIGURAS
**Documento**: `Instrucciones_adicionales.md`

#### Preparación
- [ ] **I-PREP**: Crear backup del documento
  ```bash
  cp Practica_Vapor_LaTeX/plantilla.tex Practica_Vapor_LaTeX/plantilla_backup_$(date +%Y%m%d).tex
  ```
- [ ] **I-STEP1**: Identificar y registrar ubicaciones actuales de las 28 figuras de tramos

#### Creación de Anejos
- [ ] **I-STEP2**: Crear Anejo 2 - Diagramas esquemáticos (14 figuras)
  - [ ] Subsección A2.2: Red de Vapor (7 figuras: TR1-TR7)
  - [ ] Subsección A2.3: Red de Condensados (7 figuras: TR1-TR7)
  - [ ] Verificar orden: vapor primero, condensados después
  
- [ ] **I-STEP3**: Crear Anejo 3 - Hojas de cálculo (14 figuras)
  - [ ] Subsección A3.2: Red de Vapor (7 figuras: TR1-TR7)
  - [ ] Subsección A3.3: Red de Condensados (7 figuras: TR1-TR7)
  - [ ] Usar rotación `angle=90,origin=c` para hojas de cálculo

#### Reorganización del cuerpo principal
- [ ] **I-STEP4-5**: Gestión de figuras en secciones 2.2 y 2.3
  - [ ] **MANTENER** en cuerpo: 4 figuras de TR1 (2 en 2.2.3, 2 en 2.3.4)
  - [ ] Actualizar captions de TR1 con formato requerido
  - [ ] **ELIMINAR** de cuerpo: 24 figuras de TR2-TR7
  - [ ] Reemplazar con referencias textuales a Anejos
  - [ ] Mantener tablas resumen de resultados (solo mover figuras grandes)

#### Formato y referencias
- [ ] **I-STEP6**: Actualizar formato de TODOS los captions
  - [ ] Dibujos: "Fuente: Herramienta de diseño. Elaboración grupal."
  - [ ] Cálculos: "Fuente: Herramienta de cálculo. Elaboración grupal."
  - [ ] Ejecutar script de verificación (ver `Instrucciones_adicionales.md#PASO6`)

- [ ] **I-STEP7**: Actualizar referencias cruzadas
  - [ ] Buscar todas las referencias `\ref{fig:.*tr[0-9]}`
  - [ ] Actualizar TR2-TR7 para apuntar a Anejos (usar `fig:anejo2-...` y `fig:anejo3-...`)
  - [ ] Mantener referencias a TR1 en cuerpo principal
  - [ ] Compilar **2 veces** para resolver referencias

#### Verificación
- [ ] **I-STEP8**: Verificación final de reorganización
  - [ ] Compilación sin errores
  - [ ] No hay warnings de referencias indefinidas
  - [ ] Índice de figuras correcto (incluye Anejos)
  - [ ] Anejos 2 y 3 aparecen en índice general (TOC)
  - [ ] Secciones 2.2 y 2.3 solo muestran TR1
  - [ ] Anejos contienen 28 figuras totales
  - [ ] Todos los captions tienen formato correcto

---

## DOCUMENTOS DE REFERENCIA

### Estructura de documentos
```
Proyecto/Planificacion/Planning/
├── errores_a_corregir.md          ← Errores de contenido técnico
├── formatting_fix.md              ← Errores de formato LaTeX
├── Instrucciones_adicionales.md   ← Reorganización de figuras
└── MASTER_CHECKLIST.md           ← Este documento (consolidado)
```

### Matriz de cross-references

| Tarea en MASTER | Documento detallado | Sección |
|----------------|---------------------|---------|
| P1, P2 | errores_a_corregir.md | SECCIÓN 1 |
| M1, M2, M3 | errores_a_corregir.md | SECCIÓN 2 |
| D1, D2, D3, D4 | errores_a_corregir.md | SECCIÓN 3 |
| F-T1 a F-T7 | formatting_fix.md | CATEGORÍA 1: Tablas |
| F-E1 | formatting_fix.md | CATEGORÍA 2: Ecuaciones |
| F-P1 | formatting_fix.md | CATEGORÍA 3: Párrafos |
| I-ALL | Instrucciones_adicionales.md | PASOS 1-8 |

### Cross-references entre tareas

| Tarea principal | Relacionada con | Tipo de relación |
|----------------|-----------------|------------------|
| **D2** (eliminar Tabla 2.8) | **F-T7** | Misma tabla - D2 es prioritario |
| **D1** (rugosidad 0.02 mm) | **D2** | Consolidar info antes de eliminar tabla |
| **D3** (eliminar tablas equiv.) | **D4** (reestructurar 2.2.2) | Ambas simplifican sección 2.2 |
| **I-STEP6** (captions) | **M2, M3** | Aplicar mismo formato a todas figuras |
| **F-P1** (párrafos) | Todas las demás | Aplicar al final para evitar doble trabajo |

---

## VERIFICACIÓN FINAL

### Checklist de compilación
- [ ] **Compilación exitosa**: `pdflatex plantilla.tex` sin errores
- [ ] **Referencias resueltas**: No warnings de `undefined reference`
- [ ] **Bibliografía**: `bibtex plantilla` si es necesario
- [ ] **Índices actualizados**: Compilar 2-3 veces para resolver todas las referencias
- [ ] **Tabla de contenidos (TOC)**: Completa y correcta, incluye Anejos
- [ ] **Lista de figuras**: Todas las figuras listadas, numeración secuencial
- [ ] **Lista de tablas**: Todas las tablas listadas correctamente

### Checklist de contenido
- [ ] **Sin tablas redundantes**: Tabla 2.8 eliminada, tabla de requerimientos única
- [ ] **Rugosidad correcta**: Todos los valores son 0.02 mm (no 0.045 mm)
- [ ] **Figuras completas**: 
  - [ ] Figura 2.1 verificada/corregida
  - [ ] Figura seleccion_presion.pdf añadida
- [ ] **Ecuaciones duplicadas eliminadas**: Ecuación 1.1 aparece solo una vez
- [ ] **Secciones 2.2 y 2.3**: Solo muestran TR1, resto referenciado a Anejos

### Checklist de formato
- [ ] **Todas las tablas caben en margen**: Sin overflow horizontal
- [ ] **Tabla 2.45 resuelta**: Alternativa sin tabla implementada
- [ ] **Ecuaciones no exceden línea**: Todas usan `align`/`split` si son largas
- [ ] **Párrafos con estilo correcto**: 
  - [ ] Sin negrita
  - [ ] Con subrayado
  - [ ] Contenido en nueva línea
- [ ] **Captions uniformes**: Todas las figuras de tramos incluyen "Elaboración grupal"

### Checklist de Anejos
- [ ] **Anejo 2 completo**: 14 figuras (7 vapor + 7 condensados) de dibujos
- [ ] **Anejo 3 completo**: 14 figuras (7 vapor + 7 condensados) de cálculos
- [ ] **Orden correcto**: Primero vapor (TR1-TR7), luego condensados (TR1-TR7)
- [ ] **Referencias funcionan**: Todas las refs a `fig:anejo2-...` y `fig:anejo3-...` correctas
- [ ] **Anejos en TOC**: Aparecen en índice general del documento

### Revisión visual del PDF
- [ ] **Portada**: Correcta y sin cambios no deseados
- [ ] **Índices (TOC, LOF, LOT)**: Completos y sin huecos de numeración
- [ ] **Sección 1**: Tablas y figuras correctas
- [ ] **Sección 2.1-2.2**: Figuras correctas, solo TR1 visible
- [ ] **Sección 2.3**: Figuras correctas, solo TR1 visible
- [ ] **Sección 3-4**: Sin cambios (Conclusiones y Bibliografía)
- [ ] **Anejo 2**: Todas las figuras se visualizan correctamente
- [ ] **Anejo 3**: Todas las hojas de cálculo legibles (rotadas si necesario)

### Estadísticas finales
Después de todas las correcciones, verificar:
- [ ] **Número de páginas**: Reducción de ~15-20 páginas respecto a original
- [ ] **Número de figuras**: 
  - Cuerpo principal: ✓ figuras (incluye 4 de TR1)
  - Anejos: 28 figuras (14 en Anejo 2 + 14 en Anejo 3)
- [ ] **Número de tablas**: ✓ tablas (al menos 2 menos: Tabla 2.8 y tabla redundante)
- [ ] **Warnings en compilación**: 0 (o solo warnings menores que no afectan resultado)

---

## COMANDOS ÚTILES

### Búsqueda y verificación
```bash
# Buscar rugosidad incorrecta
grep -n "0{,}045\|0.045" Practica_Vapor_LaTeX/plantilla.tex

# Buscar Tabla 2.8
grep -n "tab:rugosidades-materiales\|Tabla 2.8" Practica_Vapor_LaTeX/plantilla.tex

# Buscar figuras de tramos en cuerpo (fuera de Anejos)
grep -n "includegraphics.*TR[2-7]" Practica_Vapor_LaTeX/plantilla.tex | grep -v "Anejo"

# Verificar captions sin "Elaboración grupal"
grep -A 1 "includegraphics.*_tramos/" Practica_Vapor_LaTeX/plantilla.tex | grep "caption" | grep -v "Elaboración grupal"

# Buscar referencias a figuras de tramos
grep -n "\\ref{fig:.*tr[0-9]}\|\\figref{.*tr" Practica_Vapor_LaTeX/plantilla.tex

# Contar apariciones de \paragraph
grep -c "\\paragraph{" Practica_Vapor_LaTeX/plantilla.tex
```

### Compilación
```bash
# Compilación completa (desde directorio del .tex)
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
bibtex plantilla
pdflatex plantilla.tex
pdflatex plantilla.tex

# Abrir PDF resultante
start plantilla.pdf  # Windows
# o
open plantilla.pdf   # macOS/Linux
```

### Backup y control de versiones
```bash
# Crear backup antes de comenzar
cp Practica_Vapor_LaTeX/plantilla.tex "Practica_Vapor_LaTeX/plantilla_backup_$(date +%Y%m%d_%H%M).tex"

# Si se usa Git
git add Practica_Vapor_LaTeX/plantilla.tex
git commit -m "Correcciones de contenido y formato según master checklist"
```

---

## NOTAS FINALES

### Recomendaciones generales
1. **Trabajar en orden**: Seguir las 6 fases propuestas minimiza trabajo duplicado
2. **Compilar frecuentemente**: Después de cada checkpoint para detectar errores temprano
3. **Backup regular**: Guardar copias antes de cambios estructurales grandes
4. **Revisar cross-references**: Algunas tareas dependen de otras (ver matriz)
5. **Verificación visual**: No confiar solo en compilación exitosa, revisar PDF

### Tiempo estimado por fase
- Fase 1 (Eliminaciones): 2-3 horas
- Fase 2 (Tablas): 1-2 horas
- Fase 3 (Ecuaciones): 0.5-1 hora
- Fase 4 (Párrafos): 0.5-0.75 horas
- Fase 5 (Figuras): 2-3 horas
- Fase 6 (Reestructuración): 1-2 horas (opcional)
- **Total**: 7.5-11.75 horas → **~6-8 horas para ejecutor experimentado**

### Equipo recomendado
- **1 persona**: Para mantener coherencia de estilo (puede hacerse todo)
- **2 personas**: División posible:
  - Persona A: Fases 1-4 (contenido y formato)
  - Persona B: Fase 5 (reorganización figuras)
  - Coordinación en Fase 6 y verificación final conjunta

### Contacto y soporte
Para dudas sobre tareas específicas, consultar los documentos detallados:
- `errores_a_corregir.md`: Incluye ejemplos LaTeX, líneas exactas, explicaciones técnicas
- `formatting_fix.md`: Incluye múltiples opciones de solución para cada problema de formato
- `Instrucciones_adicionales.md`: Incluye código LaTeX completo para copiar/pegar en Anejos

---

**Estado del documento**: ✅ COMPLETO Y LISTO PARA EJECUCIÓN  
**Próximo paso**: Comenzar con Fase 1, tarea D2 (eliminar Tabla 2.8)

---

**FIN DEL MASTER CHECKLIST**
