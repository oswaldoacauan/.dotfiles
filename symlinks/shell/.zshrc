source /opt/homebrew/share/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle z
antigen bundle djui/alias-tips
antigen bundle mafredri/zsh-async@main

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

source ~/.profile
source ~/.aliases