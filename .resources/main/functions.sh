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

arrow_menu() {
    local menu_title="$1"
    shift
    local options=("$@")
    local selected=0
    local previous_selected
    local key
    local numeric_index
    local label_output
    local label_lines
    local options_start_row
    local separator_row
    local status_row
    local input_row
    local content_width=46
    local option_text
    local prompt_text
    local typed_number=""
    local primary_hint

    ARROW_MENU_SELECTED=""
    primary_hint="${ARROW_MENU_PRIMARY_HINT:-Use ↑/↓ to move. Enter to select.}"

    if [ "${#options[@]}" -eq 0 ]; then
        return 1
    fi

    draw_option_line() {
        local idx="$1"
        local is_selected="$2"
        local row

        row=$((options_start_row + idx))
        option_text="$((idx + 1)). ${options[$idx]}"

        if [ "${#option_text}" -gt "$content_width" ]; then
            option_text="${option_text:0:$((content_width - 3))}..."
        fi

        tput cup "$row" 0
        if [ "$is_selected" -eq 1 ]; then
            printf "${BG_GREEN}${BLACK} > %-*s ${RESET}\033[K" "$content_width" "$option_text"
        else
            printf "${YELLOW}${BOLD}   %-*s${RESET}\033[K" "$content_width" "$option_text"
        fi
    }

    draw_status_lines() {
        tput cup "$status_row" 0
        printf "${GREEN}${BOLD}%s${RESET}\033[K" "$primary_hint"

        tput cup "$input_row" 0
        if [ -n "$typed_number" ]; then
            printf "${CYAN}${BOLD}Number input: %s (press Enter)${RESET}\033[K" "$typed_number"
        else
            printf "${GREEN}${BOLD}Or type a menu number, then press Enter.${RESET}\033[K"
        fi
    }

    label_output="$(bash label.sh)"
    label_lines="$(printf "%s\n" "$label_output" | wc -l | tr -d '[:space:]')"
    options_start_row=$((label_lines + 3))
    separator_row=$((options_start_row + ${#options[@]}))
    status_row=$((separator_row + 1))
    input_row=$((status_row + 1))

    clear
    tput civis 2>/dev/null || true

    printf "%s\n" "$label_output"
    printf "%-50s\033[K\n" "=================================================="
    printf "${BG_CYAN}${BLACK}%-50s${RESET}\033[K\n" "$menu_title"
    printf "%-50s\033[K\n" "=================================================="

    for i in "${!options[@]}"; do
        if [ "$i" -eq "$selected" ]; then
            draw_option_line "$i" 1
        else
            draw_option_line "$i" 0
        fi
    done

    tput cup "$separator_row" 0
    printf "%-50s\033[K\n" "=================================================="
    draw_status_lines
    tput cup "$input_row" 0

    while true; do
        IFS= read -rsn1 key || {
            tput cnorm 2>/dev/null || true
            return 1
        }

        if [[ "$key" == $'\x1b' ]]; then
            IFS= read -rsn2 key || continue
            previous_selected="$selected"
            case "$key" in
                "[A")
                    selected=$(( (selected - 1 + ${#options[@]}) % ${#options[@]} ))
                    ;;
                "[B")
                    selected=$(( (selected + 1) % ${#options[@]} ))
                    ;;
                *)
                    continue
                    ;;
            esac

            typed_number=""
            if [ "$selected" -ne "$previous_selected" ]; then
                draw_option_line "$previous_selected" 0
                draw_option_line "$selected" 1
            fi
            draw_status_lines
            tput cup "$input_row" 0
        elif [[ -z "$key" ]]; then
            if [ -n "$typed_number" ]; then
                numeric_index=$((10#$typed_number - 1))
                if [ "$numeric_index" -ge 0 ] && [ "$numeric_index" -lt "${#options[@]}" ]; then
                    ARROW_MENU_SELECTED="$numeric_index"
                    tput cnorm 2>/dev/null || true
                    printf "\n"
                    return 0
                fi

                prompt_text="$typed_number"
                typed_number=""
                draw_status_lines
                tput cup "$input_row" 0
                printf "${RED}${BOLD}Invalid number: %s${RESET}\033[K" "$prompt_text"
                continue
            fi

            ARROW_MENU_SELECTED="$selected"
            tput cnorm 2>/dev/null || true
            printf "\n"
            return 0
        elif [[ "$key" =~ [0-9] ]]; then
            typed_number="${typed_number}${key}"
            draw_status_lines
            tput cup "$input_row" 0
        elif [[ "$key" == $'\x7f' || "$key" == $'\b' ]]; then
            if [ -n "$typed_number" ]; then
                typed_number="${typed_number%?}"
                draw_status_lines
                tput cup "$input_row" 0
            fi
        fi
    done
}
