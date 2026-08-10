#!/bin/bash
# Shared helpers for the Exam Final testers.
# Source AFTER colors.sh and test_utils.sh: it builds on strict_compile,
# compile_ref and print_fail_compile from test_utils.sh.

# ef_build <exercise> <file...>
# Compiles the reference (out1) from the files sitting next to the tester and
# the student version (out2) from rendu/<exercise>/. A file that exists only
# next to the tester (a main.c harness) is used for both builds, so function
# exercises get the same driver on each side. Missing student files abort.
ef_build() {
	local ex="$1"
	shift
	local rendu="../../../../rendu/$ex"
	local ref=() stu=() f
	for f in "$@"; do
		ref+=("$f")
		if [ -f "$rendu/$f" ]; then
			stu+=("$rendu/$f")
		elif [ -f "$f" ]; then
			stu+=("$f")
		else
			echo "${RED}${BOLD}Your file rendu/$ex/$f was not found.${RESET}"
			exit 1
		fi
	done
	if ! strict_compile out2 "${stu[@]}"; then
		print_fail_compile
		exit 1
	fi
	compile_ref out1 "${ref[@]}" || {
		echo "${RED}Reference did not compile.${RESET}"
		exit 1
	}
	ef_assert_runnable
}

# ef_assert_runnable
# The reference binary must actually run. On a machine that refuses to execute
# freshly built binaries every comparison below would compare two empty files
# and the tester would report a false SUCCESS, so refuse to judge instead.
ef_assert_runnable() {
	local status
	./out1 </dev/null >/dev/null 2>&1
	status=$?
	if [ "$status" -eq 126 ] || [ "$status" -eq 127 ]; then
		echo "${RED}${BOLD}Cannot execute a compiled binary here (exit $status).${RESET}"
		echo "The tester cannot judge your code on this machine."
		exit 1
	fi
}

# ef_case <label> [args...]
# Runs both binaries on the same argv and compares stdout and exit status.
ef_case() {
	local label="$1"
	shift
	local s1 s2
	./out1 "$@" > out1.txt 2>/dev/null
	s1=$?
	./out2 "$@" > out2.txt 2>/dev/null
	s2=$?
	if ! diff -q out1.txt out2.txt >/dev/null; then
		echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($label)"
		echo "${GREEN}Expected:${RESET} $(cat -e out1.txt)"
		echo "${RED}Yours:   ${RESET} $(cat -e out2.txt)"
		exit 1
	fi
	if [ "$s1" -ne "$s2" ]; then
		echo "$(tput setaf 1)$(tput bold)FAIL$(tput sgr 0) ($label): reference exit $s1, yours $s2"
		exit 1
	fi
}

ef_cleanup() { rm -f out1 out2 out1.txt out2.txt; }

ef_success() {
	echo "$(tput setaf 2)$(tput bold)SUCCESS$(tput sgr 0)"
	exit 0
}

# ef_build_glob <exercise>
# For exercises whose subject expects "*.c, *.h": compiles every .c next to the
# tester as the reference, and every .c the student left in rendu/<exercise>/
# as the answer. Lets the student split the files however they like.
ef_build_glob() {
	local ex="$1"
	local rendu="../../../../rendu/$ex"
	if ! ls "$rendu"/*.c >/dev/null 2>&1; then
		echo "${RED}${BOLD}No .c file found in rendu/$ex/.${RESET}"
		exit 1
	fi
	if ! strict_compile out2 "$rendu"/*.c; then
		print_fail_compile
		exit 1
	fi
	compile_ref out1 ./*.c || {
		echo "${RED}Reference did not compile.${RESET}"
		exit 1
	}
	ef_assert_runnable
}
