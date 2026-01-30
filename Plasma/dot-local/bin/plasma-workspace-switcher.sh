#!/usr/bin/env bash

set -euo pipefail

readonly CACHE_DIRECTORY="/tmp/tc-workspace-monitor"

action="Switch"
index=0

desktops_count="$( qdbus-qt6 org.kde.KWin /VirtualDesktopManager count )"
rows_count="$( qdbus-qt6 org.kde.KWin  /VirtualDesktopManager rows )"
desktops_per_row="$(( desktops_count / rows_count ))"

current_desktop="$(( $( qdbus-qt6 org.kde.KWin /KWin currentDesktop ) - 1 ))"
current_row="$(( current_desktop / desktops_per_row ))"
currnet_column="$(( current_desktop % desktops_per_row ))"

if [[ -z ${1+x} ]]; then
    printf "desktop-%i:\n\tDESKTOPS: %i\n\tROWS:     %i\n\tDPR:      %i\n\tCDESKTOP: %i\n\tCROW:     %i\n\tCCOL:     %i\n" "${current_desktop}" "${desktops_count}" "${rows_count}" "${desktops_per_row}" "$(( current_desktop + 1 ))" "$(( current_row + 1 ))" "$(( currnet_column + 1 ))"
    exit 0
fi

if ! [[ -z ${2+x} ]] && [[ "${2}" == "move" ]]; then
    action="Window"
fi

if [[ "${1}" == "up" ]]; then
    if [[ -d ${CACHE_DIRECTORY} ]] && [[ -f ${CACHE_DIRECTORY}/"$(( current_row - 1 ))" ]]; then
        index="$(( (current_row - 1) * desktops_per_row + ( $( <${CACHE_DIRECTORY}/"$(( current_row - 1 ))")) + 1))"
    else
        index="$(( (current_row - 1) * desktops_per_row + (currnet_column + 1) ))"
    fi
elif [[ "${1}" == "down" ]]; then
    if [[ -d ${CACHE_DIRECTORY} ]] && [[ -f ${CACHE_DIRECTORY}/"$(( current_row + 1 ))" ]]; then
        index="$(( (current_row + 1) * desktops_per_row + ( $( <${CACHE_DIRECTORY}/"$(( current_row + 1 ))")) + 1))"
    else
        index="$(( (current_row + 1) * desktops_per_row + (currnet_column + 1) ))"
    fi
elif [[ "${1}" -gt "0" ]] && [[ "${1}" -le "${desktops_per_row}" ]]; then
    index="$(( current_row * desktops_per_row + ${1} ))"
else
    exit 1
fi

qdbus-qt6 org.kde.kglobalaccel /component/kwin invokeShortcut "${action} to Desktop ${index}"

