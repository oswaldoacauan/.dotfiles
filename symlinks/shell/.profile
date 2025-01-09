export GPG_TTY=$(tty)

# source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
# source /opt/homebrew/opt/chruby/share/chruby/auto.sh

# [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
# if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
#    export GPG_AGENT_INFO
# else
#    eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
# fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`

export NODE_GYP_FORCE_PYTHON=/opt/homebrew/bin/python3.10

export GEM_HOME="$HOME/.gem"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export GITLAB_TOKEN="$(git config --global gitlab.oauth-token)"

export EDITOR=cursor

export HOMEBREW_NO_ENV_HINTS=0

eval "$(fastly --completion-script-zsh)"
