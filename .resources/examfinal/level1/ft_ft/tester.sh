#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build ft_ft ft_ft.c main.c

ef_case "sets 42"
ef_success
