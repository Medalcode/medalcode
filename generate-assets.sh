#!/bin/bash

# 🎨 GitHub Profile Asset Generator
# Herramienta para crear y optimizar assets visuales para tus proyectos

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función de ayuda
show_help() {
    cat << EOF
🎨 GitHub Profile Asset Generator

Uso: ./generate-assets.sh [COMANDO] [OPCIONES]

Comandos:
  init              Crear estructura de directorios para assets
  screenshot        Guía para tomar screenshots de proyectos
  optimize          Optimizar imágenes existentes
  badges            Generar badges para README
  diagram           Crear plantilla de diagrama Mermaid
  check             Verificar assets faltantes en proyectos

Opciones:
  -h, --help        Mostrar esta ayuda
  -p, --project     Nombre del proyecto (e.g., Nidus, GitSpy)

Ejemplos:
  ./generate-assets.sh init
  ./generate-assets.sh screenshot -p Nidus
  ./generate-assets.sh optimize
  ./generate-assets.sh badges -p GitSpy

EOF
}

# Función para crear estructura de directorios
init_structure() {
    echo -e "${BLUE}📁 Creando estructura de directorios...${NC}"
    
    mkdir -p .github/assets/{screenshots,diagrams,badges,gifs}
    mkdir -p docs/images
    
    cat > .github/assets/README.md << 'ASSETS_README'
# Assets Directory

## Estructura

- `screenshots/` - Capturas de pantalla de aplicaciones
- `diagrams/` - Diagramas de arquitectura y flujos
- `badges/` - Badges personalizados
- `gifs/` - Animaciones y demos

## Convenciones de Nombres

### Screenshots
- `{proyecto}-{vista}-{fecha}.png`
- Ejemplo: `nidus-dashboard-2026-02.png`

### Diagramas
- `{proyecto}-{tipo}-diagram.png`
- Ejemplo: `gitspy-architecture-diagram.png`

### GIFs
- `{proyecto}-{feature}-demo.gif`
- Ejemplo: `argos-trading-demo.gif`

## Optimización

Todas las imágenes deben ser optimizadas antes de commit:
- PNGs: usar TinyPNG o ImageOptim
- GIFs: máximo 5MB, 10fps recomendado
- Resolución: 1920x1080 o menor
ASSETS_README
    
    echo -e "${GREEN}✅ Estructura creada exitosamente${NC}"
    echo -e "${YELLOW}📂 Directorios creados en .github/assets/${NC}"
}

# Función para guía de screenshots
screenshot_guide() {
    local project=$1
    
    echo -e "${BLUE}📸 Guía de Screenshots para ${project}${NC}"
    echo ""
    echo -e "${YELLOW}Herramientas recomendadas:${NC}"
    echo "  • Flameshot: sudo apt install flameshot"
    echo "  • GNOME Screenshot: gnome-screenshot -a"
    echo "  • Peek (para GIFs): sudo apt install peek"
    echo ""
    echo -e "${YELLOW}Checklist de capturas:${NC}"
    echo "  [ ] Vista principal/dashboard"
    echo "  [ ] Funcionalidad clave en acción"
    echo "  [ ] Resultados/output importante"
    echo "  [ ] Configuración/settings (opcional)"
    echo ""
    echo -e "${YELLOW}Mejores prácticas:${NC}"
    echo "  • Resolución: 1920x1080 o 1280x720"
    echo "  • Formato: PNG para screenshots, GIF para demos"
    echo "  • Tamaño: < 2MB para PNGs, < 5MB para GIFs"
    echo "  • Contenido: Ocultar datos sensibles/personales"
    echo ""
    echo -e "${GREEN}Guardar en: .github/assets/screenshots/${project,,}-*.png${NC}"
}

# Función para optimizar imágenes
optimize_images() {
    echo -e "${BLUE}🔧 Optimizando imágenes...${NC}"
    
    # Verificar si existe imagemagick
    if ! command -v convert &> /dev/null; then
        echo -e "${RED}❌ ImageMagick no está instalado${NC}"
        echo -e "${YELLOW}Instalar con: sudo apt install imagemagick${NC}"
        exit 1
    fi
    
    # Optimizar PNGs
    find .github/assets -name "*.png" -type f | while read img; do
        echo -e "${YELLOW}Optimizando: $img${NC}"
        convert "$img" -strip -quality 85 "$img.tmp" && mv "$img.tmp" "$img"
    done
    
    echo -e "${GREEN}✅ Optimización completada${NC}"
}

# Función para generar badges
generate_badges() {
    local project=$1
    
    echo -e "${BLUE}🏷️  Generando badges para ${project}${NC}"
    echo ""
    echo -e "${YELLOW}Badges recomendados:${NC}"
    echo ""
    
    cat << 'BADGES'
## Status Badges
![Status](https://img.shields.io/badge/Status-Production-green)
![Build](https://img.shields.io/badge/Build-Passing-success)
![Tests](https://img.shields.io/badge/Tests-100%25-success)

## Tech Stack Badges
![Python](https://img.shields.io/badge/Python-3.11+-blue?logo=python)
![TypeScript](https://img.shields.io/badge/TypeScript-5.0+-blue?logo=typescript)
![Docker](https://img.shields.io/badge/Docker-Ready-blue?logo=docker)

## Custom Badges
![License](https://img.shields.io/badge/License-MIT-green)
![PRs](https://img.shields.io/badge/PRs-Welcome-brightgreen)
![Maintained](https://img.shields.io/badge/Maintained-Yes-green)

## Shields.io Generator
https://shields.io/
BADGES
    
    echo ""
    echo -e "${GREEN}Copiar badges al README del proyecto${NC}"
}

# Función para crear plantilla de diagrama
create_diagram_template() {
    local project=$1
    
    echo -e "${BLUE}📊 Creando plantilla de diagrama para ${project}${NC}"
    
    cat > ".github/assets/diagrams/${project,,}-architecture.mmd" << 'DIAGRAM'
graph TB
    subgraph "Frontend"
        A[Client/UI]
    end
    
    subgraph "Backend"
        B[API Gateway]
        C[Business Logic]
        D[Data Layer]
    end
    
    subgraph "External Services"
        E[Third Party API]
        F[Cache/Queue]
    end
    
    A -->|HTTP/REST| B
    B --> C
    C --> D
    C --> E
    B --> F
    
    style A fill:#61dafb
    style B fill:#009688
    style C fill:#4caf50
    style D fill:#2196f3
    style E fill:#ff9800
    style F fill:#dc382d
DIAGRAM
    
    echo -e "${GREEN}✅ Plantilla creada en .github/assets/diagrams/${project,,}-architecture.mmd${NC}"
    echo -e "${YELLOW}Editar con: https://mermaid.live/${NC}"
}

# Función para verificar assets faltantes
check_missing_assets() {
    echo -e "${BLUE}🔍 Verificando assets en proyectos...${NC}"
    echo ""
    
    local projects=("Nidus" "GitSpy" "Argos" "MatrixCalc" "Skema" "FinLogic")
    
    for project in "${projects[@]}"; do
        echo -e "${YELLOW}Proyecto: ${project}${NC}"
        
        # Verificar screenshot
        if ls .github/assets/screenshots/${project,,}* 1> /dev/null 2>&1; then
            echo -e "  ${GREEN}✓${NC} Screenshot encontrado"
        else
            echo -e "  ${RED}✗${NC} Screenshot faltante"
        fi
        
        # Verificar diagrama
        if ls .github/assets/diagrams/${project,,}* 1> /dev/null 2>&1; then
            echo -e "  ${GREEN}✓${NC} Diagrama encontrado"
        else
            echo -e "  ${RED}✗${NC} Diagrama faltante"
        fi
        
        echo ""
    done
}

# Main script
main() {
    case "${1:-}" in
        init)
            init_structure
            ;;
        screenshot)
            if [[ -z "${2:-}" ]]; then
                echo -e "${RED}Error: Especificar proyecto con -p${NC}"
                exit 1
            fi
            screenshot_guide "$2"
            ;;
        optimize)
            optimize_images
            ;;
        badges)
            if [[ -z "${2:-}" ]]; then
                echo -e "${RED}Error: Especificar proyecto con -p${NC}"
                exit 1
            fi
            generate_badges "$2"
            ;;
        diagram)
            if [[ -z "${2:-}" ]]; then
                echo -e "${RED}Error: Especificar proyecto con -p${NC}"
                exit 1
            fi
            create_diagram_template "$2"
            ;;
        check)
            check_missing_assets
            ;;
        -h|--help)
            show_help
            ;;
        *)
            show_help
            exit 1
            ;;
    esac
}

# Ejecutar script
main "$@"
