# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="archcraft"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="geany ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias ls='lsd'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"
alias rmpacmanlock="sudo rm /var/lib/pacman/db.lck"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

# yay as aur helper - updates everything
alias pksyua="paru -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#switch between bash and zsh
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats "%b"

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"
ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED=" ✹"
ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" ✭"

setopt prompt_subst
PROMPT="%F{011}%~ %F{060}%n@%m%F{010}"$'\n'" ❯ %f"
RPROMPT='%F{060}${vcs_info_msg_0_}`git_prompt_status`'

#ZSH_THEME=random
#ZSH_THEME_RANDOM_CANDIDATES=( "agnoster" "crunch" "fino-time" "funky" "jonathan" "junkfood" )

source $ZSH/oh-my-zsh.sh
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
HIST_STAMPS="dd/mm/yyyy"
compinit
_comp_options+=(globdots) # lets you tab complete hidden files by default

plugins=(
	git
	npm
	zsh-autosuggestions
	vi-mode
	zsh-syntax-highlighting
	)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.zshrc-personal ]] && . ~/.zshrc-personal

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
#gitcolorscript -r
neofetch
