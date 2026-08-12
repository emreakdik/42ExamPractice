# 42 Exam Practice

> Fork of **[emreakdik/42ExamPractice](https://github.com/emreakdik/42ExamPractice)** — all credit for the original shell, the arrow-key menu, Exam Rank 02 and Exam Rank 03 goes to the original author. This fork keeps everything from upstream and adds a third rank, **Exam Final**, on top.

> "Not a giant platform. Not a bloated setup. Just a fast little shell for grinding 42 exams the way we actually do it."

42 Exam Practice is a terminal-based practice shell built to make exam prep feel less messy and more repeatable. Instead of jumping between folders, random subjects and manual test setups, you stay inside one flow: pick a rank, pick a level, solve, test, move on.

The shell covers three ranks:

- **Exam Rank 02** — Level 0-3, classic piscine-style exercises (strings, bits, math, linked lists)
- **Exam Rank 03** — Level 1 (`get_next_line`, `ft_scanf`, `filter`), Level 2 (`n_queens`, `permutations`, `powerset`, `rip`, `tsp`)
- **Exam Final** *(added in this fork)* — Level 1-3, 24 exercises from the easiest warm-ups up to flood-fill and substring search

Turkish instructions: [tr.md](tr.md)

## Quick Start

```bash
git clone <this-repository-url>
cd 42ExamPractice
bash exampractice.sh
```

## Commands

At the `/>` prompt, after a subject appears:

- `test` — test your code against the current question
- `next` — move to the next subject
- `previous` — go back to the previous subject
- `menu` — return to the main menu (clears `rendu`)
- `exit` — close the shell

## The `rendu` Folder

The shell looks for your code inside a `rendu` folder, mirroring the structure you would prepare during the real exam:

```text
42ExamPractice/
└── rendu/
    └── first_word/
        └── first_word.c
```

Exercises that expect several files (a header next to the `.c`, or a split across several `.c`) follow the same pattern — drop every expected file in that same `rendu/<exercise>/` folder and the tester compiles them together.

## Platform Notes

- Best experience: macOS and Linux
- Windows users should prefer WSL or Git Bash
- The testers need `gcc`; `valgrind` is optional and its leak checks are skipped when it is not installed

---

## What This Fork Adds: Exam Final

A third rank, picked straight from the main menu (**Exam Final**): 24 exercises across three levels, each with its own subject, a reference solution and a tester built the same way the Rank 03 testers are — a strict `-Wall -Wextra -Werror` compile gate, `valgrind` leak checks where they matter, and behavioural diffing against the reference solution rather than hardcoded expected strings.

### Level 1 — Warm-ups
`aff_a`, `aff_first_param`, `aff_last_param`, `even`, `odd`, `write_string`, `ft_ft`, `interval_spaces`, `print_odd`, `print_even`, `print_interval`, `occ_a`, `occ_z`, `count_alen`

### Level 2 — Core
`buzzfizz`, `ft_putnbr`, `is_palindrome`, `swap_cases`, `title`, `count_words`

### Level 3 — Advanced
`count_alpha`, `str_maxlenoc`, `ord_alphlong`, `count_island`

### Where the subjects come from

Be aware of the difference, because it decides how much you should trust a subject:

- **Level 3** subjects are the **canonical exam texts**, copied verbatim (including the `toto` and `qui_est_la` maps shipped with `count_island`). Solving these is solving the real thing.
- **Level 1 and Level 2** subjects were **written for this fork**. They follow the exam format and the exam's spirit, but they are not transcriptions of official subjects. Treat them as practice drills, not as exam predictions.

### Norm compliance

Every reference solution passes the real 42 `norminette` (the 42 file header aside, which exam answers do not carry): no more than 5 functions per `.c`, no more than 4 parameters or 5 declared variables per function, no more than 25 lines per function, no `for` loops, no assignment inside a condition, no global variables, no struct or typedef declared inside a `.c`.

Two exercises are split across several files to stay inside those limits, and their subjects allow it (`Expected files: *.c, *.h`):

- **`ord_alphlong`** ships `ord_alphlong.h` (the word struct plus prototypes) alongside `ord_alphlong.c`, `ord_alphlong_split.c` and `ord_alphlong_sort.c`
- **`count_island`** ships `count_island.h` (the grid struct) alongside `count_island.c`, and does a recursive flood fill over a file-based grid to number each island

Their testers compile **every** `.c` you leave in `rendu/<exercise>/`, so you are free to split your own answer however you like.

## Credits

- Original project and Rank 02 / Rank 03: **[emreakdik/42ExamPractice](https://github.com/emreakdik/42ExamPractice)**
- Exam Final (24 exercises, Level 1-3) added in this fork

## Contributing

Issues and PRs welcome — either here, or upstream to the original repo.
