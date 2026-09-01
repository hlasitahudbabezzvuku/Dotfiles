#!/usr/bin/env bash

declare -r DOWNLOADER="yt-dlp"
if ! type "${DOWNLOADER}" &> /dev/null; then
    echo "Error: ${DOWNLOADER} is not installed." >&2
    exit 1
fi

declare -r LOCATION="/tmp/music"
mkdir -p "${LOCATION}"

declare -ar OPTS=(
    --abort-on-error
    --force-ipv4
    --cookies-from-browser firefox:~/.firefox
    --remote-components ejs:github
    --no-flat-playlist
    --yes-playlist
    --continue
    --part
    --progress
    --extract-audio
    --audio-format mp3
    --audio-quality 5
    --embed-metadata
    --output "${LOCATION}/%(playlist|artist)s/%(playlist_index&{}. |)s%(title)s.%(ext)s"
)
"${DOWNLOADER}" "${OPTS[@]}" "$@"

