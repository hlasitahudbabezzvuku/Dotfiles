c1="38;2;255;255;255"
c2="0;34"

readonly -a FETCH_CHARS=(               # List of names that are used for selecting the names of the Belora sessions
    "🬐" "🬑" "🬒" "🬓" "🬔"
    "🬕" "🬖" "🬗" "🬘" "🬙"
    "🬚" "🬛" "🬜" "🬠" "🬡"
    "🬢" "🬣" "🬤" "🬥" "🬦"
    "🬧" "🬨" "🬩" "🬪" "🬫"
    " " " " " " " " " "
)

noise ()
{
    for ((i = 0; i < ${1}; i++)); do
        printf "%s" "${FETCH_CHARS[ $RANDOM % ${#FETCH_CHARS[@]} ]}"
    done
}

printf "       ╭──────╮\n"
printf "       │%s│\n" "$( noise 6 )"
printf "       │%s│\n" "$( noise 6 )"
printf "╭──────┼──────╯\n"
printf "│%s│\n" "$( noise 6 )"
printf "│%s│\n" "$( noise 6 )"
printf "╰──────╯\n"

# printf "\033[%sm      _____\n"                            "${c2}"
# printf "     /   __)\033[%sm%s\033[%sm\n"                 "${c1}" "\\" "${c2}"
# printf "     |  /  \033[%sm\\ %s\033[%sm\n"               "${c1}" "\\" "${c2}"
# printf "  \033[%sm__\033[%sm_|  |_\033[%sm_/ /\033[%sm\n" "${c1}" "${c2}" "${c1}" "${c2}"
# printf " \033[%sm/ \033[%sm(_    _)\033[%sm_/\033[%sm\n"  "${c1}" "${c2}" "${c1}" "${c2}"
# printf "\033[%sm/ /\033[%sm  |  |\n"                      "${c1}" "${c2}"
# printf "\033[%sm\\ %s\033[%sm__/  |\n"                    "${c1}" "\\" "${c2}"
# printf " \033[%sm%s\033[%sm(_____/\n"                     "${c1}" "\\" "${c2}"

# printf '\n%s┌─────────── %sHlasitaHudbaBezZvuku%s ───────────┐%s' "$( tput setaf 8 )" "$( tput setaf 4 )" "$( tput setaf 8 )" "$( tput sgr0 )"
# printf '\n  user:       %s' "$( whoami )"
# printf '\n  hostname:   %s' "$( hostname )"
# printf '\n  uptime:     %s' "$( uptime -p )"
# printf '\n%s└────────────────────────────────────────────┘%s\n' "$( tput setaf 8 )" "$( tput sgr0 )"
