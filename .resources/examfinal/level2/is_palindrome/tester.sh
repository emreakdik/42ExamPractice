#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build is_palindrome is_palindrome.c

ef_case "palindrome"      "radar"
ef_case "case matters"    "Radar"
ef_case "not palindrome"  "hello"
ef_case "empty string"    ""
ef_case "single char"     "x"
ef_case "two same"        "aa"
ef_case "two different"   "ab"
ef_case "even palindrome" "abba"
ef_case "with spaces"     "a b a"
ef_case "no argument"
ef_case "two arguments"   "aba" "aba"
ef_success
