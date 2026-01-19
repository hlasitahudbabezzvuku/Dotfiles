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
