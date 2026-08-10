#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build odd odd.c

ef_case "mixed"        "1" "2" "3" "4"
ef_case "negatives"    "-7" "-4" "0"
ef_case "no argument"
ef_case "all even"     "2" "4" "6"
ef_case "all odd"      "1" "3" "5"
ef_case "int max/min"  "2147483647" "-2147483648"
ef_case "plus sign"    "+8" "+9"
ef_success
