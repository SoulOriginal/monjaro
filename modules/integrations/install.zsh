#!/usr/bin/env zsh

# Путь установки интеграций
INTEGRATIONS_PATH="${YAKUAKE_LIBS_PATH}/dist/integrations"

# Создаем директорию для интеграций если её нет
ensure_dist_exists
if ! check_dir_exists "$INTEGRATIONS_PATH"; then
    mkdir -p "$INTEGRATIONS_PATH"
fi

# Устанавливаем fzf
if ! command -v fzf &> /dev/null; then
    # Проверяем существование директории fzf
    if [[ ! -d "${INTEGRATIONS_PATH}/fzf" ]]; then
        git clone --depth 1 --quiet https://github.com/junegunn/fzf.git "${INTEGRATIONS_PATH}/fzf"
    elif [[ -d "${INTEGRATIONS_PATH}/fzf/.git" ]]; then
        # Если директория существует и это git репозиторий, обновляем
        cd "${INTEGRATIONS_PATH}/fzf" && git pull --quiet
    fi
    
    # Устанавливаем/обновляем бинарный файл
    "${INTEGRATIONS_PATH}/fzf/install" --bin --quiet
    
    # Удаляем .git директорию
    rm -rf "${INTEGRATIONS_PATH}/fzf/.git"
fi

# Добавляем fzf в PATH если его там нет
if [[ ! -d "${INTEGRATIONS_PATH}/fzf/bin" ]]; then
    export PATH="${INTEGRATIONS_PATH}/fzf/bin:$PATH"
fi

# Проверяем наличие fzf перед установкой zoxide
if command -v fzf &> /dev/null; then
    # Устанавливаем zoxide если его нет
    if ! command -v zoxide &> /dev/null; then
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
    fi
fi

# Очищаем все .git директории в dist
find "${YAKUAKE_LIBS_PATH}/dist" -name ".git" -type d -exec rm -rf {} + 