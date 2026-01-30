#!/usr/bin/env bash

set -euo pipefail

readonly CACHE_DIRECTORY="/tmp/plasma-workspace-monitor"

desktops_count="$( qdbus-qt6 org.kde.KWin /VirtualDesktopManager count )"
rows_count="$( qdbus-qt6 org.kde.KWin  /VirtualDesktopManager rows )"
columns_count="$(( desktops_count / rows_count ))"

if ! [[ -d ${CACHE_DIRECTORY} ]]; then
    mkdir -p ${CACHE_DIRECTORY}

    for ((i = 0; i < rows_count; i++)); do
        printf "0" > ${CACHE_DIRECTORY}/${i}
    done
fi

while read -r line
do
    current_desktop="$(( $( qdbus-qt6 org.kde.KWin /KWin currentDesktop ) - 1 ))"
    current_row="$(( current_desktop / columns_count ))"
    currnet_column="$(( current_desktop % columns_count ))"

    printf "%i" ${currnet_column} > ${CACHE_DIRECTORY}/${current_row}

    printf "R%i: " "${current_row}"
    for ((i = 0; i < columns_count; i++)); do
        if [[ "${i}" == "${currnet_column}" ]]; then
            printf "━━━━ "
        else
            printf "──── "
        fi
    done
    printf "\n"
    
done < <( dbus-monitor --session "type='signal',interface='org.kde.KWin.VirtualDesktopManager',member='currentChanged'" --profile )
