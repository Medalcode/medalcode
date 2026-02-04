# ⚡ Quick Commands - Medalcode Profile

Comandos rápidos para mantener y mejorar tu perfil de GitHub.

---

## 🚀 Comandos Esenciales

### Ver el README actualizado

```bash
cat README.md | less
```

### Verificar estructura de assets

```bash
tree .github/assets/
```

### Generar assets para un proyecto

```bash
# Inicializar estructura (solo primera vez)
./generate-assets.sh init

# Guía para screenshots de Nidus
./generate-assets.sh screenshot -p Nidus

# Generar badges para GitSpy
./generate-assets.sh badges -p GitSpy

# Crear plantilla de diagrama para Argos
./generate-assets.sh diagram -p Argos

# Verificar assets faltantes
./generate-assets.sh check

# Optimizar todas las imágenes
./generate-assets.sh optimize
```

---

## 📸 Workflow de Screenshots

### 1. Instalar herramientas (si no están instaladas)

```bash
# Flameshot (screenshots con anotaciones)
sudo apt install flameshot

# Peek (GIF recorder)
sudo apt install peek

# ImageMagick (optimización)
sudo apt install imagemagick
```

### 2. Tomar screenshots

```bash
# Opción 1: Flameshot (recomendado)
flameshot gui

# Opción 2: GNOME Screenshot
gnome-screenshot -a

# Opción 3: Peek (para GIFs)
peek
```

### 3. Guardar y optimizar

```bash
# Guardar en directorio correcto
mv ~/Downloads/screenshot.png .github/assets/screenshots/nidus-dashboard.png

# Optimizar imagen
./generate-assets.sh optimize
```

---

## 📊 Workflow de Diagramas

### 1. Crear plantilla

```bash
./generate-assets.sh diagram -p Nidus
```

### 2. Editar en Mermaid Live

```bash
# Abrir el archivo generado
cat .github/assets/diagrams/nidus-architecture.mmd

# Copiar contenido y pegar en: https://mermaid.live/
```

### 3. Exportar y guardar

```bash
# Desde Mermaid Live, exportar como PNG
# Guardar en: .github/assets/diagrams/nidus-architecture.png
```

---

## 🔄 Workflow de Actualización de Proyectos

### Para cada proyecto principal:

```bash
# 1. Navegar al proyecto
cd ~/Documentos/GitHub/Nidus

# 2. Agregar screenshot al README
echo '## 📸 Preview' >> README.md
echo '![Dashboard](https://raw.githubusercontent.com/medalcode/Nidus/main/.github/assets/screenshots/nidus-dashboard.png)' >> README.md

# 3. Agregar diagrama de arquitectura
echo '## 🏗️ Architecture' >> README.md
echo '![Architecture](https://raw.githubusercontent.com/medalcode/Nidus/main/.github/assets/diagrams/nidus-architecture.png)' >> README.md

# 4. Agregar badges
echo '![Status](https://img.shields.io/badge/Status-Production-green)' >> README.md
echo '![Tests](https://img.shields.io/badge/Tests-Passing-success)' >> README.md

# 5. Commit y push
git add .
git commit -m "docs: add visual assets and architecture diagram"
git push origin main
```

---

## 🎯 Checklist Semanal

### Lunes: Planificación

```bash
# Revisar roadmap
cat IMPROVEMENT_ROADMAP.md

# Verificar assets faltantes
./generate-assets.sh check
```

### Miércoles: Implementación

```bash
# Tomar screenshots de proyectos activos
# Crear/actualizar diagramas
# Escribir/actualizar documentación
```

### Viernes: Publicación

```bash
# Optimizar assets
./generate-assets.sh optimize

# Commit y push cambios
git add .
git commit -m "docs: weekly profile update"
git push origin main
```

---

## 📝 Templates Rápidos

### Badge de Status

```markdown
![Status](https://img.shields.io/badge/Status-Production-green)
![Build](https://img.shields.io/badge/Build-Passing-success)
![Tests](https://img.shields.io/badge/Tests-100%25-success)
```

### Badge de Tech Stack

```markdown
![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python)
![FastAPI](https://img.shields.io/badge/FastAPI-Latest-009688?logo=fastapi)
![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker)
```

### Sección de Preview

```markdown
## 📸 Preview

![Dashboard](.github/assets/screenshots/project-dashboard.png)

_Main dashboard showing key metrics and analytics_
```

### Sección de Architecture

```markdown
## 🏗️ Architecture

![Architecture Diagram](.github/assets/diagrams/project-architecture.png)

### Key Components

- **Frontend**: React 18 + TailwindCSS
- **Backend**: FastAPI + PostgreSQL
- **Cache**: Redis
- **Queue**: Celery + RabbitMQ
```

---

## 🔍 Comandos de Verificación

### Verificar tamaño de imágenes

```bash
find .github/assets -type f -exec du -h {} \; | sort -rh | head -10
```

### Contar assets por tipo

```bash
echo "Screenshots: $(find .github/assets/screenshots -type f | wc -l)"
echo "Diagrams: $(find .github/assets/diagrams -type f | wc -l)"
echo "GIFs: $(find .github/assets/gifs -type f | wc -l)"
```

### Verificar enlaces rotos en README

```bash
grep -o 'https\?://[^)]*' README.md | while read url; do
    curl -s -o /dev/null -w "%{http_code} $url\n" "$url"
done
```

---

## 🌐 Sincronización con Portfolio

### Actualizar portfolio con nuevos proyectos

```bash
cd ~/Documentos/GitHub/PortfolioMedalcode

# Crear nuevo proyecto en content/projects/
cat > src/content/projects/en/new-project.md << 'EOF'
---
title: "Project Name"
description: "Short description"
technologies: ["Python", "FastAPI", "React"]
github: "https://github.com/medalcode/project"
demo: "https://project.vercel.app"
featured: true
---

Full project description here...
EOF

# Build y deploy
npm run build
git add .
git commit -m "feat: add new project showcase"
git push origin main
```

---

## 📊 Analytics y Métricas

### Ver estadísticas de GitHub

```bash
# Visitas al perfil (requiere GitHub CLI)
gh api /user/repos --jq '.[].stargazers_count' | awk '{s+=$1} END {print "Total stars:", s}'

# Ver repositorios más populares
gh api /user/repos --jq '.[] | "\(.stargazers_count) \(.name)"' | sort -rn | head -5
```

---

## 🚨 Troubleshooting

### Script no ejecutable

```bash
chmod +x generate-assets.sh
```

### Imágenes muy grandes

```bash
# Redimensionar imagen
convert input.png -resize 1920x1080\> output.png

# Comprimir PNG
pngquant input.png --output output.png
```

### Git push rechazado por archivos grandes

```bash
# Ver archivos grandes
git ls-files | xargs du -h | sort -rh | head -10

# Usar Git LFS para archivos grandes
git lfs install
git lfs track "*.png"
git lfs track "*.gif"
```

---

## 💡 Tips Productivos

### Alias útiles (agregar a ~/.bashrc)

```bash
alias profile='cd ~/Documentos/GitHub/medalcode'
alias assets='./generate-assets.sh'
alias portfolio='cd ~/Documentos/GitHub/PortfolioMedalcode'
alias projects='cd ~/Documentos/GitHub && ls -d */'
```

### Función para crear proyecto rápido

```bash
new_project_assets() {
    local project=$1
    mkdir -p .github/assets/{screenshots,diagrams}
    ./generate-assets.sh diagram -p "$project"
    echo "Assets structure created for $project"
}
```

---

## 📚 Recursos Rápidos

- **Shields.io**: https://shields.io/
- **Mermaid Live**: https://mermaid.live/
- **TinyPNG**: https://tinypng.com/
- **Excalidraw**: https://excalidraw.com/
- **Carbon (code screenshots)**: https://carbon.now.sh/

---

**Última actualización**: Febrero 2026
