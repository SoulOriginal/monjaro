#!/usr/bin/env zsh

# Сначала подключаем установку и инициализацию
source "${0:A:h}/install.zsh"

# Автозагрузка функций
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# После инициализации подключаем конфигурацию
source "${0:A:h}/config.zsh" 