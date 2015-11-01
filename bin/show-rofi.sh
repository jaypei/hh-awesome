#!/bin/bash

RUN_FOLDER="$1"

if [[ -d $RUN_FOLDER ]]; then
    cd $RUN_FOLDER
    SELECTED=$(find . -maxdepth 2 -executable -type "l" -or -type "f" | \
                      tr -d "^\./" | \
                      rofi -dmenu -p ">> ")
    $RUN_FOLDER/$SELECTED >> /tmp/a.log
else
    rofi -show run
fi
