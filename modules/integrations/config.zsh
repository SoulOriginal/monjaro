#!/usr/bin/env zsh

# Добавляем fzf в PATH если установлен локально
if [[ -d "${YAKUAKE_LIBS_PATH}/dist/integrations/fzf/bin" ]]; then
    export PATH="${YAKUAKE_LIBS_PATH}/dist/integrations/fzf/bin:$PATH"
fi

# Интеграция с fzf
if command -v fzf &> /dev/null; then
    eval "$(fzf --zsh)"
fi

# Интеграция с zoxide
if command -v zoxide &> /dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

# Настройки для manjaro
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
    source /usr/share/zsh/manjaro-zsh-config
fi

# Определение возможностей терминала
{
    if ! zmodload zsh/langinfo zsh/terminfo ||
       [[ $langinfo[CODESET] != (utf|UTF)(-|)8 || $TERM == (dumb|linux) ]] ||
       (( terminfo[colors] < 256 )); then
        # Не использовать powerline конфигурацию
        export USE_POWERLINE=false
        # Определить алиас 'x' если родительский процесс 'login'
        local parent
        if { parent=$(</proc/$PPID/comm) } && [[ ${parent:t} == login ]]; then
            alias x='startx ~/.xinitrc'
        fi
    else
        export USE_POWERLINE=true
    fi
} 2>/dev/null

# Дополнительные пути
export PATH=$PATH:$HOME/minio-binaries/ 