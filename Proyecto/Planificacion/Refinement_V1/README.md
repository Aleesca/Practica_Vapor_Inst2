# Refinement V1 - Correcciones Integrales de plantilla.tex

**Ubicación**: `Proyecto/Planificacion/Refinement_V1/`  
**Fecha de orquestación**: 26 de marzo de 2026  
**Estado**: ✅ Planificación completada / ⏳ Pendiente de ejecución  
**Documento objetivo**: `Practica_Vapor_LaTeX/plantilla.tex`  
**Versión**: V1

---

## 🎯 Objetivo General

Realizar correcciones integrales al documento LaTeX de la memoria técnica, abordando tres áreas críticas:

1. **Errores de contenido técnico** - Datos incorrectos, redundancias, información faltante
2. **Errores de formato LaTeX** - Tablas que exceden margen, ecuaciones largas, estilo de párrafos
3. **Reorganización estructural** - Mover 28 figuras de tramos a anejos para reducir densidad del cuerpo principal

---

## 📄 Documentos de la Orquestación

| # | Documento | Propósito | Tareas | Prioridad |
|---|-----------|-----------|--------|-----------|
| **0** | **MASTER_CHECKLIST.md** | **Punto de entrada principal** | **19 tareas consolidadas** | **Usar primero** |
| 1 | **errores_a_corregir.md** | Errores de contenido técnico | 9 errores detallados | HIGH |
| 2 | **formatting_fix.md** | Problemas de formato LaTeX | 9 problemas con soluciones | MEDIUM-HIGH |
| 3 | **Instrucciones_adicionales.md** | Reorganización de figuras | 8 pasos para mover figuras | HIGH |
| 4 | **plan_refinement_conclusiones.md** | Plan para secciones finales | Conclusiones + bibliografía | MEDIUM |

---

## 📊 Estadísticas

### Tareas por prioridad
- 🔴 **HIGH**: 8 tareas (42%)
- 🟡 **MEDIUM**: 8 tareas (42%)
- 🟢 **LOW**: 3 tareas (16%)

### Esfuerzo estimado
- **Total**: 6-8 horas para ejecutor experimentado
- **Por fase**:
  - Fase 1 (Eliminaciones): 2-3 horas
  - Fase 2 (Tablas): 1-2 horas
  - Fase 3 (Ecuaciones): 0.5-1 hora
  - Fase 4 (Párrafos): 0.5-0.75 horas
  - Fase 5 (Figuras): 2-3 horas
  - Fase 6 (Reestructuración): 1-2 horas

### Impacto esperado
- ✅ **Reducción de páginas**: ~15-20 páginas
- ✅ **Figuras movidas**: 24 figuras (TR2-TR7) → Anejos 2 y 3
- ✅ **Correcciones técnicas**: Rugosidad (0.045 → 0.02 mm), tablas redundantes eliminadas
- ✅ **Mejora de formato**: Todas las tablas caben en margen, ecuaciones bien formateadas

---

## 🚀 Cómo Usar Esta Orquestación

### **PASO 1: Leer MASTER_CHECKLIST.md**
El documento principal que consolida todas las tareas.

```bash
# Abrir el checklist maestro
cat MASTER_CHECKLIST.md
```

**Contiene**:
- Resumen ejecutivo
- Matriz de prioridades
- 6 fases de ejecución con orden recomendado
- Checkpoints de verificación
- Comandos bash útiles

### **PASO 2: Crear backup**
Antes de comenzar cualquier modificación:

```bash
cd Practica_Vapor_LaTeX
cp plantilla.tex plantilla_backup_$(date +%Y%m%d_%H%M).tex
```

### **PASO 3: Ejecutar Fase 1**
Comenzar con las eliminaciones críticas (ver MASTER_CHECKLIST.md, Fase 1):

- Tarea D2: Eliminar Tabla 2.8
- Tarea D1: Corregir rugosidad a 0.02 mm
- Tarea P1: Eliminar tabla redundante
- ...

**Para cada tarea**, consultar el documento específico:
- Errores de contenido → `errores_a_corregir.md#D2` (ejemplo)
- Problemas de formato → `formatting_fix.md#F-T1` (ejemplo)

### **PASO 4: Continuar con Fases 2-6**
Seguir el orden establecido en `MASTER_CHECKLIST.md`, compilando el PDF después de cada checkpoint.

---

## 🔗 Referencias Cruzadas

Los documentos están interconectados:

```
MASTER_CHECKLIST.md (hub central)
    ├── → errores_a_corregir.md (tareas P1, P2, M1-M3, D1-D4)
    ├── → formatting_fix.md (tareas F-T1 a F-T7, F-E1, F-P1)
    └── → Instrucciones_adicionales.md (tareas I-STEP1 a I-STEP8)

errores_a_corregir.md ↔ formatting_fix.md
    └── Cross-refs: Tabla 2.8 (D2 ↔ F-T7)

errores_a_corregir.md ↔ Instrucciones_adicionales.md
    └── Cross-refs: Formato de captions

formatting_fix.md ↔ Instrucciones_adicionales.md
    └── Cross-refs: Ajuste de figuras anchas
```

**Nota**: Todas las rutas son relativas y funcionan dentro de `Refinement_V1/`.

---

## ✅ Checklist de Progreso

### Planificación
- [x] Documentos enriquecidos creados
- [x] Master checklist consolidado
- [x] Cross-references verificadas
- [x] Orquestación organizada en `Refinement_V1/`

### Ejecución (pendiente)
- [ ] Backup de plantilla.tex creado
- [ ] Fase 1 completada (Eliminaciones)
- [ ] Fase 2 completada (Tablas)
- [ ] Fase 3 completada (Ecuaciones)
- [ ] Fase 4 completada (Párrafos)
- [ ] Fase 5 completada (Figuras)
- [ ] Fase 6 completada (Reestructuración opcional)

### Verificación
- [ ] Compilación exitosa sin errores
- [ ] Referencias cruzadas funcionan
- [ ] Índice de figuras correcto
- [ ] PDF verificado visualmente
- [ ] Reducción de páginas confirmada

---

## 📝 Notas Importantes

### Estructura del proyecto
Esta orquestación está ubicada directamente en `Proyecto/Planificacion/Refinement_V1/` sin carpetas intermedias redundantes. La estructura es:

```
Proyecto/
└── Planificacion/
    ├── README.md                          (Índice de orquestaciones)
    ├── index.md                           (Índice de secciones técnicas)
    ├── 2026-03-13-steam-agent-skills.md  (Orquestación anterior)
    └── Refinement_V1/                     (Esta orquestación)
        ├── README.md
        ├── MASTER_CHECKLIST.md
        ├── errores_a_corregir.md
        ├── formatting_fix.md
        └── Instrucciones_adicionales.md
```

### Sobre las referencias relativas
Las referencias entre documentos (ej: `errores_a_corregir.md#D2`) funcionan correctamente porque:
- Todos los documentos están en la misma carpeta `Refinement_V1/`
- Los anchors (#) son estables y no cambian con el movimiento

### Sobre plan_refinement_conclusiones.md
Este documento está incluido en `Refinement_V1/` porque:
- Es parte de la misma orquestación de refinamiento
- Aborda las secciones finales (conclusiones, bibliografía) del mismo documento objetivo
- Comparte la misma fecha y contexto de ejecución

### Orden de ejecución
El orden propuesto en `MASTER_CHECKLIST.md` minimiza el trabajo duplicado:
1. Primero eliminar → luego formatear (evita formatear lo que se va a eliminar)
2. Primero correcciones pequeñas → luego reorganización grande
3. Checkpoints frecuentes para detectar errores temprano

---

## 🔧 Herramientas y Comandos

### Búsqueda y verificación
```bash
# Buscar rugosidad incorrecta
grep -n "0{,}045\|0.045" Practica_Vapor_LaTeX/plantilla.tex

# Buscar Tabla 2.8
grep -n "tab:rugosidades-materiales" Practica_Vapor_LaTeX/plantilla.tex

# Verificar figuras de tramos
grep -n "includegraphics.*TR[2-7]" Practica_Vapor_LaTeX/plantilla.tex | grep -v "Anejo"
```

### Compilación
```bash
cd Practica_Vapor_LaTeX
pdflatex plantilla.tex
bibtex plantilla
pdflatex plantilla.tex
pdflatex plantilla.tex
```

---

## 📅 Historial

| Fecha | Evento | Responsable |
|-------|--------|-------------|
| 2026-03-26 20:30 | Orquestación enriquecida completada | OpenCode |
| 2026-03-26 14:46 | Plan inicial de refinamiento (conclusiones) | User |
| 2026-03-26 (futuro) | Inicio de ejecución | TBD |

---

## 📞 Soporte

Para dudas sobre tareas específicas:
1. **Contenido técnico**: Consultar `errores_a_corregir.md` (incluye ejemplos LaTeX, líneas exactas)
2. **Formato LaTeX**: Consultar `formatting_fix.md` (múltiples opciones de solución)
3. **Reorganización**: Consultar `Instrucciones_adicionales.md` (código completo para copiar/pegar)
4. **Visión general**: Consultar `MASTER_CHECKLIST.md` (matriz de prioridades, orden de ejecución)

---

**Estado**: ✅ Listo para ejecución  
**Próximo paso**: Crear backup y comenzar con `MASTER_CHECKLIST.md` Fase 1, Tarea D2

---

**FIN DEL README**
