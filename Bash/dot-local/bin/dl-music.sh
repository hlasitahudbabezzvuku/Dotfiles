#!/usr/bin/env bash

declare -r DOWNLOADER="yt-dlp"
declare -r LOCATION="/tmp/music"

mkdir -p "${LOCATION}"

for url in "${@}"; do
    while ! ${DOWNLOADER} \
        --abort-on-error \
        --force-ipv4 \
        --no-flat-playlist \
        --yes-playlist \
        --continue \
        --part \
        --progress \
        --extract-audio \
        --audio-format mp3 \
        --audio-quality 5 \
        --embed-thumbnail \
        --embed-metadata \
        --convert-thumbnails jpg \
        --ppa 'EmbedThumbnail+ffmpeg_o:-c:v mjpeg -vf crop="'"'"'if(gt(ih,iw),iw,ih)'"':'"'if(gt(iw,ih),ih,iw)'"'"'"' \
        --output "${LOCATION}/%(playlist|artist)s/%(playlist_index&{}. |)s%(title)s.%(ext)s" \
        "${url}"
    do
        sleep $(( 60 * 5 ))
    done

    sleep 30
done

