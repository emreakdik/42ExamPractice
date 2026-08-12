#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build count_words count_words.c

ef_case "two words"      "hello world"
ef_case "messy spacing"  "   lots   of   spaces   "
ef_case "empty string"   ""
ef_case "only spaces"    "     "
ef_case "single word"    "solo"
ef_case "tabs"           $'a\tb\tc'
ef_case "many words"     "a b c d e f g h i j k"
ef_case "no argument"
ef_case "two arguments"  "a b" "c d"
ef_success
