(
    if [[ -n ${SSH_TTY+x} ]] &> /dev/null; then
        printf "\n"
    fi

    readonly -a FETCH_CHARS=(               # List of names that are used for selecting the names of the Belora sessions
        "🬀" "🬁" "🬂" "🬃" "🬄"
        "🬅" "🬆" "🬇" "🬈" "🬉"
        "🬊" "🬋" "🬏" "🬞" "🬟"
        "🬐" "🬑" "🬒" "🬓" "🬔"
        "🬕" "🬖" "🬗" "🬘" "🬙"
        "🬚" "🬛" "🬜" "🬠" "🬡"
        "🬢" "🬣" "🬤" "🬥" "🬦"
        "🬧" "🬨" "🬩" "🬪" "🬫"
    )

    noise ()
    {
        for ((i = 0; i < 18; i++)); do
            printf "%s" "${FETCH_CHARS[ ${RANDOM} % ${#FETCH_CHARS[@]} ]}"
        done
    }

    printf "%s╭────────────────────╮ ╭──────%s HlasitaHudbaBezZvuku %s──────╮\n" "$( rgb fg 240 246 252 )" "$( rgb fg 0 0 0 && rgb bg 240 246 252 )" "$( rgb reset && rgb fg 240 246 252 )"
    printf "  %s     user:        %s\n"                      "$( noise )" "${USER}"
    printf "  %s     hostname:    %s\n"                      "$( noise )" "${HOSTNAME}"
    printf "  %s   ╰────────────────────────────────────╯\n" "$( noise )"

    if [ -f /etc/os-release ]; then
        source /etc/os-release
        printf "  %s   ╭────────────────────────────────────╮\n" "$( noise )"
        printf "  %s     name:        %s\n"                      "$( noise )" "${NAME}"
        printf "  %s     variant:     %s\n"                      "$( noise )" "${VARIANT}"
        printf "  %s     version:     %s\n"                      "$( noise )" "${VERSION_ID}"
        printf "╰────────────────────╯ ╰────────────────────────────────────╯\n"
    fi
)
