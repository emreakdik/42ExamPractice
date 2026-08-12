#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build aff_first_param aff_first_param.c

ef_case "two arguments"   "hello" "world"
ef_case "one argument"    "solo"
ef_case "no argument"
ef_case "empty argument"  ""
ef_case "argument with spaces" "a b c"
ef_case "three arguments" "one" "two" "three"
ef_success
