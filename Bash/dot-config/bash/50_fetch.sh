(
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
        for ((i = 0; i < 20; i++)); do
            printf "%s" "${FETCH_CHARS[ $RANDOM % ${#FETCH_CHARS[@]} ]}"
            done
    }

    printf "\n%s   ╭─────────── HlasitaHudbaBezZvuku ───────────╮" "$( noise )"
    printf "\n%s     user:        %s"                              "$( noise )" "${USER}"
    printf "\n%s     hostname:    %s"                              "$( noise )" "${HOSTNAME}"
    printf "\n%s   ╰────────────────────────────────────────────╯" "$( noise )"

    if [ -f /etc/os-release ]; then
        source /etc/os-release
        printf "\n%s   ╭────────────────────────────────────────────╮" "$( noise )"
        printf "\n%s     name:        %s"                              "$( noise )" "${NAME}"
        printf "\n%s     variant:     %s"                              "$( noise )" "${VARIANT}"
        printf "\n%s     version:     %s"                              "$( noise )" "${VERSION_ID}"
        printf "\n%s   ╰────────────────────────────────────────────╯" "$( noise )"
    fi

    printf "\n"
)
