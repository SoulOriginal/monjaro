#!/usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of initialization.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Базовые настройки powerlevel10k
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Настройки сегментов
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon                 # Иконка операционной системы
    dir                     # Текущая директория
    vcs                     # Информация о git
    status                  # Статус последней команды
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    time                    # Текущее время
    background_jobs         # Фоновые задачи
)

# Настройки стиля
typeset -g POWERLEVEL9K_MODE='nerdfont-complete'
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}❯%f '

# Настройки директории
typeset -g POWERLEVEL9K_DIR_BACKGROUND='blue'
typeset -g POWERLEVEL9K_DIR_FOREGROUND='black'
typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
typeset -g POWERLEVEL9K_SHORTEN_STRATEGY='truncate_middle'

# Настройки Git
typeset -g POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
typeset -g POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black' 