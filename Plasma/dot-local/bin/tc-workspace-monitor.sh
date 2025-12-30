#!/usr/bin/env bash

set -euo pipefail

readonly CACHE_DIRECTORY="/tmp/tc-workspace-monitor"

desktops_count="$( qdbus-qt6 org.kde.KWin /VirtualDesktopManager count )"
rows_count="$( qdbus-qt6 org.kde.KWin  /VirtualDesktopManager rows )"
desktops_per_row="$(( desktops_count / rows_count ))"

if ! [[ -d ${CACHE_DIRECTORY} ]]; then
    mkdir ${CACHE_DIRECTORY}

    for ((i = 0; i < rows_count; i++)); do
        printf "0" > ${CACHE_DIRECTORY}/${i}
    done
fi

while read -r line
do
    printf "%s\n" "${line}"

    current_desktop="$(( $( qdbus-qt6 org.kde.KWin /KWin currentDesktop ) - 1 ))"
    current_row="$(( current_desktop / desktops_per_row ))"
    currnet_column="$(( current_desktop % desktops_per_row ))"

    printf "%i" ${currnet_column} > ${CACHE_DIRECTORY}/${current_row}
done < <( dbus-monitor --session "type='signal',interface='org.kde.KWin.VirtualDesktopManager',member='currentChanged'" --profile )
