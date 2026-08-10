#!/bin/bash
# Self-check for the Exam Final rank. Run it from anywhere:
#
#     bash tests/examfinal_selfcheck.sh
#
# It answers four questions, in order of how badly a "yes" is needed:
#
#   1. does every reference solution compile with -Wall -Wextra -Werror?
#   2. does every tester report SUCCESS when the reference is handed in?
#   3. does every tester report FAIL when the answer is deliberately broken?
#   4. does every reference pass norminette? (skipped if not installed)
#
# Question 3 is the one that matters: a tester that cannot fail is a tester
# that tells you nothing.

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EF="$REPO/.resources/examfinal"
fails=0

command -v gcc >/dev/null 2>&1 || { echo "gcc is required"; exit 2; }

# The mutant: every "return (0);" prints one extra byte and returns a different
# status. A tester comparing stdout or exit status must notice.
SABOTAGE=$(mktemp)
trap 'rm -f "$SABOTAGE"; rm -rf "$REPO/rendu"' EXIT
printf '%s\n' 's/return (0);/{ write(1, "X", 1); return (3); }/' > "$SABOTAGE"

echo "=== 1. reference compiles clean ==="
for d in "$EF"/level*/*/; do
	ex=$(basename "$d")
	if ! (cd "$d" && gcc -Wall -Wextra -Werror -o /tmp/ef_ref_$ex ./*.c 2>/tmp/ef_err_$ex); then
		echo "  FAIL $ex"
		sed 's/^/      /' /tmp/ef_err_$ex | head -4
		fails=$((fails+1))
	fi
done
echo "  done"

echo
echo "=== 2. SUCCESS on the reference answer ==="
for d in "$EF"/level*/*/; do
	ex=$(basename "$d")
	rm -rf "$REPO/rendu/$ex"
	mkdir -p "$REPO/rendu/$ex"
	for f in "$d"*.c "$d"*.h; do
		[ -e "$f" ] || continue
		[ "$(basename "$f")" = "main.c" ] && continue
		cp "$f" "$REPO/rendu/$ex/"
	done
	rm -f "$d"out1 "$d"out2
	out=$(cd "$d" && timeout 60 bash tester.sh 2>&1)
	if echo "$out" | grep -q SUCCESS; then
		printf '  %-18s ok\n' "$ex"
	else
		printf '  %-18s BROKEN -> %s\n' "$ex" "$(echo "$out" | head -4 | tr '\n' ' ')"
		fails=$((fails+1))
	fi
done

echo
echo "=== 3. sabotage is caught ==="
for d in "$EF"/level*/*/; do
	ex=$(basename "$d")
	src="$d$ex.c"
	[ -f "$src" ] || src=$(ls "$d"*.c | head -1)
	sed -f "$SABOTAGE" "$src" > "$REPO/rendu/$ex/$(basename "$src")"
	if diff -q "$src" "$REPO/rendu/$ex/$(basename "$src")" >/dev/null; then
		printf '  %-18s no "return (0);" to mutate, see step 3b\n' "$ex"
		continue
	fi
	rm -f "$d"out1 "$d"out2
	out=$(cd "$d" && timeout 60 bash tester.sh 2>&1)
	if echo "$out" | grep -qE 'FAIL|does not compile|Cannot execute'; then
		printf '  %-18s caught\n' "$ex"
	else
		printf '  %-18s MISSED - this tester cannot fail\n' "$ex"
		fails=$((fails+1))
	fi
done

echo
echo "=== 3b. sabotage is caught (function-only exercises) ==="
# ft_ft, write_string and ft_putnbr are functions, not programs: the file the
# student hands in has no "return (0);" for the generic mutant to hit, so each
# one gets a mutant aimed at what it actually does.
mutate() { # <dir> <file> <sed expr> <label>
	local d="$1" f="$2" expr="$3" label="$4" ex out
	ex=$(basename "$d")
	rm -rf "$REPO/rendu/$ex"
	mkdir -p "$REPO/rendu/$ex"
	sed "$expr" "$d/$f" > "$REPO/rendu/$ex/$f"
	if diff -q "$d/$f" "$REPO/rendu/$ex/$f" >/dev/null; then
		printf '  %-14s %-22s MUTANT DID NOT APPLY\n' "$ex" "$label"
		fails=$((fails+1))
		return
	fi
	rm -f "$d"/out1 "$d"/out2
	out=$(cd "$d" && timeout 60 bash tester.sh 2>&1)
	if echo "$out" | grep -qE 'FAIL|does not compile|Cannot execute'; then
		printf '  %-14s %-22s caught\n' "$ex" "$label"
	else
		printf '  %-14s %-22s MISSED\n' "$ex" "$label"
		fails=$((fails+1))
	fi
}

mutate "$EF/level1/ft_ft" ft_ft.c 's/42/41/' "sets 41 not 42"
mutate "$EF/level1/write_string" write_string.c \
	's/write(1, str, i)/write(1, str, i - 1)/' "drops last char"
mutate "$EF/level1/write_string" write_string.c 's/if (!str)/if (0)/' "no NULL guard"
mutate "$EF/level2/ft_putnbr" ft_putnbr.c 's/nb % 10/nb % 9/' "wrong base digit"
mutate "$EF/level2/ft_putnbr" ft_putnbr.c 's/if (nb >= 10)/if (nb >= 100)/' "drops a digit"
mutate "$EF/level2/ft_putnbr" ft_putnbr.c 's/write(1, "-", 1);/;/' "loses minus sign"

if command -v norminette >/dev/null 2>&1; then
	echo
	echo "=== 4. norminette ==="
	for d in "$EF"/level*/*/; do
		ex=$(basename "$d")
		out=$(norminette $(ls "$d"*.c "$d"*.h 2>/dev/null) 2>&1 \
			| grep "^Error" | grep -v INVALID_HEADER)
		[ -z "$out" ] || {
			printf '  %-18s %s\n' "$ex" "$(echo "$out" | head -2 | tr '\n' ' ')"
			fails=$((fails+1))
		}
	done
	echo "  done"
fi

echo
echo "failures: $fails"
[ "$fails" -eq 0 ]
