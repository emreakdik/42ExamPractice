#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build occ_z occ_z.c

ef_case "pizza"           "pizza"
ef_case "uppercase only"  "PIZZA"
ef_case "empty string"    ""
ef_case "no z"            "aaa"
ef_case "many z"          "zzzzzzzzzzzz"
ef_case "no argument"
ef_case "two arguments"   "zz" "zz"
ef_case "mixed case"      "zZzZ"
ef_success
