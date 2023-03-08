cat << intro
==========================
1. Exam Rank 02
2. Exam Rank 03 (in process)
3. Exam Rank 04 (in process)
==========================
intro
read -p "Enter your option (1-3): " opt

case $opt in
    1)
        sh rank02.sh
        ;;
    2) 
    echo "Exam Rank 03 is not ready for practice."
    sleep 3
    sh menu.sh
        ;;
    3) 
    echo "Exam Rank 04 sis not ready for practice."
    sleep 3
    sh menu.sh
        ;;
esac