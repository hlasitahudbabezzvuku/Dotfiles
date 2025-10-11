#!/usr/bin/env bash

declare -r DOWNLOADER="yt-dlp"

declare -r ARGS_GENERAL='--force-ipv4 --no-flat-playlist --yes-playlist --continue --part --progress'
declare -r ARGS_FORMAT='~/Media/Music/%(playlist|artist)s/%(playlist_index&{}. |)s%(title)s.%(ext)s'
declare -r ARGS_AUDIO='--extract-audio --audio-format mp3 --audio-quality 5 --embed-thumbnail --embed-metadata'

for url in "${@}"; do
    ${DOWNLOADER} ${ARGS_GENERAL} --output "${ARGS_FORMAT}" ${ARGS_AUDIO} "${url}"
done

