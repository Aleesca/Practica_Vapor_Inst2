# Skills - Fuente Única de Verdad

Este directorio contiene todas las skills especializadas del proyecto, compartidas entre OpenCode y Codex.

## 📦 Estructura

```
skills/
├── latex_drafting_skill/     # Generación de código LaTeX
│   └── skill.md
├── steam_knowledge_skill/    # Investigación de sistemas de vapor
│   └── skill.md
└── doc_tecnica_vapor/        # Documentación técnica con referencias
    ├── skill.md
    └── references/           # PDFs y documentos técnicos
```

## ✅ Convenciones

- **Nombres de carpetas**: Usar `snake_case` (guiones bajos, no guiones)
- **Archivo de manifiesto**: Siempre `skill.md` (minúsculas)
- **Rutas relativas**: Todas las rutas en manifiestos son relativas a la raíz del proyecto

## 🎯 Propósito

Esta es la **única ubicación** para skills en el proyecto. Tanto OpenCode como Codex referencian esta carpeta.

### Skills Disponibles

| Skill | Descripción | Usado por |
|-------|-------------|-----------|
| `latex_drafting_skill` | Experto en LaTeX para generar fragmentos compatibles con plantilla.tex | latex-writer |
| `steam_knowledge_skill` | Investigador de sistemas de vapor, extrae datos de Anotaciones y docs | steam-researcher |
| `doc_tecnica_vapor` | Acceso a manuales técnicos y guías en PDFs (Spirax Sarco, IDAE, Vitomax) | steam-researcher |

## 🔗 Integración

Las definiciones de agentes en `.opencode/agents/` y `.codex/agents/` referencian estas skills.

Para invocar agentes que usan estas skills:
```bash
@steam-researcher investiga la sección X
@latex-writer genera código para sección Y
```

## 📝 Migraciones Anteriores

- **21/03/2026**: Consolidación desde `.opencode/skills/`, `.codex/skills/` y `.agents/.skills/`
- Versiones antiguas archivadas en carpetas `*.backup/`

---

**Última actualización**: 2026-03-21
