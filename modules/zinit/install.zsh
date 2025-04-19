#!/usr/bin/env zsh

# Путь установки zinit в соответствии с XDG Base Directory
ZINIT_HOME="${YAKUAKE_LIBS_PATH}/dist/zinit/zinit.git"

# Определяем базовые настройки zinit до установки
declare -A ZINIT
ZINIT[BIN_DIR]="${ZINIT_HOME}"
ZINIT[HOME_DIR]="${YAKUAKE_LIBS_PATH}/dist/zinit"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${ZINIT[HOME_DIR]}/.zcompdump"

# Проверяем, установлен ли уже zinit
if ! check_dir_exists "$ZINIT_HOME"; then
    echo "Устанавливаем zinit..."
    
    # Создаем директорию dist если она не существует
    ensure_dist_exists
    
    # Создаем родительскую директорию для zinit
    mkdir -p "$(dirname $ZINIT_HOME)"
    
    # Клонируем репозиторий
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    
    # Удаляем .git директорию
    rm -rf "${ZINIT_HOME}/.git"
    
    echo "zinit установлен успешно!"
fi

# Создаем необходимые директории
mkdir -p "${ZINIT[PLUGINS_DIR]}" "${ZINIT[COMPLETIONS_DIR]}" "${ZINIT[SNIPPETS_DIR]}"

# Подключаем zinit
source "${ZINIT_HOME}/zinit.zsh"

# Базовая инициализация
autoload -Uz compinit
compinit
zinit light zdharma-continuum/zinit-annex-bin-gem-node
zinit light zdharma-continuum/zinit-annex-patch-dl
zinit light zdharma-continuum/zinit-annex-rust 