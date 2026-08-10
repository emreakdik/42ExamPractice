#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build occ_a occ_a.c

ef_case "banana"          "banana"
ef_case "uppercase only"  "BANANA"
ef_case "empty string"    ""
ef_case "no a"            "zzz"
ef_case "all a"           "aaaaaaaaaa"
ef_case "no argument"
ef_case "two arguments"   "aa" "aa"
ef_case "mixed case"      "aAaAaA"
ef_success
