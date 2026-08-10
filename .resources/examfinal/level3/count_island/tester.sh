#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build_glob count_island

ef_case "subject map toto"       "toto"
ef_case "subject map qui_est_la" "qui_est_la"
ef_case "empty file"             "rien"
ef_case "ragged lines"           "ragged"
ef_case "diagonals are separate" "tiny"
ef_case "missing file"           "no_such_file"
ef_case "no argument"
ef_case "two arguments"          "toto" "tiny"

if ! leak_check ./out2 toto; then
	print_fail_leak "count_island toto"
	exit 1
fi
ef_success
