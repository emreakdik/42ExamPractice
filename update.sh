#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$SCRIPT_DIR"
MAIN_DIR="$REPO_ROOT/.resources/main"
TMP_DIR="$(mktemp -d)"
CLONE_DIR="$TMP_DIR/42ExamPractice"

cleanup() {
    rm -rf "$TMP_DIR"
}
trap cleanup EXIT

if ! command -v git >/dev/null 2>&1; then
    echo "Error: git is required to run update."
    exit 1
fi

source "$MAIN_DIR/colors.sh"
clear

echo "${GREEN}${BOLD}CLEANING...${RESET}"
echo ""
sleep 1
rm -rf "$REPO_ROOT/rendu"
rm -rf "$REPO_ROOT/.resources"
rm -f "$REPO_ROOT/exampractice.sh"
rm -f "$REPO_ROOT/update.sh"
rm -f "$REPO_ROOT/README.md"
rm -f "$REPO_ROOT/tr.md"
echo ""

echo "${GREEN}${BOLD}UPDATING...${RESET}"
echo ""
echo "${GREEN}${BOLD}Please wait...${RESET}"
sleep 1
git clone --depth 1 https://github.com/emreakdik/42ExamPractice "$CLONE_DIR"

cp -R "$CLONE_DIR/.resources" "$REPO_ROOT/"
cp "$CLONE_DIR/exampractice.sh" "$REPO_ROOT/"
cp "$CLONE_DIR/update.sh" "$REPO_ROOT/"
cp "$CLONE_DIR/README.md" "$REPO_ROOT/"
cp "$CLONE_DIR/tr.md" "$REPO_ROOT/"

if [ -f "$CLONE_DIR/.gitignore" ]; then
    cp "$CLONE_DIR/.gitignore" "$REPO_ROOT/"
fi

echo "${GREEN}${BOLD}DONE!${RESET}"
sleep 0.5
cd "$REPO_ROOT" || exit 1
bash "$REPO_ROOT/exampractice.sh"
exit
