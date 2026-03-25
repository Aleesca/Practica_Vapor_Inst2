# Plan de Inicialización - Orquestación de Agentes para Práctica de Vapor

**Fecha:** 2026-03-25
**Estado:** Pendiente de implementación
**Directorio raíz:** `H:\Unidades compartidas\Practicas_Inst2\1_Vapor\`

---

## 1. Objetivo

Inicializar la orquestación de agentes definidos en `Proyecto/` para comenzar la generación automática del contenido LaTeX de la práctica de vapor en `Practica_Vapor_LaTeX/`.

---

## 2. Estado Actual del Sistema

### 2.1 Agentes Disponibles (`Proyecto/.opencode/agents/`)

| Agente | Rol | Permisos |
|--------|-----|----------|
| `task-orchestrator` | Coordinador principal del flujo | Invoca otros agentes |
| `steam-researcher` | Investigador de datos técnicos | Solo lectura (grep, find) |
| `latex-writer` | Generador de código LaTeX | Edición permitida |
| `latex-validator` | Validador de compilación LaTeX | Ejecución pdflatex/xelatex/lualatex |

### 2.2 Skills Disponibles (`Proyecto/skills/`)

| Skill | Función | Referenciado por |
|-------|---------|------------------|
| `latex_drafting_skill` | Genera fragmentos LaTeX compatibles con plantilla.tex | latex-writer |
| `steam_knowledge_skill` | Extrae datos técnicos de Anotaciones/ y manuales | steam-researcher |
| `doc_tecnica_vapor` | Acceso a PDFs técnicos (Spirax Sarco, IDAE, Vitomax) | steam-researcher |

### 2.3 Estado de Archivos Clave

| Archivo | Estado |
|---------|--------|
| `Proyecto/Planificacion/Planning/index.md` | 27 tareas pendientes `[ ]` |
| `Practica_Vapor_LaTeX/staging.tex` | Vacío (buffer listo) |
| `Practica_Vapor_LaTeX/plantilla.tex` | 200 líneas, estructura base con secciones esquemáticas |
| `Proyecto/.agents/progress.txt` | Vacío (sin historial) |
| `Proyecto/Anotaciones/` | 8 archivos con datos técnicos |

---

## 3. Decisiones del Usuario

| Aspecto | Decisión |
|---------|----------|
| Ubicación de config | Copiar `opencode.json` a la raíz `1_Vapor/` |
| Modo de operación | Siguiente pendiente (semi-automático) |
| Destino del LaTeX | `staging.tex` como buffer temporal |

---

## 4. Plan de Implementación


### Paso 1: Actualizar rutas internas en los prompts de agentes

En cada archivo `.md` de agente, verificar y ajustar:

| Referencia actual | Ruta correcta desde raíz |
|-------------------|--------------------------|
| `Proyecto/Planificacion/index.md` | `Proyecto/Planificacion/Planning/index.md` |
| `Practica_Vapor_LaTeX/staging.tex` | `Practica_Vapor_LaTeX/staging.tex` ✓ |
| `Practica_Vapor_LaTeX/plantilla.tex` | `Practica_Vapor_LaTeX/plantilla.tex` ✓ |
| `skills/` | `Proyecto/skills/` |
| `Anotaciones/` | `Proyecto/Anotaciones/` |

### Paso 2: Verificar prerequisitos

- [ ] `pdflatex` disponible en PATH del sistema
- [ ] `staging.tex` accesible y vacío
- [ ] `plantilla.tex` compila correctamente
- [ ] Figuras referenciadas existen en `Practica_Vapor_LaTeX/Figuras/`

### Paso 3: Iniciar orquestación - Primera tarea

**Tarea:** `1.1` - Objetivo del proyecto
**Ubicación:** `Proyecto/Planificacion/Planning/index.md`, línea 4
**Fuente de datos:** `Proyecto/Anotaciones/intro.md`

**Flujo a ejecutar:**

1. Invocar `@task-orchestrator` con: `procesa la siguiente tarea pendiente`
2. El orquestador ejecutará:
   - **Fase 1:** Lee `index.md`, identifica tarea `1.1`
   - **Fase 2:** Invoca `@steam-researcher` para investigar en `Anotaciones/intro.md`
   - **Fase 3:** Invoca `@latex-writer` para generar fragmento LaTeX
   - **Fase 4:** Invoca `@latex-validator` para verificar compilación
   - **Fase 5:** Escribe resultado en `staging.tex`, solicita confirmación
3. Si validación falla (máx 3 intentos), reportar al usuario
4. Tras confirmación, marcar `[x]` en `index.md` y registrar en `progress.txt`

---

## 5. Archivos a Crear/Modificar

| Archivo | Acción | Contenido |
|---------|--------|-----------|
| `1_Vapor/.opencode/opencode.json` | Crear | Configuración con rutas ajustadas |
| `1_Vapor/.opencode/agents/task-orchestrator.md` | Crear | Prompt del orquestador (copia con rutas corregidas) |
| `1_Vapor/.opencode/agents/steam-researcher.md` | Crear | Prompt del investigador |
| `1_Vapor/.opencode/agents/latex-writer.md` | Crear | Prompt del redactor |
| `1_Vapor/.opencode/agents/latex-validator.md` | Crear | Prompt del validador |
| `Practica_Vapor_LaTeX/staging.tex` | Modificar | Contenido LaTeX generado (append) |
| `Proyecto/Planificacion/Planning/index.md` | Modificar | Marcar tareas `[ ]` → `[x]` |
| `Proyecto/.agents/progress.txt` | Modificar | Registrar aprendizajes por sesión |

---

## 6. Riesgos y Consideraciones

| Riesgo | Mitigación |
|--------|------------|
| Skills no detectados por OpenCode | Incluir instrucciones directamente en los prompts de agentes |
| `pdflatex` no disponible en sistema | Verificar prerequisitos antes de iniciar |
| Figuras faltantes en `Figuras/` | El latex-writer debe indicar `[FIGURA FALTANTE: nombre]` |
| Errores de compilación recurrentes | Máximo 3 intentos de corrección, luego intervención manual |
| Datos insuficientes en Anotaciones/ | steam-researcher reporta datos faltantes; orquestador solicita decisión al usuario |

---

## 7. Orden de Ejecución Sugerido

```
1.  Crear .opencode/ en raíz
2.  Copiar y ajustar archivos de configuración
3.  Verificar prerequisitos (pdflatex, figuras, compilación)
4.  Ejecutar tarea 1.1 (Introducción - Objetivo)
5.  Evaluar resultado y ajustar prompts si es necesario
6.  Continuar con tareas 1.2, 1.3...
7.  Procesar sección 2 (Metodología) completa
8.  Procesar sección 2.3 (Red de Condensados)
9.  Procesar sección 2.4 (Aislamiento)
10. Compilar documento completo y verificar
```

---

## 8. Comando de Inicio

Una vez implementado el plan, iniciar con:

```
@task-orchestrator procesa la siguiente tarea pendiente
```

---

**Fin del plan.**
