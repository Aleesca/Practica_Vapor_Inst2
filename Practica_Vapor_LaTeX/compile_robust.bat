@echo off
REM ================================================================
REM Script robusto para compilar LaTeX evitando problemas de Google Drive
REM ================================================================
REM
REM PROBLEMA IDENTIFICADO:
REM   Google Drive está corrompiendo los archivos auxiliares .aux durante
REM   la compilación, causando errores de carácteres inválidos (^^@)
REM
REM SOLUCIÓN:
REM   Este script usa la secuencia manual: pdflatex → bibtex → pdflatex × 2
REM   en lugar de latexmk para mayor control y robustez.
REM ================================================================

echo.
echo ================================================================
echo   Compilación LaTeX robusta para ambiente compartido de Drive
echo ================================================================
echo.

setlocal enabledelayedexpansion

REM Configuración
set "MAIN_FILE=plantilla"
set "PASS_COUNT=0"
set "MAX_PASSES=2"

REM Cambiar al directorio correcto
cd /d "%~dp0"

echo Directorio: %CD%
echo Archivo principal: %MAIN_FILE%.tex
echo.

REM ================================================================
REM PASO 1: pdflatex (primera pasada)
REM ================================================================
echo [PASO 1/4] Ejecutando pdflatex (primera pasada)...
pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %MAIN_FILE%.tex >nul
if errorlevel 1 (
    echo [ERROR] pdflatex falló en primera pasada
    goto error
)
echo [OK] Primera pasada completada

REM ================================================================
REM PASO 2: bibtex (generar bibliografía)
REM ================================================================
echo.
echo [PASO 2/4] Ejecutando bibtex...
bibtex %MAIN_FILE% >nul
if errorlevel 1 (
    echo [ERROR] bibtex falló
    goto error
)

REM Verificar si se generó .bbl
if not exist %MAIN_FILE%.bbl (
    echo [ERROR] bibtex no generó %MAIN_FILE%.bbl
    echo [INFO] Posibles causas:
    echo   1. No hay citas en el documento
    echo   2. El archivo refs.bib no está correctamente formateado
    goto error
)
echo [OK] Bibliografía generada (%MAIN_FILE%.bbl)

REM ================================================================
REM PASO 3 y 4: pdflatex (pasadas finales para resolver referencias)
REM ================================================================
for /l %%i in (1,1,%MAX_PASSES%) do (
    echo.
    echo [PASO !PASS_COUNT!/4] Ejecutando pdflatex (pasada %%i de %MAX_PASSES%)...
    pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -shell-escape %MAIN_FILE%.tex >nul
    if errorlevel 1 (
        echo [ERROR] pdflatex falló en pasada %%i
        goto error
    )
    echo [OK] Pasada %%i completada
    set /a PASS_COUNT+=1
)

REM ================================================================
REM VERIFICACIÓN FINAL
REM ================================================================
echo.
echo ================================================================
echo   Verificación final
echo ================================================================
echo.

if exist %MAIN_FILE%.pdf (
    for %%f in (%MAIN_FILE%.pdf) do (
        echo [OK] %MAIN_FILE%.pdf generado exitosamente (%%~zf bytes)
    )
) else (
    echo [ERROR] %MAIN_FILE%.pdf no se generó
    goto error
)

if exist %MAIN_FILE%.bbl (
    for %%f in (%MAIN_FILE%.bbl) do (
        echo [OK] %MAIN_FILE%.bbl generado exitosamente (%%~zf bytes)
    )
    echo.
    echo [INFO] Contenido del .bbl (primeras 3 entradas):
    for /f "tokens=1-2 delims=:" %%a in ('findstr /n "bibitem" %MAIN_FILE%.bbl') do (
        echo   - Línea %%a: %%b
    )
) else (
    echo [ERROR] %MAIN_FILE%.bbl no existe
    goto error
)

REM Verificar warnings de citaciones en el log
echo.
echo [INFO] Buscando warnings de citaciones en el log...
findstr /c:"Citation" %MAIN_FILE%.log >nul
if errorlevel 1 (
    echo [OK] No hay warnings de citaciones indefinidas ✓
) else (
    echo [ADVERTENCIA] Aún hay warnings de citaciones:
    findstr /c:"Citation" %MAIN_FILE%.log | find /c "" >nul
    for /f %%c in ('findstr /c:"Citation" %MAIN_FILE%.log ^| find /c ""') do (
        echo   - %%c warnings encontrados
    )
)

echo.
echo ================================================================
echo   Compilación completada exitosamente
echo ================================================================
echo.
echo Próximos pasos:
echo 1. Abre plantilla.pdf en VS Code para verificar que las citas se resolvieron
echo 2. Si ves errores, ejecuta este script nuevamente
echo 3. En caso de persistencia, considera trabajar en copia local (no en Drive)
echo.

goto end

:error
echo.
echo ================================================================
echo   ERROR DURANTE LA COMPILACIÓN
echo ================================================================
echo.
echo Para más detalles, revisa %MAIN_FILE%.log
echo.

:end
pause
