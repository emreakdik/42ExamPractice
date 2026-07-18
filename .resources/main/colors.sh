#!/bin/bash
# shellcheck disable=SC2034
#
# Terminal color codes. tput needs a color-capable TERM; in a bare CI shell
# or a non-color terminal (e.g. TERM=dumb) it errors out and would abort any
# script that sources this file under `set -e`. tc() wraps tput so that a
# missing capability degrades to an empty string instead of failing.
tc() { tput "$@" 2>/dev/null || true; }

BLACK=$(tc setaf 0)
RED=$(tc setaf 1)
GREEN=$(tc setaf 2)
YELLOW=$(tc setaf 3)
BLUE=$(tc setaf 4)
MAGENTA=$(tc setaf 5)
CYAN=$(tc setaf 6)
WHITE=$(tc setaf 7)
BG_BLACK=$(tc setab 0)
BG_RED=$(tc setab 1)
BG_GREEN=$(tc setab 2)
BG_YELLOW=$(tc setab 3)
BG_BLUE=$(tc setab 4)
BG_MAGENTA=$(tc setab 5)
BG_CYAN=$(tc setab 6)
BG_WHITE=$(tc setab 7)
BOLD=$(tc bold)
RESET=$(tc sgr0)
