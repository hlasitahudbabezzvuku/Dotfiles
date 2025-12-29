#!/usr/bin/env bash

desktops_count="$( qdbus-qt6 org.kde.KWin /VirtualDesktopManager count )"
rows_count="$( qdbus-qt6 org.kde.KWin  /VirtualDesktopManager rows )"
desktops_per_row="$(( desktops_count / rows_count ))"

current_desktop="$(( $( qdbus-qt6 org.kde.KWin /KWin currentDesktop ) - 1 ))"
current_row="$(( current_desktop / rows_count ))"

if [[ "${1}" -le 0 ]] || [[ "${1}" -gt "${desktops_per_row}" ]]; then
    printf "[error]: The suplied index is out of range\n"
    exit 1
fi

qdbus-qt6 org.kde.KWin /KWin setCurrentDesktop "$(( current_row * desktops_per_row + ${1} ))"

