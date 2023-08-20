

> !!!don't forget to star the repo

**Compatible Operating Systems:**

-   Mac OS
-   All Linux Distros
-   Windows

> The shell is still in development. Currently, only Exam Rank 02 is available for use.
```
### Last Updates
- Timeout was added to solve the infinite loop problem that occurs during compilation.
- Errors in linked-list questions have been fixed.
- Improvements were made in tester arguments.
- A bug that caused compile errors to not be visible was fixed.
- -Wall -Wextra -Werror flags were added.
- Confusing script errors that come with compile errors were hidden.
- Missing subjects added (ft_strrev, ft_strcspn, ft_list_foreach, lcm, print_bits, reverse_bits, wdmatch).
```
Turkce Talimatlar: [Baglanti](https://github.com/emreakdik/42ExamPractice/blob/main/tr.md)

This shell aims to provide better practice for exams. By dividing the exam into levels, it allows you to solve consecutive questions at your desired level to make your practice more efficient. Additionally, by using the "test" command, the shell tests your code for you.

## Table of Contents

-   [Introducing](https://github.com/emreakdik/42ExamPractice#introducing)
-   [Install Instructions](https://github.com/emreakdik/42ExamPractice#install-instructions)
-   [User Guide](https://github.com/emreakdik/42ExamPractice#user-guide)
-   [Usage Of The "rendu" Folder](https://github.com/emreakdik/42ExamPractice#usage-of-the-rendu-folder)

## Introducing

- Use

![Use](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMjk5Y2ZmMjI4YTRmMzdiNjFmODgzMTkyYmMyYjZiZDZjYzQzYjQwNSZjdD1n/ntov5KjibEst89joIt/giphy.gif)

- test

![test](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZmE0MWY5YzAyNDc1ZTJjMDNiOTFkNDVmOTJjYzQzMTJjMWFlN2QzNyZjdD1n/EOGH6oKsGRAHKibIqk/giphy.gif)

- trace

![trace](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZTk1ZjBkMTdmMDczY2Q1NGU5YTBmNTJlOTU4NTg5NzVjMjI2MzE5MSZjdD1n/4LjdQpPs5xI2Uj9fty/giphy.gif)

## Install Instructions

1.  Firstly, clone the repo to your desired directory using the `git clone` command:
    
    ```bash
    git clone https://github.com/emreakdik/42ExamPractice
    ```
    
2.  Then, navigate to the 42ExamPractice directory and run the following command in the terminal:
    
    ```bash
    bash exampractice.sh
    ```
    
    Congratulations, you have accessed the shell.
    

## User Guide

The usage of the shell is quite simple. In the selection screens, you need to choose which exam and level you want to practice.

After the questions appear, there are several actions you can take, which are:

-   After writing the code that the subject requires, you can test your code by typing `test`.
-   You can type `next` to move on to the next subject.
-   You can type `menu` to return to the menu.
-   You can type `exit` to exit the shell.

You can also view the commands by selecting the "Commands" option in the main menu.

## Usage Of The "rendu" Folder:

In order for the shell to find and test your code correctly, you need to specify the location where you write your code as if you were in an exam.

When you access the menu, the program will create a "rendu" folder inside the 42ExamPractice folder. Let's say you are trying to solve the "first_word" question.

What you need to do is create a "first_word" folder inside the "rendu" folder and write your code inside the "first_word.c" file.
