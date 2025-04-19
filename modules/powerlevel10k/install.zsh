#!/usr/bin/env zsh

# Путь установки powerlevel10k
POWERLEVEL10K_INSTALL_PATH="${YAKUAKE_LIBS_PATH}/dist/powerlevel10k"

# Проверяем, установлен ли уже powerlevel10k
if ! check_dir_exists "$POWERLEVEL10K_INSTALL_PATH"; then
    echo "Устанавливаем powerlevel10k..."
    
    # Создаем директорию dist если она не существует
    ensure_dist_exists
    
    # Клонируем репозиторий
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$POWERLEVEL10K_INSTALL_PATH"
    
    # Удаляем .git директорию
    rm -rf "${POWERLEVEL10K_INSTALL_PATH}/.git"
    
    echo "powerlevel10k установлен успешно!"
fi

# Подключаем тему
source "${POWERLEVEL10K_INSTALL_PATH}/powerlevel10k.zsh-theme" 