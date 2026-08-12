#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build_glob ord_alphlong

ef_case "subject example 1" "De son baton il frappa la pierre et l eau jaillit"
ef_case "subject example 2" "A a b B cc ca cd"
ef_case "subject example 3" "Pour l Imperium de l humanite"
ef_case "no argument"
ef_case "two arguments"     "a b" "c d"
ef_case "empty string"      ""
ef_case "only spaces"       "     "
ef_case "single word"       "solo"
ef_case "tabs as separator" $'aa\tb\tccc'
ef_case "digits in words"   "a1 b2 c3 zz11"
ef_case "duplicates kept"   "aa aa aa bb"
ef_case "messy spacing"     "   lots   of   spaces   "

if ! leak_check ./out2 "De son baton il frappa la pierre et l eau jaillit"; then
	print_fail_leak "ord_alphlong"
	exit 1
fi
ef_success
