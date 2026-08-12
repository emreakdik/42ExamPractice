#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build print_interval print_interval.c

ef_case "ascending"       "3" "6"
ef_case "descending"      "1" "-1"
ef_case "same number"     "0" "0"
ef_case "no argument"
ef_case "one argument"    "4"
ef_case "three arguments" "1" "2" "3"
ef_success
