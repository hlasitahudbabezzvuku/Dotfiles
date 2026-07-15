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

bell ()
{
    printf "\e]777;notify;%s;%s\e\\" "${1:-Terminal Notification}" "${2:-Default terminal notification}"
}
