PS1=""

# Start Section
PS1+="\n\[$( rgb reset && rgb fg 240 246 252 )\]╭─\[$( rgb fg 0 0 0 )\]\[$( rgb fg 240 246 252 && rgb bg 0 0 0 )\]   "

# Jobs Module
PS1+="\$( if [[ \"\$( jobs )\" != \"\" ]] &> /dev/null; then rgb ansi_fg 2; printf \"\"; rgb fg 0 0 0 && rgb ansi_bg 2; printf \" \j \"; rgb fg 240 246 252; fi )"

# Host Section
PS1+="\[$( rgb fg 0 0 0 && rgb bg 240 246 252 )\] \h \[$( rgb fg 240 246 252 )\]"

# SSH Module
PS1+="\$( if [[ -n \${SSH_TTY+x} ]] &> /dev/null; then rgb ansi_bg 5; printf \"\"; rgb fg 0 0 0; printf \" SSH \"; rgb ansi_fg 5; fi )"

# Time Section
PS1+="\[$( rgb bg 0 0 0 )\]\[$( rgb fg 240 246 252 )\]  \t \[$( rgb reset && rgb fg 0 0 0 )\]"

# Git Module
PS1+="\$( if [[ -d .git/ ]] &> /dev/null; then rgb ansi_bg 1; printf \"  \"; rgb reset && rgb ansi_fg 1; fi )"

# Path Section
PS1+="  \[$( rgb fg 131 138 146 )\]\w\[$( rgb reset )\]"

# End Section
PS1+="\n\[$( rgb fg 240 246 252 )\]╰─\[$( rgb reset )\] "
