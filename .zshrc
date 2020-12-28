# Path
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

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
alias cat='bat'
alias g='git'
alias gl='git log --pretty="format:%C(yellow)%h %C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]" --date=iso -50'
alias gb='git branch'
alias gs='git status -s'
alias gp='git push'
alias gc='git clone'
alias gf='git add . && git commit -m "fix" && git push'
alias gpl='git pull'
alias gch='git branch | fzf | xargs git checkout && git pull'
alias gbd='git branch | fzf | xargs git branch -d'
alias d='docker'
alias dc='docker-compose'
alias de='docker exec -it'
alias nb='jupyter notebook'
alias pip='pip3'
alias python='python3'
alias k='kubectl'
alias ktx='kubectx'
alias kns='kubens'
alias bp='bpctl'

# Color
autoload -Uz colors && colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# Prompt
PROMPT="%{${fg[cyan]}%}$ %{${reset_color}%}"

# option
#setopt share_history
setopt hist_ignore_all_dups
setopt auto_cd
setopt auto_list
setopt auto_menu

# Autoload
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# function
function fh() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
}
zle -N fh
bindkey '^r' fh

function fs() {
    local sshLoginHost=`cat ~/.ssh/config | grep -E "Host\s" | grep -v \* | awk '{print $2}' | fzf`
    if [ "$sshLoginHost" = "" ]; then
        return 1
    fi
    ssh ${sshLoginHost}
}

function fcd() {
		local project=`ghq list | fzf`
		if [ "$project" = "" ]; then
						return 1
		fi
		cd ~/ghq/${project}
}

function fc() {
		local project=`ghq list | fzf`
		if [ "$project" = "" ]; then
						return 1
		fi
		cd ~/ghq/${project} && code ~/ghq/${project}
}

function fcc() {
		local project=`ls ~/projects | awk '{print $7}' | fzf`
		if [ "$project" = "" ]; then
						return 1
		fi
		cd ~/projects/${project} && code ~/projects/${project}
}

function fv() {
		local project=`ls ~/projects | awk '{print $7}' | fzf`
		if [ "$project" = "" ]; then
						return 1
		fi
		vim ~/projects/${project}
}

function ts() {
	if [ -n "$SESSION_NAME" ];then
		session=$SESSION_NAME
	else
		session=multi-ssh-`date +%s`
	fi
	window=multi-ssh

	### tmuxのセッションを作成
	tmux new-session -d -n $window -s $session

	### 各ホストにsshログイン
	# 最初の1台はsshするだけ
	tmux send-keys "ssh $1" C-m
	shift

	# 残りはpaneを作成してからssh
	for i in $*;do
		tmux split-window
		tmux select-layout tiled
		tmux send-keys "ssh $i" C-m
	done

	### 最初のpaneを選択状態にする
	tmux select-pane -t 0

	### paneの同期モードを設定
	tmux set-window-option synchronize-panes on

	### セッションにアタッチ
	tmux attach-session -t $session
}
