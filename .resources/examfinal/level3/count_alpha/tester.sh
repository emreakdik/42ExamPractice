#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build count_alpha count_alpha.c

ef_case "subject example 1" "abbcc"
ef_case "subject example 2" "My Hyze 47y 7."
ef_case "empty string"      ""
ef_case "two arguments"     "abbcc" "dddeef"
ef_case "no argument"
ef_case "digits only"       "1234567890"
ef_case "case folding"      "aAaBbB"
ef_case "whole alphabet"    "abcdefghijklmnopqrstuvwxyz"
ef_case "repeats far apart" "a...b...a...b...a"
ef_case "punctuation"       "!@#a#@!b"
ef_success
