#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build swap_cases swap_cases.c

ef_case "mixed"          "Hello World"
ef_case "digits kept"    "42 Porto!"
ef_case "all lower"      "abcxyz"
ef_case "all upper"      "ABCXYZ"
ef_case "empty string"   ""
ef_case "no letters"     "1234!@#"
ef_case "boundary chars" "\`az{@AZ["
ef_case "no argument"
ef_case "two arguments"  "ab" "cd"
ef_success
