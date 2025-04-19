#!/usr/bin/env zsh

# Определяем базовую директорию
export YAKUAKE_LIBS_PATH="${0:A:h}"

# Подключаем утилиты
source "${YAKUAKE_LIBS_PATH}/utils/common.zsh"

# Подключаем модули
for module in "${YAKUAKE_LIBS_PATH}"/modules/*/main.zsh; do
    source "$module"
done

# Здесь можно подключать другие модули
# source "${YAKUAKE_LIBS_PATH}/другой_модуль/main.zsh" 