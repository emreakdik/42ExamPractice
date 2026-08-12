#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build print_even print_even.c

ef_case "odd bound"       "7"
ef_case "even bound"      "8"
ef_case "zero"            "0"
ef_case "negative"        "-4"
ef_case "one"             "1"
ef_case "no argument"
ef_case "two arguments"   "4" "6"
ef_case "two digit bound" "20"
ef_success
