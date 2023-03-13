
> The shell is still in development. Currently, only Exam Rank 02 is
> available for use.


tr : Bu shell sinavlara daha iyi pratik yapmanizi amacliyor. Pratigi daha verimli hale getirmek icin sinavi level level bolerek istediginiz levelde pespese sorular cozmenizi sagliyor. Ayni zamanda "test" komutu ile birlikte yazdiginiz kodu shell sizin icin test ediyor.
Turkce Talimatlar: 

en : This shell aims to provide better practice for exams. By dividing the exam into levels, it allows you to solve consecutive questions at your desired level to make your practice more efficient. Additionally, by using the "test" command, the shell tests your code for you.

## Usage Instructions:

Firstly, clone the repo to your desired directory using the git clone command. 

    git clone https://github.com/emreakdik/42ExamPractice

Then, navigate to the 42ExamPractice directory and run the following command in the terminal: 

    bash exampractice.sh

Congratulations, you have accessed the shell.

## User Guide:

The usage of the shell is quite simple. In the selection screens, you need to choose which exam and level you want to practice.

After the questions appear, there are several actions you can take, which are:

-   After writing the code that the subject requires, you can test your code by typing "test".
-   You can type "next" to move on to the next subject.
-   You can type "menu" to return to the menu.
-   You can type "exit" to exit the shell.

> You can also view the commands by selecting the "Commands" option in
> the main menu.

## Usage of the "rendu" folder:

In order for the shell to find and test your code correctly, you need to specify the location where you write your code as if you were in an exam.

When you access the menu, the program will create a "rendu" folder inside the 42ExamPractice folder. Let's say you are trying to solve the "first_word" question.

What you need to do is create a "first_word" folder inside the "rendu" folder and write your code inside the "first_word.c" file.
