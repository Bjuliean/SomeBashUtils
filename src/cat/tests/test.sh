#!/bin/bash
../s21_cat file.txt no_print.txt > res_S21.txt
cat file.txt no_print.txt > res.txt
echo "No options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

rm res_S21.txt res.txt

../s21_cat -b file.txt > res_S21.txt
cat -b file.txt > res.txt
echo "-b options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

rm res_S21.txt res.txt

../s21_cat -n file.txt > res_S21.txt
cat -n file.txt > res.txt
echo "-n options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

rm res_S21.txt res.txt

../s21_cat -s file.txt > res_S21.txt
cat -s file.txt > res.txt
echo "-s options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

rm res_S21.txt res.txt

../s21_cat -t file.txt > res_S21.txt
cat -t file.txt > res.txt
echo "-t options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

rm res_S21.txt res.txt

../s21_cat -e no_print.txt > res_S21.txt
cat -e no_print.txt > res.txt
echo "-e options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

rm res_S21.txt res.txt