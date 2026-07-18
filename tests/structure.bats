#!/usr/bin/env bats
#
# Structural integrity of the exercise tree. Every exercise directory that
# ships a tester must be self-consistent, and every shell script in the repo
# must be syntactically valid. These guards catch the "listed but missing" /
# "broken tester committed" class of bug without running any student code.

setup() {
    REPO_ROOT="$(cd "$BATS_TEST_DIRNAME/.." && pwd)"
}

@test "every tester.sh has a sibling sub.txt" {
    missing=""
    while IFS= read -r tester; do
        dir="$(dirname "$tester")"
        [ -f "$dir/sub.txt" ] || missing="$missing $dir"
    done < <(find "$REPO_ROOT/.resources" -name tester.sh)
    [ -z "$missing" ] || { echo "sub.txt missing in:$missing"; false; }
}

@test "every tester.sh is syntactically valid bash" {
    bad=""
    while IFS= read -r tester; do
        bash -n "$tester" 2>/dev/null || bad="$bad $tester"
    done < <(find "$REPO_ROOT/.resources" -name tester.sh)
    [ -z "$bad" ] || { echo "syntax errors in:$bad"; false; }
}

@test "every main shell script is syntactically valid bash" {
    bad=""
    for f in "$REPO_ROOT"/.resources/main/*.sh \
             "$REPO_ROOT"/exampractice.sh "$REPO_ROOT"/update.sh; do
        [ -f "$f" ] || continue
        bash -n "$f" 2>/dev/null || bad="$bad $f"
    done
    [ -z "$bad" ] || { echo "syntax errors in:$bad"; false; }
}

@test "no sub.txt is empty" {
    empty=""
    while IFS= read -r sub; do
        [ -s "$sub" ] || empty="$empty $sub"
    done < <(find "$REPO_ROOT/.resources" -name sub.txt)
    [ -z "$empty" ] || { echo "empty subjects:$empty"; false; }
}
