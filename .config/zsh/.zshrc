# Prompt
autoload -Uz colors
colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/Users/georgemusker/.config/zsh/.zshrc'

fpath=(~/.config/zsh/completions "${fpath[@]}")

autoload -Uz compinit
compinit

# custom completions and plugins
source "$ZDOTDIR/plugins/vi-mode.zsh"
source "$ZDOTDIR/plugins/nvm.plugin.zsh"
[[ -f "$ZDOTDIR/plugins/nx.plugin.zsh" ]] && source "$ZDOTDIR/plugins/nx.plugin.zsh"

# custom functions
source "$XDG_CONFIG_HOME/shell/aliases"
source "$XDG_CONFIG_HOME/shell/functions"

# vi completion navigation
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-up-line-or-history

# fish substring search
bindkey '^[OA' history-substring-search-up
bindkey '^[OB' history-substring-search-down

# no cd
setopt autocd extendedglob nomatch
unsetopt beep

stty stop undef # disable ^s terminal freeze

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

[[ -f /usr/share/autojump/autojump.zsh ]] && source /usr/share/autojump/autojump.zsh
source "$ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

