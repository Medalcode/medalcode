# 3. Estrategia de Pruebas Automatizadas y Ejecución en Contenedores

- **Estado:** Aprobado
- **Fecha:** 2026-08-10
- **Decisores:** Jonatthan Medalla (Software Architect / CTO)

## Contexto y Problema

Los scripts de automatización (`generate-assets.sh` y `git_sync.sh`) carecían de pruebas automatizadas y mostraban diferencias de comportamiento entre distintas versiones de Bash (Linux vs macOS Bash 3.2).

## Decisión

1. Desarrollar una suite de pruebas automatizadas en Shell POSIX portátil (`tests/test_scripts.sh`) que cubre Smoke, Unit, Integration y Regression tests.
2. Contenedorizar el entorno de ejecución mediante un `Dockerfile` basado en `alpine:3.20` para garantizar 100% de reproducibilidad independientemente del sistema operativo del desarrollador.

## Consecuencias

### Positivas
- Cero regresiones en la ejecución de scripts.
- Verificación automática en la pipeline de CI de GitHub Actions.
- Pruebas portables y reproducibles con un solo comando Docker.
