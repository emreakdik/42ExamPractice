#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build interval_spaces interval_spaces.c

ef_case "ascending"      "3" "7"
ef_case "descending"     "2" "-2"
ef_case "same number"    "5" "5"
ef_case "crossing zero"  "-3" "3"
ef_case "one argument"   "1"
ef_case "no argument"
ef_case "three arguments" "1" "2" "3"
ef_case "negatives only" "-9" "-5"
ef_success
