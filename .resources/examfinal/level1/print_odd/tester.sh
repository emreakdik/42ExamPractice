#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build print_odd print_odd.c

ef_case "even bound"      "6"
ef_case "odd bound"       "7"
ef_case "one"             "1"
ef_case "zero"            "0"
ef_case "negative"        "-3"
ef_case "no argument"
ef_case "two arguments"   "5" "9"
ef_case "two digit bound" "21"
ef_success
