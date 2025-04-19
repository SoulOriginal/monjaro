#!/usr/bin/env zsh

# Путь установки powerlevel10k
POWERLEVEL10K_INSTALL_PATH="${YAKUAKE_LIBS_PATH}/dist/powerlevel10k"

# Проверяем, установлен ли уже powerlevel10k
if [[ ! -f "${POWERLEVEL10K_INSTALL_PATH}/powerlevel10k.zsh-theme" ]]; then
    echo "Устанавливаем powerlevel10k..."
    
    # Создаем директорию dist если она не существует
    ensure_dist_exists
    
    # Удаляем директорию если она существует
    [[ -d "$POWERLEVEL10K_INSTALL_PATH" ]] && rm -rf "$POWERLEVEL10K_INSTALL_PATH"
    
    # Клонируем репозиторий
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_INSTALL_PATH"
    
    # Проверяем успешность установки
    if [[ -f "${POWERLEVEL10K_INSTALL_PATH}/powerlevel10k.zsh-theme" ]]; then
        # Удаляем .git директорию только после успешной установки
        rm -rf "${POWERLEVEL10K_INSTALL_PATH}/.git"
        echo "powerlevel10k установлен успешно!"
    else
        echo "Ошибка установки powerlevel10k!"
        return 1
    fi
fi

# Подключаем тему
source "${POWERLEVEL10K_INSTALL_PATH}/powerlevel10k.zsh-theme" 