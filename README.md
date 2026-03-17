# 42 Exam Practice

> **New (March 18, 2026):** The menu system was upgraded with arrow-key navigation, numbered options, Enter-to-confirm numeric input, and a redesigned Command Reference.

> Not a giant platform. Not a bloated setup. Just a fast little shell for grinding 42 exams the way we actually do it.

> If this repo helps your grind, leave a star.

42 Exam Practice is a terminal-based practice shell built to make exam prep feel less messy and more repeatable. Instead of jumping between folders, random subjects, and manual test setups, you stay inside one flow: pick a rank, pick a level, solve, test, move on.

The shell is still growing. Right now the active focus is **Exam Rank 02**. **Exam Rank 03** is already planned and still in progress.

Turkish instructions: [tr.md](https://github.com/emreakdik/42ExamPractice/blob/main/tr.md)

## Why This Exists

Exam practice gets annoying when the setup steals your energy before the problem even starts.

This project is here to keep your momentum alive:

- Practice by level instead of hunting subjects one by one
- Stay inside a single shell workflow
- Test your code quickly with the `test` command
- Work in a `rendu` structure that feels close to the real exam

## In Action

### Use

![Use](https://media.giphy.com/media/ARIhoR9vxhkhmJaC1O/giphy.gif)

### Test

![test](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZmE0MWY5YzAyNDc1ZTJjMDNiOTFkNDVmOTJjYzQzMTJjMWFlN2QzNyZjdD1n/EOGH6oKsGRAHKibIqk/giphy.gif)

### Shell Flow

![trace](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTk1ZjBkMTdmMDczY2Q1NGU5YTBmNTJlOTU4NTg5NzVjMjI2MzE5MSZjdD1n/4LjdQpPs5xI2Uj9fty/giphy.gif)

## Quick Start

Clone the repository and launch the shell:

```bash
git clone https://github.com/emreakdik/42ExamPractice
cd 42ExamPractice
bash exampractice.sh
```

Once it opens, you are inside the practice flow.

## Commands

After the subject appears, you can use these commands:

- `test` to test your code
- `next` to move to the next subject
- `menu` to return to the main menu
- `exit` to close the shell

You can also open the built-in command list from the main menu.

## The `rendu` Folder

The shell looks for your code inside a `rendu` folder, using the same kind of structure you would prepare during the exam.

If you are solving `first_word`, your file should be placed like this:

```text
42ExamPractice/
└── rendu/
    └── first_word/
        └── first_word.c
```

That is the location the shell will use when it runs the tester.

## Platform Notes

- Best experience: macOS and Linux
- Windows users should prefer WSL or Git Bash
- The current shell focuses on terminal workflow, and some convenience actions are more comfortable on Unix-like systems

## Recent Updates

- Added a timeout to avoid infinite-loop lockups during compilation and testing
- Improved tester arguments
- Made compile errors easier to notice
- Added `-Wall -Wextra -Werror` checks in the test flow
- Added missing subjects: `ft_strrev`, `ft_strcspn`, `ft_list_foreach`, `lcm`, `print_bits`, `reverse_bits`, `wdmatch`
- Cleaned macOS `.DS_Store` artifacts and added a proper `.gitignore`
- Made `rendu` cleanup path-safe across the shell flow
- Made launcher and updater scripts work reliably from any current working directory
- Refreshed the main README with a stronger landing flow while keeping the original project spirit

## Contributing

This is an open-source practice tool built from real use, real friction, and real exam pain.

If you want to improve it, open an issue, send a PR, or help shape the next rank support.
