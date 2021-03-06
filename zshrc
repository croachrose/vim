# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
eval `dircolors`
unalias : > /dev/null 2>&1
case "$TERM" in
xterm)
  export TERM=xterm-256color
  ;;
*)
  ;;
esac

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(docker gitignore git golang ant python ssh-agent vagrant zsh-syntax-highlighting zsh-autosuggestions zsh-completions)
autoload -U compinit && compinit

# Add ssh identities
if [ -z "$SSH_TTY" ]; then
  zstyle :omz:plugins:ssh-agent identities id_rsa_github google_compute_engine
  export SSH_KEY_PATH="~/.ssh/id_rsa_github"
fi

source $ZSH/oh-my-zsh.sh

# Custom hightlight colors
ZSH_HIGHLIGHT_STYLES[alias]='fg=blue'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=blue'
ZSH_HIGHLIGHT_STYLES[function]='fg=blue'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=blue,underline'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=blue'
ZSH_HIGHLIGHT_STYLES[path]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=cyan,underline'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=cyan'
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set all aliases at the end to avoid setting the : alias.
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias :="cd ../"
alias ::="cd ../../"
alias :::="cd ../../../"
alias ::::="cd ../../../../"
alias :::::="cd ../../../../../"
alias ::::::="cd ../../../../../../"
alias :::::::="cd ../../../../../../../"
alias ::::::::="cd ../../../../../../../../"

export VIRTUAL_ENV_DISABLE_PROMPT=yes
export VISUAL=vi

setopt appendhistory
setopt nosharehistory
setopt no_prompt_sp

export WORKON_HOME=$HOME/.virtualenvs
if [ -e '/usr/local/bin/virtualenvwrapper.sh' ]; then
  source '/usr/local/bin/virtualenvwrapper.sh'
fi

if [ -d "$HOME/google-cloud-sdk" ]; then
  # The next line updates PATH for the Google Cloud SDK.
  source "$HOME/google-cloud-sdk/path.zsh.inc"

  # The next line enables shell command completion for gcloud.
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

if [ -d "/usr/share/google-cloud-sdk" ]; then
  source "/usr/share/google-cloud-sdk/completion.zsh.inc";
fi

if command -v kubectl > /dev/null; then
  source <(kubectl completion zsh)
fi
