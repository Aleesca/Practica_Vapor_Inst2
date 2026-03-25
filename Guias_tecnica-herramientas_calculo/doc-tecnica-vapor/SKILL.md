---
name: doc-tecnica-vapor
description: "Expert guidance on steam distribution, calculations, and technical specifications based on provided documentation. Use when the user requests information derived from the project's technical PDFs or when they say 'escriba según la doc técnica'."
---

# Skill: Documentación Técnica de Vapor

Esta skill proporciona acceso y guía sobre la documentación técnica de sistemas de vapor disponible en el área de trabajo.

## Flujo de Trabajo

Cuando el usuario solicite información técnica o diga "escriba según la doc técnica", sigue estos pasos:

1.  **Consultar el Mapa:** Lee el archivo `references/doc_map.md` para identificar qué documento contiene la información relevante para la consulta del usuario.
2.  **Localizar el Documento:** Los documentos se encuentran en el directorio raíz (un nivel arriba de esta skill).
3.  **Extraer Información:** Utiliza `read_file` sobre el PDF específico identificado para obtener los datos, tablas o guías solicitadas.
4.  **Responder con Precisión:** Proporciona la respuesta basada estrictamente en la documentación, citando el documento de origen.

## Recursos Disponibles

*   **Mapa de Documentación:** [references/doc_map.md](references/doc_map.md) - Resumen detallado de todos los archivos PDF y herramientas en la carpeta.
*   **Temas Cubiertos:** Diseño de redes, cálculo hidráulico, dimensionado de tuberías, purgadores de vapor, aislamiento térmico y calderas Vitomax.
