#!/usr/bin/env zsh

# Путь установки zinit
ZINIT_HOME="${YAKUAKE_LIBS_PATH}/dist/zinit"

# Проверяем, установлен ли уже zinit
if ! check_dir_exists "$ZINIT_HOME"; then
    echo "Устанавливаем zinit..."
    
    # Создаем директорию dist если она не существует
    ensure_dist_exists
    
    # Создаем директорию для zinit
    mkdir -p "$ZINIT_HOME"
    
    # Клонируем репозиторий
    git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}/zinit.git"
    
    # Удаляем .git директорию
    rm -rf "${ZINIT_HOME}/zinit.git/.git"
    
    echo "zinit установлен успешно!"
fi

# Подключаем zinit
source "${ZINIT_HOME}/zinit.git/zinit.zsh" 