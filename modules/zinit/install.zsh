#!/usr/bin/env zsh

# Путь установки zinit в соответствии с XDG Base Directory
ZINIT_HOME="${YAKUAKE_LIBS_PATH}/dist/zinit/zinit.git"

# Создаем директорию если она не существует
ensure_dist_exists
mkdir -p "$(dirname $ZINIT_HOME)"

# Проверяем существующую установку
if [[ -d "$ZINIT_HOME" && ! -d "$ZINIT_HOME/.git" ]]; then
    echo "Найдена поврежденная установка zinit, удаляем..."
    rm -rf "$ZINIT_HOME"
fi

# Клонируем репозиторий если его нет
if [[ ! -d "$ZINIT_HOME/.git" ]]; then
    echo "Устанавливаем zinit..."
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
elif [[ -d "$ZINIT_HOME/.git" ]]; then
    echo "Обновляем существующую установку zinit..."
    (cd "$ZINIT_HOME" && git pull origin master)
fi

# Определяем базовые настройки zinit
declare -A ZINIT
ZINIT[BIN_DIR]="${ZINIT_HOME}"
ZINIT[HOME_DIR]="${YAKUAKE_LIBS_PATH}/dist/zinit"
ZINIT[PLUGINS_DIR]="${ZINIT[HOME_DIR]}/plugins"
ZINIT[COMPLETIONS_DIR]="${ZINIT[HOME_DIR]}/completions"
ZINIT[SNIPPETS_DIR]="${ZINIT[HOME_DIR]}/snippets"
ZINIT[ZCOMPDUMP_PATH]="${ZINIT[HOME_DIR]}/.zcompdump"

# Создаем необходимые директории
mkdir -p "${ZINIT[PLUGINS_DIR]}" "${ZINIT[COMPLETIONS_DIR]}" "${ZINIT[SNIPPETS_DIR]}"

# Подключаем zinit
if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
    source "${ZINIT_HOME}/zinit.zsh"
    
    # Инициализация автодополнения
    autoload -Uz _zinit
    (( ${+_comps} )) && _comps[zinit]=_zinit
    
    # Устанавливаем базовые плагины
    zinit light zdharma-continuum/zinit-annex-bin-gem-node
    zinit light zdharma-continuum/zinit-annex-patch-dl
    zinit light zdharma-continuum/zinit-annex-rust
else
    echo "Ошибка: файл zinit.zsh не найден!"
    return 1
fi 