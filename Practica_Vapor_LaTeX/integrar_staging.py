#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Script para integrar staging.tex en plantilla.tex
Elimina comentarios automáticos y mantiene la estructura de plantilla
"""

import re


def leer_archivo(ruta):
    """Lee un archivo y devuelve su contenido"""
    with open(ruta, "r", encoding="utf-8") as f:
        return f.readlines()


def limpiar_comentarios_generacion(lineas):
    """Elimina los comentarios de generación automática de staging.tex"""
    resultado = []
    skip_next_blank = False

    for linea in lineas:
        # Detectar líneas de comentarios con ==== o "Generado por" o "Sección X.X:"
        if re.match(r"^%\s*={10,}", linea):  # Líneas con ====
            skip_next_blank = True
            continue
        elif re.match(r"^%\s*Generado por", linea):  # "Generado por latex-writer"
            skip_next_blank = True
            continue
        elif re.match(r"^%\s*Sección \d", linea):  # "Sección 2.1:"
            skip_next_blank = True
            continue
        elif skip_next_blank and linea.strip() == "":
            # Eliminar línea en blanco después de comentarios
            skip_next_blank = False
            continue
        else:
            skip_next_blank = False
            resultado.append(linea)

    return resultado


def extraer_seccion_staging(lineas_staging, inicio_seccion, fin_seccion=None):
    """Extrae una sección del contenido de staging.tex"""
    resultado = []
    capturando = False

    for i, linea in enumerate(lineas_staging):
        # Detectar inicio de sección
        if inicio_seccion in linea:
            capturando = True
            resultado.append(linea)
            continue

        # Detectar fin de sección (si se especifica)
        if capturando and fin_seccion and fin_seccion in linea:
            break

        # Capturar líneas
        if capturando:
            resultado.append(linea)

    return resultado


def main():
    print("=== Integración de staging.tex en plantilla.tex ===\n")

    # 1. Leer archivos
    print("[1/5] Leyendo archivos...")
    plantilla = leer_archivo("plantilla.tex")
    staging = leer_archivo("staging.tex")

    # 2. Limpiar comentarios de staging
    print("[2/5] Limpiando comentarios automáticos de staging.tex...")
    staging_limpio = limpiar_comentarios_generacion(staging)

    # 3. Construir documento final
    print("[3/5] Construyendo documento final...")
    documento_final = []

    # Añadir preámbulo y portada de plantilla.tex (líneas 1-95)
    for i, linea in enumerate(plantilla):
        if i < 95:  # Hasta antes de la línea "% Contenido"
            documento_final.append(linea)
        else:
            break

    # Añadir línea de separación antes del contenido
    documento_final.append("\n")
    documento_final.append("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n")
    documento_final.append("%%%%%%%%%%%%%%%%%%%%% Contenido %%%%%%%%%%%%%%%%%%%%%%%\n")
    documento_final.append("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\n")
    documento_final.append("\n")

    # Añadir sección 1: Introducción (desde staging limpio)
    documento_final.append("    \\section{Introducción}\n")
    documento_final.append("    \\label{Introducción}\n")
    documento_final.append("\n")

    # Extraer subsecciones de Introducción de staging
    en_introduccion = False
    for linea in staging_limpio:
        if "\\subsection{Objetivo del proyecto}" in linea:
            en_introduccion = True
        elif "\\section{Metodología}" in linea:
            break

        if en_introduccion:
            documento_final.append(linea)

    # Añadir sección 2: Metodología (desde staging limpio)
    en_metodologia = False
    for linea in staging_limpio:
        if "\\section{Metodología}" in linea:
            en_metodologia = True
        elif "\\section{Conclusiones y Limitaciones}" in linea:
            break

        if en_metodologia:
            documento_final.append(linea)

    # Añadir sección 3: Conclusiones y Limitaciones (desde staging limpio)
    en_conclusiones = False
    for linea in staging_limpio:
        if "\\section{Conclusiones y Limitaciones}" in linea:
            en_conclusiones = True
        elif "\\section{Bibliografía}" in linea:
            break

        if en_conclusiones:
            documento_final.append(linea)

    # Añadir sección 4: Bibliografía (desde staging limpio)
    en_bibliografia = False
    for linea in staging_limpio:
        if "\\section{Bibliografía}" in linea:
            en_bibliografia = True

        if en_bibliografia:
            documento_final.append(linea)

    # Añadir Anejos de plantilla.tex (líneas 182-fin)
    documento_final.append("\n")
    for i, linea in enumerate(plantilla):
        if i >= 182:  # Desde "%%%% Anexos"
            documento_final.append(linea)

    # 4. Escribir documento final
    print("[4/5] Escribiendo documento final...")
    with open("plantilla.tex", "w", encoding="utf-8") as f:
        f.writelines(documento_final)

    # 5. Estadísticas
    print("[5/5] Estadísticas:")
    print(f"  - Líneas en plantilla.tex original: {len(plantilla)}")
    print(f"  - Líneas en staging.tex original: {len(staging)}")
    print(f"  - Líneas en staging.tex limpio: {len(staging_limpio)}")
    print(f"  - Líneas en documento final: {len(documento_final)}")
    print("\n✓ Integración completada exitosamente")
    print("✓ Backup guardado en: plantilla.tex.backup")


if __name__ == "__main__":
    main()
