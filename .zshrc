fpath=(~/.zsh/{completion,functions/prompts} $fpath)

# OS-specific zsh configuration file
os_config_file=$HOME/.zshrc.$(uname -s | tr "[:upper:]" "[:lower:]")
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

# load local and OS-specific zsh settings
[[ -f $os_config_file ]] && source $os_config_file
[[ -f $local_config_file ]] && source $local_config_file

# select promt variant depending on remote login and color support.
select_prompt() {
    prompt_name=$1
    # use nocolor theme if terminal is "dumb"
    [[ "$TERM" = "dumb" ]] && prompt_name+="_nocolor"
    # use ssh theme if connected by ssh
    [[ -n "$SSH_CONNECTION" ]] && prompt_name+="_ssh"
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
bindkey "^H" backward-delete-char
bindkey -M vicmd "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey -M vicmd "^?" backward-delete-char

setopt extendedglob

# prevent extendedglob from being used with git
alias git='noglob git'
# list files with details
alias ll='ls -l'
# lists all files
alias lsh='ls -da .*'
# list all files with details
alias llh='ll -da .*'
# allow color in less by default
alias less='less -R'
# color tree output and ignore .git directory
alias tree='tree -CF -I .git'
# go to git project root
alias git-root='cd $(git rev-parse --show-toplevel)'
# print paths
alias paths='echo $PATH | tr ":" "\n"'
# create a new tmux session
alias tnews='tmux new-session -s'
# attach tmux session
alias tatts='tmux attach-session -t'
# kill tmux session
alias tkills='tmux kill-session -t'
# list all tmux sessions
alias tlists='tmux list-session'
# attach remote tmux session
tssh() { ssh -t $1 "tmux attach-session -t $2" }

# start tmux session which is killed when exited
tmuxterm() {
	local sessionid="term-$(uuidgen)"
	trap "_tmuxterm_exit $sessionid 2> /dev/null" EXIT
	tmux new-session -s "$sessionid" $*
}

_tmuxterm_exit() {
	local sessionid=$1
	if tmux has-session -t "$sessionid"; then
		tmux kill-session -t "$sessionid"
	fi
}

