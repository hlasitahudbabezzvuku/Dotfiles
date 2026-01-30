vi ()
{
    local dir="$( vifm --choose-dir - "$@" )"

    if [ -z "$dir" ]; then
        printf "Directory picking cancelled/failed\n"
        return 1
    fi

    cd "$dir" || return 1
}

tt ()
{
    local name="$( date -I ).${*}"
    touch "${name/ /_}"
}

td ()
{
    local name="$( date -I )_${*}"
    mkdir "${name/ /_}"
}
