#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build title title.c

ef_case "two words"       "hello world"
ef_case "messy spacing"   "  MULTIPLE   spaces  HERE "
ef_case "starts a digit"  "42 porto"
ef_case "already title"   "Hello World"
ef_case "all caps"        "SHOUTING LOUDLY"
ef_case "tabs"            $'a\tb\tc'
ef_case "empty string"    ""
ef_case "single word"     "solo"
ef_case "no argument"
ef_case "two arguments"   "a b" "c d"
ef_success
