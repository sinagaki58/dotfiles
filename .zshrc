# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "zsh-users/zsh-completions"
zplug "norman-abramovitz/cf-zsh-autocomplete-plugin"
if ! zplug check; then
	zplug install
fi
zplug load

# Alias
alias ls='exa -la'
alias g='git'
alias gl='git log --pretty="format:%C(yellow)%h %C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]" --date=iso -50'
alias gb='git branch'
alias gs='git status -s'
alias gp='git push'
alias gpl='git pull'
alias gch='git branch -a | fzf | xargs git checkout'
alias gbd='git branch | fzf | xargs git branch -d'
alias d='docker'
alias dc='docker-compose'
alias de='docker exec -it'
alias tmux='tmux -CC'
alias nb='jupyter notebook'

# Color
autoload -Uz colors && colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# Prompt
PROMPT="%{${fg[cyan]}%}λ %{${reset_color}%}"

# option
setopt share_history
setopt hist_ignore_all_dups
setopt auto_cd
setopt auto_list
setopt auto_menu

# Autoload
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# function
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N select-history
bindkey '^r' select-history

function fssh() {
    local sshLoginHost
    sshLoginHost=`cat ~/.ssh/config | grep -E "Host\s" | grep -v \* | awk '{print $2}' | fzf`
    if [ "$sshLoginHost" = "" ]; then
        return 1
    fi
    ssh ${sshLoginHost}
}

function fcd() {
		local project
		project=`ls ~/projects | awk '{print $7}' | fzf`
		if [ "$project" = "" ]; then
						return 1
		fi
		cd ~/projects/${project}
}

function fcode() {
		local project
		project=`ls ~/projects | awk '{print $7}' | fzf`
		if [ "$project" = "" ]; then
						return 1
		fi
		code ~/projects/${project}
}

