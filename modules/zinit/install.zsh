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
if [[ ! -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    echo "Устанавливаем zinit..."
    
    # Создаем директорию dist если она не существует
    ensure_dist_exists
    
    # Создаем родительскую директорию для zinit
    mkdir -p "$(dirname $ZINIT_HOME)"
    
    # Удаляем директорию если она существует
    [[ -d "$ZINIT_HOME" ]] && rm -rf "$ZINIT_HOME"
    
    # Клонируем репозиторий
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    
    # Проверяем успешность установки
    if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
        # Создаем необходимые директории
        mkdir -p "${ZINIT[PLUGINS_DIR]}" "${ZINIT[COMPLETIONS_DIR]}" "${ZINIT[SNIPPETS_DIR]}"
        
        # Удаляем .git директорию только после успешной установки
        rm -rf "${ZINIT_HOME}/.git"
        echo "zinit установлен успешно!"
    else
        echo "Ошибка установки zinit!"
        return 1
    fi
fi

# Подключаем zinit
if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    source "${ZINIT_HOME}/zinit.zsh"
    
    # Базовая инициализация
    autoload -Uz compinit
    compinit
    
    # Устанавливаем базовые аннексы
    if (( $+commands[zinit] )); then
        zinit light zdharma-continuum/zinit-annex-bin-gem-node
        zinit light zdharma-continuum/zinit-annex-patch-dl
        zinit light zdharma-continuum/zinit-annex-rust
    else
        echo "Ошибка: команда zinit недоступна!"
        return 1
    fi
else
    echo "Ошибка: файл zinit.zsh не найден!"
    return 1
fi 