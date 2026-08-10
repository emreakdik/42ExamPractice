#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build ft_putnbr ft_putnbr.c main.c

ef_case "full int range"
ef_success
