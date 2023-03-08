#!/bin/bash

file1=rotone.c
file2=../../../../rendu/rotone/rotone.c


# 1. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "L'eSPrit nE peUt plUs pRogResSer s'Il staGne et sI peRsIsTent VAnIte et auto-justification." > out1.txt
    ./out2 "L'eSPrit nE peUt plUs pRogResSer s'Il staGne et sI peRsIsTent VAnIte et auto-justification." > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt

# 2. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "S'enTOuRer dE sECreT eSt uN sIGnE De mAnQuE De coNNaiSSanCe.  " > out1.txt
    ./out2 "S'enTOuRer dE sECreT eSt uN sIGnE De mAnQuE De coNNaiSSanCe.  " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 3. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "3:21 Ba  tOut  moUn ki Ka di KE m'en Ka fe fot" > out1.txt
    ./out2 "3:21 Ba  tOut  moUn ki Ka di KE m'en Ka fe fot" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 4. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "Papache est un sabre" "a" "o" > out1.txt
    ./out2 "Papache est un sabre" "a" "o" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt

# 5. test 
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "zaz" "art" "zul" > out1.txt
    ./out2 "zaz" "art" "zul" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 6. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "zaz" "r" "u" > out1.txt
    ./out2 "zaz" "r" "u" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 7. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "jacob" "a" "b" "c" "e" > out1.txt
    ./out2 "jacob" "a" "b" "c" "e" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 8. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "ZoZ eT Dovid oiME le METol." "o" "a" > out1.txt
    ./out2 "ZoZ eT Dovid oiME le METol." "o" "a" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 9. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "wNcOre Un ExEmPle Pas Facilw a Ecrirw " "w" "e" > out1.txt
    ./out2 "wNcOre Un ExEmPle Pas Facilw a Ecrirw " "w" "e" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
# 10. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "AkjhZ zLKIJz , 23y " > out1.txt
    ./out2 "AkjhZ zLKIJz , 23y " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt

    # 11. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "FOR PONY" > out1.txt
    ./out2 "FOR PONY" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
    # 12. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "this        ...       is sparta, then again, maybe    not" > out1.txt
    ./out2 "this        ...       is sparta, then again, maybe    not" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
    # 13. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "   " > out1.txt
    ./out2 "   " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
    # 14. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "a" "b" > out1.txt
    ./out2 "a" "b" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
    # 15. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "  lorem,ipsum  " > out1.txt
    ./out2 "  lorem,ipsum  " > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
    # 16. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 "" > out1.txt
    ./out2 "" > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt
    
     # 17. test
    gcc -o out1 "$file1"
    gcc -o out2 "$file2"

    ./out1 > out1.txt
    ./out2 > out2.txt

    if diff -q out1.txt out2.txt >/dev/null ; then
        echo "Success"
    else
        echo "Fail"
    fi

    rm out1 out2 out1.txt out2.txt