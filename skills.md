# Skills: Catálogo de Capacidades Paramétricas

## 1. Super-Skills (Parametric Architecture)

Fin a la fragmentación de archivos de comandos y playbooks. Hemos consolidado toda la lógica operativa en tres **Super-Skills** versátiles:

- **`VisualManagement` [Super-Skill]**
  - **Fusión**: Workflow de Screenshots + Workflow de Diagramas + `generate-assets.sh` logic.
  - **Parámetros**: `action` (init, screenshot, diagram, check, optimize), `project` (Nidus, GitSpy, NetOpsToolkit, etc.).
  - **Comando**: `./generate-assets.sh {action} -p {project}`.
  - **Uso**: Única interfaz para movilizar, redimensionar y procesar todos los recursos visuales del perfil.

- **`ContentCuration` [Super-Skill]**
  - **Fusión**: ReadmeArchitect + RoadmapMaster + LinkedInSync.
  - **Parámetros**: `scope` (readme, summary, roadmap, linked_in), `target` (project_name, global).
  - **Herramientas**: GPT-4 context injection, Mermaid.live, Case Study templates.
  - **Uso**: Centraliza la actualización de biografías, casos de estudio y sincronización de perfiles profesionales.

- **`DiscoveryAnalytics` [Super-Skill]**
  - **Fusión**: SEO Analytics + Metrics Tracking.
  - **Parámetros**: `metric` (visits, stars, keywords), `phase` (fase_1, fase_2, etc.).
  - **Herramientas**: GitHub CLI, Google Analytics (Vercel), Shields.io.
  - **Uso**: Automatiza la asignación de Topics/Tags, verificación de métricas de éxito y optimización de visibilidad.

## 2. Playbooks Operativos (por Super-Skill)

### `VisualManagement`: Generación de Preview para Proyecto
- Paso 1: `./generate-assets.sh screenshot -p {project}`
- Paso 2: `./generate-assets.sh diagram -p {project}`
- Paso 3: `./generate-assets.sh optimize`
- Paso 4: `./generate-assets.sh check`

### `ContentCuration`: Hito del Roadmap Semanal
- Paso 1: Revisar estado en `agents.md` → Visual State.
- Paso 2: Actualizar `README.md` con nuevos assets.
- Paso 3: Sincronizar cambios en LinkedIn si el hito es mayor.

### `DiscoveryAnalytics`: Auditoría SEO
- Paso 1: `gh api /user/repos --jq '.[].stargazers_count'`
- Paso 2: Verificar tags faltantes en repositorios clave.
- Paso 3: Actualizar Bio de GitHub si las keywords han cambiado.

---
## 3. Archivos Obsoletos (Detección de Huérfanos)

Tras la fusión en `agents.md` y `skills.md`, los siguientes archivos se consideran obsoletos y candidatos a eliminación inmediata:

- `INDEX.md`: Innecesario; `agents.md` ahora sirve como el índice arquitectónico.
- `QUICK_COMMANDS.md`: Absorbido por las Super-Skills en este archivo.
- `VISUAL_SUMMARY.md`: El estado visual ahora es parte de `agents.md`.
- `IMPLEMENTATION_SUMMARY.md`: La historia de cambios es ahora parte del contexto operativo de `agents.md`.
- `IMPROVEMENT_ROADMAP.md`: El roadmap estratégico se gestiona directamente en el flujo de `Medalcode-Agent`.

---
*Para la configuración de credenciales de GitHub CLI y APIs de IA, configurar variables de entorno en el host.*
