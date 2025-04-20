############################################################
# BashRC (zshenv)
# - - - - - - - -
# Simon Bloch
# Updated: 2022-12-15
############################################################

############################################################
######################### IMPORTS ##########################
############################################################

source ~/.fj_custom_funcs.sh
source ~/.fj_api_keys.sh


############################################################
####################### SHELL PROMPT #######################
############################################################

#PS1='%1~> '
#PS1="\n %K{#202020}%F{green}SJB [%D{%F} %D{%H:%M}] %1~>%f%k "
setopt PROMPT_SUBST
PS1=$'\n%K{#282828}%F{#7e9f7f}SJB [%D{%F} %D{%H:%M}] %1~>%f%k '

############################################################
######################### ENV VARS #########################
############################################################


############################################################
# Initial PATH Setup:
eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="~/Packages:$PATH"
export PATH="/Users/jupiter/.local/bin:$PATH"

############################################################
# PYENV

export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH"


eval "$(pyenv init --path)" 
eval "$(pyenv init -)"

############################################################
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


############################################################
# LLM API KEYS

export EA_ORGANIZATION_ID="org-C0EtcS2ahnwfD4ZtI3GNOZek"

export ARCGIS_API_KEY=$FJ_ARCGIS_API_KEY

export ANTHROPIC_CLAUDE_API_KEY=$FJ_ANTHROPIC_CLAUDE_API_KEY

export ANTHROPIC_CLAUDE_API_KEY2=$FJ_ANTHROPIC_CLAUDE_API_KEY2

export OPENAI_API_KEY=$FJ_OPENAI_API_KEY

export DEEPSEEK_API_KEY=$FJ_DEEPSEEK_API_KEY

export GEMINI_API_KEY=$FJ_GEMINI_API_KEY

############################################################
################# General Aliases/Shortuts #################
############################################################

alias brc="emacs ~/.zshenv"
alias sbrc="source ~/.zshenv"
alias org="cd ~/org"
alias todo="cd ~/org && emacs todo/todo.org"
alias la="ls -lAht"

alias gitlog='echo "\n\n\n\n" && git log --max-count=6'
alias rec="git log -6 --name-only --pretty=format:\"\""
alias vcheck="emacs --version && node -v && npm list react"


############################################################
######################### FJ Home ##########################
############################################################

alias clean='clean_func'
alias notes='cd ~/org/notes'
alias note='create_new_note'
alias j='create_new_journal_entry'
alias js='cd ~/org/notes && ls -ltr'
alias tt='cd ~/org && emacs tt.org'
alias cfg='cd /Users/jupiter/fj/emacs-config'
alias e='cd /Users/jupiter/.emacs.d'
alias ec='cd /Users/jupiter/fj/emacs-config'
alias config='bash /Users/jupiter/fj/emacs-config/update_config_repo.sh'
alias cmds='cat /Users/jupiter/fj/cmds.org'
############################################################
########################### Project Specific Aliases #######
############################################################

alias sjb="cd /Users/jupiter/fj/site/s-j-b.github.io"
alias site="cd /Users/jupiter/fj/site/sjb_site_master/sjb-master/src/components"
alias map="cd /Users/jupiter/fj/site/sjb_site_master/sjb-master/src/components/map"
alias ste="cd /Users/jupiter/fj/site/sjb_site_master/sjb-master"
alias sjbdeploy="/Users/jupiter/fj/site/sjb_site_master/sjb-master/sjb_deploy.sh"
alias nr="cd /Users/jupiter/fj/site/tnr-site-master/dev/tnr-site-app/src/components"
alias tnr="nvm use 18 && cd /Users/jupiter/fj/site/tnr-site-master/dev/tnr-site-app"
alias tnrdeploy="nvm use 18 && /Users/jupiter/fj/site/tnr-site-master/dev/tnr-site-app/tnr_deploy.sh"
alias sph="cd /Users/jupiter/fj/spacetime_help/pres_data_getter"
alias bu="cd /Users/jupiter/fj/site/sjb_site_master/backup"
alias lc="cd /Users/jupiter/fj/temp/leetcode"

############################################################
######################### ENLIGHT ##########################
############################################################

alias ea="cd /Users/jupiter/fj/ea/Enlight/client"
alias eaa="cd /Users/jupiter/fj/ea/Enlight"
alias eas="nvm use 16 && cd /Users/jupiter/fj/ea/Enlight/server/src"
alias eass="nvm use 16 && cd /Users/jupiter/fj/ea/Enlight/server"
alias eac="nvm use 16 && cd /Users/jupiter/fj/ea/Enlight/client/src"
alias eacc="nvm use 16 && cd /Users/jupiter/fj/ea/Enlight/client"
alias eag="cd /Users/jupiter/fj/ea/EA_ML"
alias cenv="cd /Users/jupiter/fj/ea/Enlight/client && emacs .env"
alias ean="cd /Users/jupiter/org/ea"
alias eacur="emacs /Users/jupiter/org/ea_cur"
alias lms="cd /Users/jupiter/fj/ea/SankofaLMS/EnlightappXSankofa/enlight_x_sankofa"
alias sank="nvm use 20 && cd /Users/jupiter/fj/ea/SankofaLMS/EnlightappXSankofa/enlight_x_sankofa"
alias san="cd /Users/jupiter/fj/ea/SankofaLMS/sankofa-POC"

############################################################
############################################################

