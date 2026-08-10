#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build aff_last_param aff_last_param.c

ef_case "two arguments"   "hello" "world"
ef_case "one argument"    "solo"
ef_case "no argument"
ef_case "empty last"      "first" ""
ef_case "four arguments"  "a" "b" "c" "d"
ef_success
