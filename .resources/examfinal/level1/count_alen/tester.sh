#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build count_alen count_alen.c

ef_case "mixed"           "42 Porto!"
ef_case "digits only"     "1234"
ef_case "empty string"    ""
ef_case "letters only"    "abcXYZ"
ef_case "symbols"         "@#\$%^&*()"
ef_case "no argument"
ef_case "two arguments"   "abc" "def"
ef_case "boundary chars"  "\`az{@AZ["
ef_success
