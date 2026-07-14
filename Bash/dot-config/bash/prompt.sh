PS1=""

rgb ()
{
    if [[ "${1}" == "reset" ]]; then
        printf "\033[0m"
    elif [[ "${1}" == "fg" ]]; then
        printf "\033[38;2;%i;%i;%im" "${2}" "${3}" "${4}"
    elif [[ "${1}" == "bg" ]]; then
        printf "\033[48;2;%i;%i;%im" "${2}" "${3}" "${4}"
    elif [[ "${1}" == "ansi_fg" ]]; then
        printf "\033[0;3%im" "${2}"
    elif [[ "${1}" == "ansi_bg" ]]; then
        printf "\033[4%im" "${2}"
    fi
}

# Start Section
PS1+="\n$( rgb reset && rgb fg 255 255 255 )╭─$( rgb fg 0 0 0 )$( rgb fg 255 255 255 && rgb bg 0 0 0 )   "

# Jobs Module
PS1+="\$( if [[ \"\$( jobs )\" != \"\" ]] &> /dev/null; then rgb ansi_fg 2; printf \"\"; rgb fg 0 0 0 && rgb ansi_bg 2; printf \" \j \"; rgb fg 255 255 255; fi )"

# Host Section
PS1+="$( rgb fg 0 0 0 && rgb bg 255 255 255 ) \h $( rgb fg 255 255 255 )"

# SSH Module
PS1+="\$( if [[ -n \${SSH_TTY+x} ]] &> /dev/null; then rgb ansi_bg 5; printf \"\"; rgb fg 0 0 0; printf \" SSH \"; rgb ansi_fg 5; fi )"

# Time Section
PS1+="$( rgb bg 0 0 0 )$( rgb fg 255 255 255 )  \t $( rgb reset && rgb fg 0 0 0 )"

# Git Module
PS1+="\$( if [[ -d .git/ ]] &> /dev/null; then rgb ansi_bg 1; printf \"  \"; rgb reset && rgb ansi_fg 1; fi )"

# Path Section
PS1+="  $( rgb fg 170 170 170 )\w$( rgb reset )"

# End Section
PS1+="\n$( rgb fg 255 255 255 )╰─$( rgb reset ) "
