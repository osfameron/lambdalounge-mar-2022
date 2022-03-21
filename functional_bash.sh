#!/bin/bash

rm out.*

clear
cowsay <<λλ
Functional Bash!
@TechySquirrel
LambdaLounge 2022-03-21
λλ

WORDS=/usr/share/dict/words
head $WORDS


grep '^f' $WORDS | head

grep '^f' $WORDS -c

cat $WORDS \
    | grep '^f' \
    | wc -l

<$WORDS \
    grep '^f' \
    | wc -l


<$WORDS \
    grep '^f' \
    | cut -c 1-4 \
    | head


cat <<"UPPER" > upper.sh
#!/usr/local/bin/bash
echo ${*^^} # Bash 4.0 magic!
UPPER
chmod +x upper.sh

./upper.sh hello lambdalounge

<$WORDS head \
    | xargs ./upper.sh

<$WORDS tail \
    | xargs -L1 ./upper.sh

cowthink <<GODEL
elite “metaprogramming” technique...
https://lacker.io/math/2022/02/24/godels-incompleteness-in-bash.html
GODEL

gh repo view \
    https://github.com/spencertipping/bash-lambda

q


BBC="$(tput setaf 255; tput setab 0)[B|B|C]$(tput sgr0)"
clear
cowthink <<EXAMPLE
At ${BBC} one time, we tried to copy a
Terabyte scale database into the Cloud...
EXAMPLE

# brew install mysql

gh repo view \
    https://github.com/datacharmer/test_db

./import.sh # time mysql < employees.sql

man split

q

w3m https://philiplb.de/sqldumpsplitter3/

DUMP=test_db/load_salaries1.dump
head $DUMP
du -h $DUMP


time split -p "^INSERT" $DUMP out.

ls out.*

for OUT in out.*; do
    head -n 1 $OUT
done

cowthink ⌛...

insect "2TB / 38MB * 3s -> days"

cowthink 💾...

time grep "^INSERT" $DUMP


grep -b "^INSERT" $DUMP

grep -H "^INSERT" $DUMP

grep -bH "^INSERT" $DUMP \
    | cut -d: -f1,2 \
    | tee offsets.1


(
  cut -d: -f2 offsets.1 \
    | tail -n +2
  stat -f%z $DUMP
) > offsets.2

head -n 2 offsets.1; \
echo ...; \
tail -n 2 offsets.1; \
echo; \
head -n 2 offsets.2; \
echo ...; \
tail -n 2 offsets.2

# 🤐
paste -d: offsets.1 offsets.2  \
    | tee offsets.out

dd if=$DUMP iseek=0 count=6 ibs=1 2>/dev/null
dd if=$DUMP iseek=7 count=4 ibs=1 2>/dev/null

dd if=$DUMP iseek=38758512 count=29 ibs=1 2>/dev/null

insect "39806034 - 38758512"

while IFS=: read -r FILE FROM TO
do
    COUNT=$(insect "$TO - $FROM")
    echo =================== $FROM
    dd if=$FILE iseek=$FROM count=$COUNT ibs=1 2>/dev/null \
        | head -n 3
    echo "..."
    dd if=$FILE iseek=$FROM count=$COUNT ibs=1 2>/dev/null \
        | tail -n 3
    sleep 1
done < offsets.out



cowthink Just like Erlang strings / piece tables!


# 😱😱😱
man parallel 

q


cowsay <<λλ
https://www.couchbase.com/careers/open-positions
Technical Writing!
SDK Engineers!
Cloud dev!
Thanks for listening. Hakim @TechySquirrel
https://github.com/osfameron/lambdalounge-mar-2022
λλ

# The END
