#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build aff_a aff_a.c

ef_case "first a"            "abc"
ef_case "a later in string"  "zzzaza"
ef_case "no a"               "zzz"
ef_case "empty string"       ""
ef_case "only a"             "a"
ef_case "uppercase A only"   "ABC"
ef_case "no argument"
ef_case "two arguments"      "abc" "def"
ef_case "spaces and a"       "  a  "
ef_success
