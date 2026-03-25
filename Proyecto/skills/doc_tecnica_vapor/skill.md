---
name: doc_tecnica_vapor
description: "Expert guidance on steam distribution, calculations, and technical specifications. Use when the user requests information derived from the project's technical PDFs (Manuals or Technical Guides) or when they say 'escriba según la doc técnica'."
---

# Skill: Documentación Técnica de Vapor

Esta skill proporciona acceso y guía sobre la documentación técnica de sistemas de vapor, diferenciando entre manuales teóricos y guías técnicas de equipos.

## Flujo de Trabajo

Cuando el usuario solicite información técnica o diga "escriba según la doc técnica", sigue estos pasos:

1.  **Analizar la Intención:** Determina si el usuario busca fundamentos, métodos de cálculo y mejores prácticas (**Manuales**) o si busca datos específicos de equipos, catálogos y normativas (**Guías Técnicas**).
2.  **Consultar el Mapa:** Lee el archivo `references/doc_map.md` para identificar el documento exacto dentro de la categoría seleccionada.
3.  **Localizar el Documento:** Todos los documentos se encuentran en el directorio `references/`.
4.  **Extraer Información:** Utiliza `read_file` sobre el PDF específico identificado para obtener los datos, tablas o guías solicitadas.
5.  **Responder con Precisión:** Proporciona la respuesta basada estrictamente en la documentación, indicando explícitamente si la fuente es un **Manual** o una **Guía Técnica** y citando el nombre del archivo.

## Recursos Disponibles

*   **Mapa de Documentación:** [references/doc_map.md](references/doc_map.md) - Clasificación de archivos entre `[Manual]` y `[Guia_tecnica]`.
*   **Categorías de Fuentes:**
    *   **Manuales:** Fundamentos del vapor, cálculos hidráulicos detallados, eficiencia energética.
    *   **Guías Técnicas:** Especificaciones de calderas Vitomax, catálogos de tuberías, aislamiento térmico IDAE, guías Spirax Sarco.
*   **Temas Cubiertos:** Diseño de redes, dimensionado de tuberías, purgadores, aislamiento térmico y calderas industriales.
