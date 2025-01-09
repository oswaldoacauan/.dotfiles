source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
# antigen bundle z
antigen bundle djui/alias-tips
antigen bundle mafredri/zsh-async@main

antigen bundle Aloxaf/fzf-tab
enable-fzf-tab

antigen bundle zsh-users/zsh-autosuggestions

# export NVM_AUTO_USE=true
# export NVM_LAZY_LOAD=true
# antigen bundle lukechilds/zsh-nvm

export PURE_PROMPT_SYMBOL=➜
# export PURE_PROMPT_SYMBOL=🔮
antigen bundle sindresorhus/pure@main

antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply

# function chpwd {
#   if [ "$(command -v nvm)" ]; then
#     if [ -f 'package.json' ]; then
#         nvm use
#     fi
#   fi
# }

# fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=selected-bg:#494d64 \
--multi
--height ~100% --tmux bottom,40% --layout reverse --border top
"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
  --select-1 --exit-0"
export FZF_ALT_C_OPTS="--select-1 --exit-0"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# Options for path completion (e.g. vim **<TAB>)
export FZF_COMPLETION_PATH_OPTS='--walker file,dir,follow,hidden'

# Options for directory completion (e.g. cd **<TAB>)
export FZF_COMPLETION_DIR_OPTS='--walker dir,follow'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments ($@) to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

source <(fzf --zsh)

eval "$(zoxide init zsh)"

source ~/.profile
source ~/.aliases