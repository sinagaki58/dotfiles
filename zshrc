# Path
export PATH="$(stack path --local-bin):$PATH"
export PATH="$(stack path --compiler-bin):$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Environment

# Alias
alias ls='ls -lhpAGF'
alias g='git'
alias gch='git checkout'
alias gl='git log --pretty="format:%C(yellow)%h %C(green)%cd %C(reset)%s %C(red)%d %C(cyan)[%an]" --date=iso -50'
alias gs='git status -s'
alias d='docker'
alias dc='docker-compose'
alias de='docker exec -it'
alias tmux='tmux -CC'

# Color
autoload -Uz colors
colors
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# Prompt
#PROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}
#%{${fg[green]}%}❯ %{${reset_color}%}"
PROMPT="%{${fg[green]}%}❯ %{${reset_color}%}"

# History
setopt share_history
setopt hist_ignore_all_dups

# Autoload
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Move
setopt auto_cd
