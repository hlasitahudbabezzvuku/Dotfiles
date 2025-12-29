#!/usr/bin/env bash

desktops_count="$( qdbus-qt6 org.kde.KWin /VirtualDesktopManager count )"
rows_count="$( qdbus-qt6 org.kde.KWin  /VirtualDesktopManager rows )"
desktops_per_row="$(( desktops_count / rows_count ))"

current_desktop="$(( $( qdbus-qt6 org.kde.KWin /KWin currentDesktop ) - 1 ))"
current_row="$(( current_desktop / desktops_per_row ))"
currnet_column="$(( current_desktop % desktops_per_row ))"

if [[ "${1}" -le 0 ]] || [[ "${1}" -gt "${desktops_per_row}" ]]; then
    printf "[\e[31merror\e[0m]: The suplied index is out of range\n"
    printf "desktop-%i:\n\tDESKTOPS: %i\n\tROWS:     %i\n\tDPR:      %i\n\tCDESKTOP: %i\n\tCROW:     %i\n\tCCOL:     %i\n" "$current_desktop" "$desktops_count" "$rows_count" "$desktops_per_row" "$(( current_desktop + 1 ))" "$(( current_row + 1 ))" "$(( currnet_column + 1 ))"
    exit 1
fi

qdbus-qt6 org.kde.KWin /KWin setCurrentDesktop "$(( current_row * desktops_per_row + ${1} ))"

