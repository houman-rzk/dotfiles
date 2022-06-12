# zsh config file

# Enable colors and change prompt:
autoload -U colors && colors		# Load colors
PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$reset_color%}%B:%{$fg[magenta]%}%~%{$fg[red]%}%{$reset_color%}%B$%b "
setopt autocd				# Automatically cd into typed directory.
stty stop undef				# Disable ctrl-s to freeze terminal.
setopt interactive_comments

export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line ; zle -N edit-command-line	# Enables 'edit-command-line' command to edit the current command
zstyle :zle:edit-command-line editor vim -u $VIMRC -f	# Sets the editor that will edit the command

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[[P' delete-char
bindkey '^?' backward-delete-char

# Other keybindings (got them using 'cat', can also use 'autoload zkbd ; zkbd').
bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey -v '^[.' insert-last-word

# Edit line in vim with ctrl-x.
bindkey '^x' edit-command-line
bindkey -M vicmd '^x' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^?' vi-backward-delete-char
bindkey -M visual '^[[P' vi-delete

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-line-init
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

[[ -f "$ALIASRC" ]] && source "$ALIASRC"
