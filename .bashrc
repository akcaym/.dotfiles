### ENVIRONMENT
export TERM="xterm-256color"    # getting proper colors
export EDITOR=vim

### PATH


### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control


# Don't add duplicate lines or lines beginning with a space to the history
HISTCONTROL=ignoreboth

# Set history format to include timestamps
HISTTIMEFORMAT="%Y-%m-%d %T "

### PS1 PROMPT
# This is commented out if using starship prompt
#tty -s && export PS1="\[\033[38;5;35m\]\t [\[\033[38;5;33m\]\j\[\033[38;5;35m\]] [\h:\[$(tput sgr0)\]\[\033[38;5;33m\]\w\[$(tput setaf 3)\]]\n\\[\033[38;5;35m\]🦄 \[$(tput sgr0)\]"


eval "$(starship init bash)"
