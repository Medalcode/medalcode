# 1. Consolidación de Agentes mediante Facade Pattern (Medalcode-Agent)

- **Estado:** Aprobado
- **Fecha:** 2026-08-10
- **Decisores:** Jonatthan Medalla (Software Architect / CTO)

## Contexto y Problema

Anteriormente, el repositorio contaba con múltiples especificaciones fragmentadas de sub-agentes en archivos Markdown independientes (`ReadmeArchitect.md`, `RoadmapMaster.md`, `AssetManager.md`, `SEOOptimizer.md`). Esta dispersión provocaba sobrecarga de tokens durante el contexto del LLM y dificultades en el mantenimiento de las instrucciones de desarrollo.

## Decisión

Adoptar el **Facade Pattern** consolidando todos los roles operativos en un único agente generalista stateful denominado **`Medalcode-Agent`**, definido centralizadamente en `agents.md`.

## Consecuencias

### Positivas
- Reducción drástica del consumo de tokens en llamadas a la API de IA.
- Fuente Única de Verdad (Single Source of Truth) para la marca personal y estrategia DevOps.
- Simplificación del mantenimiento de prompts y playbooks.

### Negativas
- El archivo `agents.md` debe mantenerse altamente cohesionado para evitar convertirse en una especificación gigante desordenada.
