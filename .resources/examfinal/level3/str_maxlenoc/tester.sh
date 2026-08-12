#!/bin/bash
source ../../../main/colors.sh
source ../../../main/test_utils.sh
source ../../../main/examfinal_utils.sh

trap ef_cleanup EXIT
ef_build str_maxlenoc str_maxlenoc.c

ef_case "subject example 1" "ab" "bac" "abacabccabcb"
ef_case "subject example 2" "bonjour" "salut" "bonjour" "bonjour"
ef_case "subject example 3" "xoxAoxo" "xoxAox" "oxAox" "oxo" "A" "ooxAoxx" "oxooxo" "Axo"
ef_case "subject example 4" "bosdsdfnjodur" "atehhellosd" "afkuonjosurafg" "headfgllosf" "fghellosag" "afdfbosnjourafg"
ef_case "no argument"
ef_case "single argument"   "hello"
ef_case "empty first"       "" "abc"
ef_case "empty other"       "abc" ""
ef_case "identical"         "abc" "abc" "abc"
ef_case "no overlap"        "abc" "xyz"
ef_case "tie takes first"   "abcd" "abxcd"
ef_case "whole string"      "aaa" "aaaa" "baaac"
ef_success
