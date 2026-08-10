#!/bin/bash
# Script para confirmar, mezclar y subir cambios con fecha objetivo parametrizable

set -e

# Configurar fecha objetivo por defecto
TARGET_DATE="2026-07-06T12:00:00"

while [[ "$#" -gt 0 ]]; do
    case $1 in
        --date|-d) TARGET_DATE="$2"; shift ;;
        -h|--help)
            echo "Uso: ./git_sync.sh [--date YYYY-MM-DDTHH:MM:SS]"
            exit 0
            ;;
        *) echo "Parámetro desconocido: $1"; exit 1 ;;
    esac
    shift
done

echo "Usando fecha objetivo: $TARGET_DATE"

# Detectar rama actual
CURRENT_BRANCH=$(git branch --show-current)

echo "Rama actual detectada: $CURRENT_BRANCH"

# Agregar archivos modificados conocidos
echo "Agregando archivos..."
git add README.md
if [ -f .github/assets/banner.svg ]; then
    git add .github/assets/banner.svg
fi

# Realizar commit con autoría y fecha de confirmación si hay cambios en el índice
if ! git diff --cached --quiet; then
    echo "Creando commit con fecha objetivo ($TARGET_DATE)..."
    GIT_AUTHOR_DATE="$TARGET_DATE" GIT_COMMITTER_DATE="$TARGET_DATE" git commit -m "style: rediseñar perfil de GitHub y actualizar assets"
else
    echo "No hay cambios en el índice (los cambios ya podrían estar confirmados localmente)."
fi

# Determinar si es necesario mezclar con main/master
if [ "$CURRENT_BRANCH" != "main" ] && [ "$CURRENT_BRANCH" != "master" ]; then
    # Intentar buscar si la rama principal es 'main' o 'master' (local o remota)
    MAIN_BRANCH="main"
    if ! git show-ref --verify --quiet refs/heads/main && ! git show-ref --verify --quiet refs/remotes/origin/main; then
        if git show-ref --verify --quiet refs/heads/master || git show-ref --verify --quiet refs/remotes/origin/master; then
            MAIN_BRANCH="master"
        fi
    fi

    echo "Cambiando a la rama principal ($MAIN_BRANCH) para realizar merge..."
    git checkout "$MAIN_BRANCH"

    echo "Sincronizando rama principal con remoto..."
    git pull origin "$MAIN_BRANCH" --rebase

    echo "Realizando merge con fecha objetivo..."
    GIT_AUTHOR_DATE="$TARGET_DATE" GIT_COMMITTER_DATE="$TARGET_DATE" git merge "$CURRENT_BRANCH" --no-ff -m "merge: incorporar mejoras de perfil desde $CURRENT_BRANCH"

    echo "Subiendo cambios a la rama principal..."
    git push origin "$MAIN_BRANCH"

    # Regresar a la rama de trabajo si es necesario
    echo "Regresando a la rama de trabajo..."
    git checkout "$CURRENT_BRANCH"
else
    # Verificar si hay cambios locales en archivos rastreados (staged o unstaged)
    if [ -n "$(git status --porcelain | grep -v '^\?\?')" ]; then
        echo "Guardando cambios locales temporales (stash)..."
        git stash -q
        HAS_STASH=true
    else
        HAS_STASH=false
    fi

    echo "Sincronizando con repositorio remoto (pull --rebase)..."
    git pull origin "$CURRENT_BRANCH" --rebase

    echo "Asegurando fecha objetivo en el último commit..."
    GIT_AUTHOR_DATE="$TARGET_DATE" GIT_COMMITTER_DATE="$TARGET_DATE" git commit --amend --no-edit --date="$TARGET_DATE"

    echo "Subiendo cambios directamente a $CURRENT_BRANCH..."
    git push origin "$CURRENT_BRANCH"

    # Restaurar los cambios guardados si se creó un stash
    if [ "$HAS_STASH" = true ]; then
        echo "Restaurando cambios locales temporales (stash pop)..."
        git stash pop -q
    fi
fi

echo "¡Listo! Cambios confirmados y subidos con fecha: $TARGET_DATE."

