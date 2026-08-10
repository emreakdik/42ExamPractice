#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build write_string write_string.c main.c

ef_case "simple"        "42"
ef_case "empty string"  ""
ef_case "with spaces"   "hello world"
ef_case "newline inside" $'a\nb'
ef_case "null pointer"
ef_case "long string"   "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
ef_success
