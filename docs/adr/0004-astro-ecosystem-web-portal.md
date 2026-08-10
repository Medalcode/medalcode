# 4. Adopción de Astro y Tailwind CSS v4 para el Ecosystem Web Portal

- **Estado:** Aprobado
- **Fecha:** 2026-08-10
- **Decisores:** Jonatthan Medalla (Software Architect / CTO)

## Contexto y Problema

El repositorio `Medalcode/medalcode` utiliza `README.md` como interfaz principal para presentar los proyectos del perfil. Aunque es funcional, un documento estático limita la interactividad, no permite visualizar de forma dinámica el Knowledge Graph generado por Graphify (`graph.html`) ni ofrece filtrado interactivo por stack tecnológico.

## Decisión

Adoptar **Astro Framework** combinado con **Tailwind CSS v4** para construir el **Ecosystem Interactive Web Portal**, alimentado declarativamente por `.github/projects.yml` y desplegado como un sitio estático en Vercel/Netlify.

## Consecuencias

### Positivas
- Cero JavaScript enviado al cliente por defecto (Island Architecture), garantizando puntuaciones de 100/100 en Lighthouse.
- Renderizado nativo de Markdown/MDX y consumo directo de `.github/projects.yml`.
- Experiencia de usuario (UX) interactiva de nivel empresarial para reclutadores y líderes técnicos.

### Negativas
- Requiere un proceso de compilación estático en CI/CD previo al despliegue.
