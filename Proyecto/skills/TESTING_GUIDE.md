# Guía de Pruebas Post-Reorganización

Esta guía te ayudará a verificar que la reorganización de skills se completó exitosamente.

## ✅ Verificación Rápida

### 1. Estructura de Archivos

Verifica que existan estos directorios y archivos:

```powershell
# Desde la raíz del proyecto
cd "H:\Unidades compartidas\Practicas_Inst2\1_Vapor\Proyecto"

# Verificar nueva estructura
Test-Path "skills\latex_drafting_skill\skill.md"        # Debe ser True
Test-Path "skills\steam_knowledge_skill\skill.md"       # Debe ser True
Test-Path "skills\doc_tecnica_vapor\skill.md"           # Debe ser True
Test-Path "skills\doc_tecnica_vapor\references"         # Debe ser True

# Verificar backups
Test-Path ".opencode\skills.backup"                     # Debe ser True
Test-Path ".codex\skills.backup"                        # Debe ser True
Test-Path ".agents\.skills.backup"                      # Debe ser True

# Verificar que NO existan las ubicaciones antiguas
Test-Path ".opencode\skills"                            # Debe ser False
Test-Path ".codex\skills"                               # Debe ser False
Test-Path ".agents\.skills"                             # Debe ser False
```

### 2. Contar PDFs Migrados

```powershell
# Debería mostrar 7 PDFs
(Get-ChildItem "skills\doc_tecnica_vapor\references" -Filter "*.pdf").Count
```

## 🧪 Pruebas de Funcionalidad

### Opción A: Prueba desde OpenCode

Si estás usando OpenCode, abre una terminal en el directorio del proyecto y ejecuta:

```bash
# Invocar el agente steam-researcher
@steam-researcher busca información sobre purgadores de vapor en la documentación técnica
```

**Resultado esperado**:
- El agente debería poder acceder a `skills/steam_knowledge_skill/skill.md`
- El agente debería poder acceder a `skills/doc_tecnica_vapor/skill.md`
- El agente debería poder leer PDFs en `skills/doc_tecnica_vapor/references/`
- No debería haber errores de "skill not found" o "file not found"

### Opción B: Prueba desde Codex

Si estás usando Codex, abre una terminal en el directorio del proyecto y ejecuta:

```bash
# Invocar el agente latex-writer
@latex-writer muestra las reglas que usas para generar código LaTeX
```

**Resultado esperado**:
- El agente debería poder acceder a `skills/latex_drafting_skill/skill.md`
- Debería mencionar las reglas de la skill (booktabs, figuras, etc.)
- No debería haber errores de acceso a archivos

### Opción C: Prueba Manual

Si prefieres verificar manualmente, revisa que los agentes puedan leer las skills:

```powershell
# Ver contenido de las skills (desde raíz del proyecto)
Get-Content "skills\latex_drafting_skill\skill.md"
Get-Content "skills\steam_knowledge_skill\skill.md"
Get-Content "skills\doc_tecnica_vapor\skill.md"

# Verificar que los agentes apuntan a la ubicación correcta
Select-String -Path ".opencode\agents\*.md" -Pattern "skills/" | Select-Object Filename, LineNumber, Line
```

## 🔍 Verificación de Rutas en Agentes

Asegúrate de que los agentes actualizados contienen las rutas correctas:

```powershell
# steam-researcher.md debe contener "Proyecto/skills/doc_tecnica_vapor/references/"
Select-String -Path ".opencode\agents\steam-researcher.md" -Pattern "skills/doc_tecnica_vapor"

# latex-writer.md debe contener "Proyecto/skills/latex_drafting_skill/"
Select-String -Path ".opencode\agents\latex-writer.md" -Pattern "skills/latex_drafting_skill"
```

## ❌ Problemas Comunes y Soluciones

### Problema 1: Skills no detectadas

**Síntoma**: Error "skill not found" al invocar agentes

**Solución**:
1. Verifica que exista el archivo `skill.md` (minúsculas) en cada carpeta de skill
2. Reinicia la sesión de OpenCode/Codex
3. Si persiste, verifica que los agentes en `.opencode/agents/` y `.codex/agents/` tienen las rutas actualizadas

### Problema 2: PDFs no accesibles

**Síntoma**: El agente steam-researcher no puede leer los PDFs técnicos

**Solución**:
1. Verifica que la carpeta `skills/doc_tecnica_vapor/references/` contenga 7 PDFs
2. Si están vacíos o faltantes, copia desde `.agents/.skills.backup/doc-tecnica-vapor/references/`

### Problema 3: Rutas rotas en manifiestos

**Síntoma**: Errores al intentar acceder a archivos referenciados en las skills (como `plantilla.tex`)

**Solución**:
1. Verifica que las rutas relativas en `skills/latex_drafting_skill/skill.md` sean correctas
2. Desde `skills/`, la ruta a `Practica_Vapor_LaTeX/` debería ser `../Practica_Vapor_LaTeX/`

## ✨ Si Todo Funciona

Si todas las pruebas pasan:

1. **Documenta el éxito**: Marca como completados los criterios en `skills/MIGRATION_SUMMARY.md`
2. **Usa el sistema normalmente**: Durante 1 semana, trabaja normalmente con los agentes
3. **Elimina backups**: Después de 1 semana sin problemas, ejecuta:

```powershell
cd "H:\Unidades compartidas\Practicas_Inst2\1_Vapor\Proyecto"

# Eliminar backups (SOLO si todo funciona bien por 1 semana)
Remove-Item ".opencode\skills.backup" -Recurse -Force
Remove-Item ".codex\skills.backup" -Recurse -Force
Remove-Item ".agents\.skills.backup" -Recurse -Force

Write-Host "✓ Backups eliminados" -ForegroundColor Green
```

## 🔄 Si Algo Falla

Si encuentras problemas críticos, puedes revertir la migración:

```powershell
cd "H:\Unidades compartidas\Practicas_Inst2\1_Vapor\Proyecto"

# Eliminar nueva estructura
Remove-Item "skills" -Recurse -Force

# Restaurar desde backups
Move-Item ".opencode\skills.backup" ".opencode\skills" -Force
Move-Item ".codex\skills.backup" ".codex\skills" -Force
Move-Item ".agents\.skills.backup" ".agents\.skills" -Force

Write-Host "✓ Migración revertida" -ForegroundColor Yellow
Write-Host "Por favor, reporta el problema encontrado" -ForegroundColor Yellow
```

## 📞 Soporte

Si encuentras algún problema:

1. Verifica `skills/MIGRATION_SUMMARY.md` para detalles de la migración
2. Consulta los README en las carpetas backup para más contexto
3. Revisa los manifiestos de skills en `skills/*/skill.md` para verificar rutas

---

**Última actualización**: 21/03/2026
**Estado**: Reorganización completada, pendiente de pruebas de usuario
