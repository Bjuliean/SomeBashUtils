#!/bin/bash
############ One Option ############
../s21_grep bla bla.txt blabla.txt > res_S21.txt
grep bla bla.txt blabla.txt > res.txt
echo "No options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -e bla bla.txt blabla.txt > res_S21.txt
grep -e bla bla.txt blabla.txt > res.txt
echo "-e options testing:"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -i bla bla.txt blabla.txt > res_S21.txt
grep -i bla bla.txt blabla.txt > res.txt
echo "-i options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -v pattern.txt bla.txt blabla.txt > res_S21.txt
grep -v pattern.txt bla.txt blabla.txt > res.txt
echo "-v options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -c bla bla.txt blabla.txt > res_S21.txt
grep -c bla bla.txt blabla.txt > res.txt
echo "-c options testing: "
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -l bla bla.txt blabla.txt > res_S21.txt
grep -l bla bla.txt blabla.txt > res.txt
echo "-l options testing:"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -n bla bla.txt blabla.txt > res_S21.txt
grep -n bla bla.txt blabla.txt > res.txt
echo "-n options testing:"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -h bla bla.txt blabla.txt > res_S21.txt
grep -h bla bla.txt blabla.txt > res.txt
echo "-h options testing:"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -s bla bla.txt blabla1.txt > res_S21.txt
grep -s bla bla.txt blabla1.txt > res.txt
echo "-s options testing:"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -f pattern.txt bla.txt blabla.txt > res_S21.txt
grep -f pattern.txt bla.txt blabla.txt > res.txt
echo "-f options testing:"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi


../s21_grep -o bla bla.txt blabla.txt > res_S21.txt
grep -o bla bla.txt blabla.txt > res.txt
echo "-o options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -e Option combinations ############

../s21_grep -ie bla bla.txt blabla.txt > res_S21.txt
grep -ie bla bla.txt blabla.txt > res.txt
echo "-ie options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ve bla bla.txt blabla.txt > res_S21.txt
grep -ve bla bla.txt blabla.txt > res.txt
echo "-ve options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ce bla bla.txt blabla.txt > res_S21.txt
grep -ce bla bla.txt blabla.txt > res.txt
echo "-ce options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -le .bla bla.txt blabla.txt > res_S21.txt
grep -le .bla bla.txt blabla.txt > res.txt
echo "-le options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ne bla bla.txt blabla.txt > res_S21.txt
grep -ne bla bla.txt blabla.txt > res.txt
echo "-ne options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -he bla bla.txt blabla.txt > res_S21.txt
grep -he bla bla.txt blabla.txt > res.txt
echo "-he options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -se bla bla.txt blabla1.txt > res_S21.txt
grep -se bla bla.txt blabla1.txt > res.txt
echo "-se options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -oe bla bla.txt blabla.txt > res_S21.txt
grep -oe bla bla.txt blabla.txt > res.txt
echo "-oe options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -i Option combinations ############

../s21_grep -iv bla bla.txt blabla.txt > res_S21.txt
grep -iv bla bla.txt blabla.txt > res.txt
echo "-iv options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ic bla bla.txt blabla.txt > res_S21.txt
grep -ic bla bla.txt blabla.txt > res.txt
echo "-ic options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -il bla bla.txt blabla.txt > res_S21.txt
grep -il bla bla.txt blabla.txt > res.txt
echo "-il options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -in bla bla.txt blabla.txt > res_S21.txt
grep -in bla bla.txt blabla.txt > res.txt
echo "-in options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ih bla bla.txt blabla.txt > res_S21.txt
grep -ih bla bla.txt blabla.txt > res.txt
echo "-ih options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -is bla bla.txt blabla1.txt > res_S21.txt
grep -is bla bla.txt blabla1.txt > res.txt
echo "-is options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -if pattern.txt bla.txt blabla.txt > res_S21.txt
grep -if pattern.txt bla.txt blabla.txt > res.txt
echo "-if options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -io bla bla.txt blabla.txt > res_S21.txt
grep -io bla bla.txt blabla.txt > res.txt
echo "-io options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -v Option combinations ############
../s21_grep -vc bla bla.txt blabla.txt > res_S21.txt
grep -vc bla bla.txt blabla.txt > res.txt
echo "-vc options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -vl bla bla.txt blabla.txt > res_S21.txt
grep -vl bla bla.txt blabla.txt > res.txt
echo "-vl options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -vn bla bla.txt blabla.txt > res_S21.txt
grep -vn bla bla.txt blabla.txt > res.txt
echo "-vn options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -vh bla bla.txt blabla.txt > res_S21.txt
grep -vh bla bla.txt blabla.txt > res.txt
echo "-vh options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -vs bla bla.txt blabla1.txt > res_S21.txt
grep -vs bla bla.txt blabla1.txt > res.txt
echo "-vs options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi
../s21_grep -vf pattern.txt bla.txt blabla.txt > res_S21.txt
grep -vf pattern.txt bla.txt blabla.txt > res.txt
echo "-vf options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -vo bla bla.txt blabla.txt > res_S21.txt
grep -vo bla bla.txt blabla.txt > res.txt
echo "-vo options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -c Option combinations ############


../s21_grep -cn bla bla.txt blabla.txt > res_S21.txt
grep -cn bla bla.txt blabla.txt > res.txt
echo "-cn options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ch bla bla.txt blabla.txt > res_S21.txt
grep -ch bla bla.txt blabla.txt > res.txt
echo "-ch options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -cs bla bla.txt blabla1.txt > res_S21.txt
grep -cs bla bla.txt blabla1.txt > res.txt
echo "-cs options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -cf pattern.txt bla.txt blabla.txt > res_S21.txt
grep -cf pattern.txt bla.txt blabla.txt > res.txt
echo "-cf options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -co bla bla.txt blabla.txt > res_S21.txt
grep -co bla bla.txt blabla.txt > res.txt
echo "-co options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -l Option combinations ############

../s21_grep -ln bla bla.txt blabla.txt > res_S21.txt
grep -ln bla bla.txt blabla.txt > res.txt
echo "-ln options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -lh bla bla.txt blabla.txt > res_S21.txt
grep -lh bla bla.txt blabla.txt > res.txt
echo "-lh options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ls bla bla.txt blabla1.txt > res_S21.txt
grep -ls bla bla.txt blabla1.txt > res.txt
echo "-ls options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -lf pattern.txt bla.txt blabla.txt > res_S21.txt
grep -lf pattern.txt bla.txt blabla.txt > res.txt
echo "-lf options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -lo bla bla.txt blabla.txt > res_S21.txt
grep -lo bla bla.txt blabla.txt > res.txt
echo "-lo options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -n Option combinations ############

../s21_grep -nh bla bla.txt blabla.txt > res_S21.txt
grep -nh bla bla.txt blabla.txt > res.txt
echo "-nh options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ns bla bla.txt blabla1.txt > res_S21.txt
grep -ns bla bla.txt blabla1.txt > res.txt
echo "-ns options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -nf pattern.txt bla.txt blabla.txt > res_S21.txt
grep -nf pattern.txt bla.txt blabla.txt > res.txt
echo "-nf options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -no bla bla.txt blabla.txt > res_S21.txt
grep -no bla bla.txt blabla.txt > res.txt
echo "-no options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -h Option combinations ############

../s21_grep -hs bla bla.txt blabla1.txt > res_S21.txt
grep -hs bla bla.txt blabla1.txt > res.txt
echo "-hs options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -hf pattern.txt bla.txt blabla.txt > res_S21.txt
grep -hf pattern.txt bla.txt blabla.txt > res.txt
echo "-hf options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -ho bla bla.txt blabla.txt > res_S21.txt
grep -ho bla bla.txt blabla.txt > res.txt
echo "-ho options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

############ -s Option combinations ############

../s21_grep -sf pattern.txt bla.txt blabla1.txt > res_S21.txt
grep -sf pattern.txt bla.txt blabla1.txt > res.txt
echo "-sf options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi

../s21_grep -so bla bla.txt blabla1.txt > res_S21.txt
grep -so bla bla.txt blabla1.txt > res.txt
echo "-so options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi
############ -f Option combinations ############

../s21_grep -of pattern.txt bla.txt blabla.txt > res_S21.txt
grep -of pattern.txt bla.txt blabla.txt > res.txt
echo "-fo options testing"
LEN=$(diff res.txt res_S21.txt | wc -l)
if [ $LEN == 0 ]; then 
    echo "SUCCESS"
else
    echo "FAIL"
fi
rm res_S21.txt res.txt
