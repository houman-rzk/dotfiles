# zsh config file

# Plugins and themes
#if [ -d $ZSH ] ; then
#    plugins=(vi-mode sudo archlinux web-search)
#    plugins=(sudo web-search)
#    ZSH_THEME="random"
#    source $ZSH/oh-my-zsh.sh
#fi

# Enable colors and change prompt:
autoload -U colors && colors		# Load colors
PS1="%B%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$reset_color%}%B:%{$fg[magenta]%}%~%{$fg[red]%}%{$reset_color%}%B$%b "
[ -n "$LF_LEVEL" ] && PS1="$PS1""(lf: $LF_LEVEL) "
setopt autocd				# Automatically cd into typed directory.
stty stop undef				# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# Changing history
setopt hist_ignore_dups

export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/zcompdump"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -d $XDG_CACHE_HOME/zsh/zcompdump
_comp_options+=(globdots)		# Include hidden files.

# Enable zmv
autoload -U zmv

# vi mode
bindkey -v
export KEYTIMEOUT=1
autoload edit-command-line ; zle -N edit-command-line	# Enables 'edit-command-line' command to edit the current command
zstyle :zle:edit-command-line editor $EDITOR -f		# Sets the editor that will edit the command

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
bindkey '^[.' insert-last-word
#bindkey '^P' up-history
#bindkey '^N' down-history
bindkey '^R' history-incremental-pattern-search-backward
bindkey '^F' history-incremental-pattern-search-forward
bindkey -M vicmd '^R' history-incremental-pattern-search-backward
bindkey -M vicmd '^F' history-incremental-pattern-search-forward
bindkey -M vicmd '^[.' insert-last-word
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^?' vi-backward-delete-char
bindkey -M visual '^[[P' vi-delete
bindkey '^ ' autosuggest-accept
bindkey -r '^s'
#bindkey -M vicmd '^s' sudo-command-line
#bindkey -M viins '^s' sudo-command-line

# Edit line in vim with ctrl-x.
bindkey '^x' edit-command-line
bindkey -M vicmd '^x' edit-command-line

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}

zle -N zle-keymap-select
zle -N zle-line-init

# Set window title
#DISABLE_AUTO_TITLE="true"
#precmd() {print -n "\033kst $PWD\033\134"}
precmd() {print -nP "\033k%n@%M:%~\033\134"}

# Source command and directory aliases and shortcuts
[[ -f "$ALIASRC" ]] && source "$ALIASRC"
[ -f "$XDG_CONFIG_HOME/shell/zshnameddirrc" ] && source "$XDG_CONFIG_HOME/shell/zshnameddirrc"
[ -f "$XDG_CONFIG_HOME/shell/shortcutrc" ] && source "$XDG_CONFIG_HOME/shell/shortcutrc"

# Load other plugins
source $XDG_CONFIG_HOME/zsh/themes/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

#cat $XDG_CACHE_HOME/wal/sequences
#fortune -s | cowsay

# Case-insensitive autocomplete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
