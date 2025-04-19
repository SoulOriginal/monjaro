#!/usr/bin/env zsh

# Проверка существования директории
function ensure_dir_exists() {
    local dir_path="$1"
    if [[ ! -d "$dir_path" ]]; then
        mkdir -p "$dir_path"
    fi
}

# Проверка существования dist директории
function ensure_dist_exists() {
    ensure_dir_exists "${YAKUAKE_LIBS_PATH}/dist"
}

# Проверка существования файла
function check_file_exists() {
    local file_path="$1"
    [[ -f "$file_path" ]]
    return $?
}

# Проверка существования директории
function check_dir_exists() {
    local dir_path="$1"
    [[ -d "$dir_path" ]]
    return $?
} 