export GPG_TTY="$( tty )"

export HISTFILESIZE=8192
export PAGER=less

alias ls="ls -h --color"
alias ll="ls -lv --group-directories-first"
alias la="ll -a"
alias lr="ll -R"

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'

if type nvim &> /dev/null; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    alias vi=nvim
fi

