box ()
{
    ######################
    ### Initial Checks ###
    ######################

    if [ "${PWD}" = "${HOME}" ]; then
        printf "[ERROR]: Refusing to run in %s to prevent exposing personal files.\n" "${HOME}" 1>&2
        return 1
    fi

    declare -ra software_required=( "bash" "bwrap" "pi" )

    for i in "${software_required[@]}"; do
        if ! type "${i}" &> /dev/null; then
            printf "[ERROR]: Could not find \"%s\" binary\n" "${i}" 1>&2
            return 1
        fi
    done


    #####################
    ### Configuration ###
    #####################

    declare -a black_list=(
        "$HOME/.ssh"
        "$HOME/.gnupg"
        "$HOME/.bash_history"
        "$HOME/.sync"
        "$HOME/.firefox"
        "$HOME/.thunderbird"
        "$HOME/.mozilla"
        "$HOME/.steam"
        "$HOME/.steampath"
        "$HOME/.steampid"
    )

    declare -a write_list=(
        "$HOME/.pi"
        "$HOME/.cache"
        "$HOME/.cargo"
        "$HOME/.local/state"
        "$HOME/.npm"
    )

    declare -a args=(
        --ro-bind / /
        --dev-bind /dev /dev
        --proc /proc
        --bind /tmp/pi /tmp
        --tmpfs "${HOME}" 
    )


    #################
    ### Execution ###
    #################

    for i in "${HOME}"/.*; do
        if [[ ! " ${black_list[*]} " =~ " ${i} " ]]; then
            args+=(--ro-bind "${i}" "${i}")
        fi
    done

    for i in "${write_list[@]}"; do
        args+=(--bind "${i}" "${i}")
    done

    mkdir -p "/tmp/pi"

    bwrap "${args[@]}" \
        --bind "${PWD}" "${PWD}" \
        --chdir "${PWD}" \
        "${@}"
}

