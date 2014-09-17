fpath=(~/.zsh/functions/{Prompts,Completion} $fpath)

# local zsh configuraiton file
local_config_file=$HOME/.zshrc.local
# prompt theme name
prompt="colorful"

# advanced auto completion
autoload -U compinit && compinit
# promt theme switching
autoload -U promptinit && promptinit
# color constants
autoload -U colors && colors

# load local zsh settings from .zshrc.local
[[ -f $local_config_file ]] && source $local_config_file

# select promt variant depending on remote login and color support.
select_prompt() {
    prompt_name=$1
    # use nocolor theme if terminal is "dumb"
    [[ "$TERM" = "dumb" ]] && prompt_name+="_nocolor"
    # use ssh theme if connected by ssh
    [ "$SSH_CONNECTION" ] && prompt_name+="_ssh"
    # set zsh prompt
    prompt $prompt_name
}

select_prompt $prompt

# enable 256 colors
export TERM=xterm-256color
# default editor
export EDITOR=vim
export VISUAL=vim
export LSCOLORS='ExGxCxFxDxdxBxbDeDDEaE'

# vim mode in ZSH
bindkey -v
# ^R for history search
bindkey "^R" history-incremental-search-backward
bindkey -M vicmd "^R" history-incremental-search-backward
bindkey "^U" kill-whole-line
bindkey -M vicmd "^U" kill-whole-line
setopt extendedglob

case $(uname -s) in
	Linux)
		alias ls="ls -F --color=auto" ;;
	Darwin)
		alias ls="ls -FG" ;;
esac

# list files with details
alias ll="ls -l"
# lists all files
alias lsh='ls -da .*'
# list all files with details
alias llh='ls -da .*'
# create a new tmux session
alias tnews='tmux new-session -s'
# attach tmux session
alias tatts='tmux attach-session -t'
# kill tmux session
alias tkills='tmux kill-session -t'
# list all tmux sessions
alias tlists='tmux list-session'

