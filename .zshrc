# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="${HOME}/.local/bin:${PATH}"

# Path to your oh-my-zsh installation.
  export ZSH="/home/cedric/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gruvbox"
SOLARIZED_THEME="dark"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  colorize
  docker
  fd
  fzf
  httpie
  jira
  ssh-agent
  ripgrep
  # taskwarrior
  vi-mode
  kubectl
  battery
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_PATH=/home/cedric/.nvm/versions/node/v11.6.0/lib/node_modules/

export VISUAL=nvim
export EDITOR="$VISUAL"


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export PATH="/home/cedric/.local/bin:$PATH"
export PATH=$PATH:"$ZSH_CUSTOM/plugins/navi"

bindkey -v # Vi m
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^R' history-incremental-search-backward

export KEYTIMEOUT=1 # reduce the timeout when changing mode

# start typing + Ctrl+P - fuzzy find history forward
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search

# start typing + Ctrl+N - fuzzy find history backward
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

# autoload -U edit-command-line
# zle -N edit-command-line
# bindkey -M vicmd v edit-command-line

alias ca="cd ~/code/apptweak"
alias caa="cd ~/code/apptweak/apptweak"
alias cab="cd ~/code/apptweak/apptweak-blog"
alias cai="cd ~/code/apptweak/infrastructure"

alias vim="nvim"

alias today_i="~/dotfiles/.scripts/tools/today_i"
alias yesterday_i="~/dotfiles/.scripts/tools/yesterday_i"
alias last_friday_i="~/dotfiles/.scripts/tools/last_friday_i"

alias vimrc="vim ~/.config/nvim/init.vim"
alias zshrc="vim ~/.zshrc"

withenv() {
  env $(cat .env | grep -v ^# | xargs) $@
}
# [ -f ~/.forgit/forgit.plugin.zsh ] && source ~/.forgit/forgit.plugin.zsh

export PATH="${PATH}:${HOME}/.local/bin/"
source /home/cedric/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source $HOME/.aliases

export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# eval "$(bw completion --shell zsh); compdef _bw bw;"
# remind ~/.reminders

export DENO_INSTALL="/home/cedric/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export NOTES_DIR="/home/cedric/Documents/Notes"

export TERMINAL="kitty"

alias get_idf='. $HOME/esp/esp-idf/export.sh'
eval "$(~/.rbenv/bin/rbenv init - zsh)"

RPROMPT='$(battery_pct_prompt)'
