# 2. Integración de Knowledge Graphs con Graphify

- **Estado:** Aprobado
- **Fecha:** 2026-08-10
- **Decisores:** Jonatthan Medalla (Software Architect / CTO)

## Contexto y Problema

A medida que el ecosistema de repositorios crece (`mcp-servers`, `FinLogic`, `Nidus`, `GitSpy`), los agentes de Inteligencia Artificial necesitan comprender las relaciones entre componentes, lenguajes y arquitecturas sin consumir presupuesto excesivo leyendo cada archivo individual del proyecto.

## Decisión

Integrar la herramienta y skill **`graphify`** para extraer grafos de conocimiento estructurados (`graphify-out/`), generando nodos, aristas, comunidades y reportes de auditoría visuales (`graph.html` y `GRAPH_REPORT.md`).

## Consecuencias

### Positivas
- Comprensión instantánea de la topología del codebase mediante algoritmos de detección de comunidades (Louvain/Leiden).
- Visualizaciones interactivas en HTML para reclutadores e ingenieros.
- Reducción del uso de tokens en consultas de arquitectura via BFS/DFS (`graphify query`).

### Negativas
- Los archivos en `graphify-out/` deben mantenerse sincronizados tras refactorizaciones mayores.
