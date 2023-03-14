#!/bin/bash

options=("Option 1" "Option 2" "Option 3")
frames=("◐" "◓" "◑" "◒")

duration=0.1
loop_count=3

clear_screen() {
    printf "\033c"
}

display_animation() {
    for i in $(seq 1 $loop_count); do
        for frame in "${frames[@]}"; do
            clear_screen
            printf "$(tput setaf 2)$(tput bold)Please wait... %s\n\n" "$frame"
            sleep $duration
            $(tput sgr0)
        done
        $(tput sgr0)
    done
    $(tput sgr0)
}
