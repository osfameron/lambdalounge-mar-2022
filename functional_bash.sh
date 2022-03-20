#!/bin/bash

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


upper() {
    echo ${*^^}  # bash 4.0 feature
}


upper hello lambdalounge


# 😱
<$WORDS head \
    | xargs upper

cat <<"UPPER" > upper.sh
echo ${*^^}
UPPER
chmod +x upper.sh

./upper.sh hello lambdalounge

<$WORDS head \
    | xargs bash upper.sh


<$WORDS head \
    | xargs -L1 bash upper.sh


# 😱
<$WORDS head \
    | xargs -L1 wc -c

cat <<"FLOW" > flow.sh
CMD=$1
shift
echo $* | $CMD
FLOW
chmod +x flow.sh


# 😱
<$WORDS head \
    | xargs -L1 bash flow.sh "wc -c"


cat <<"COUNT" > count.sh
echo ${#1}
COUNT
chmod +x count.sh


<$WORDS head \
    | xargs -L1 bash count.sh


<$WORDS head \
    | xargs -L1 bash count.sh \
    | numsum

count() {
    echo ${#1}
}

map() {
    CMD=$*
    while read i; do
        $CMD $i
    done
}

<$WORDS head \
    | map count \
    | numsum


<$WORDS tail \
    | map upper

gh repo view \
    https://github.com/spencertipping/bash-lambda

BBC="$(tput setaf 255; tput setab 0)[B|B|C]$(tput sgr0)"
cowthink <<EXAMPLE
At ${BBC} one time, we tried to copy a
Terabyte scale database into the Cloud...
EXAMPLE

brew install mysql

gh repo view \
    https://github.com/datacharmer/test_db
# git clone git@github.com:datacharmer/test_db.git

time mysql < test_db/employees.sql

insect "2TB / 169MB * 38s -> seconds"

man split

w3m https://philiplb.de/sqldumpsplitter3/

DUMP=test_db/load_salaries1.dump
du -h $DUMP

head $DUMP

time split -p "^INSERT" $DUMP out.

ls out.*

for OUT in out.*; do
    head -n 1 $OUT
done

insect "2TB / 38MB * 3s -> days"

time grep "^INSERT" $DUMP

grep -bH "^INSERT" $DUMP

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
paste -d: offsets.1 offsets.2  

paste -d: offsets.1 offsets.2 > offsets.out

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


# 😱😱😱
man parallel 


cowthink Just like Erlang strings / piece tables!


cowsay <<🛋️
https://www.couchbase.com/careers/open-positions
Technical Writing!
SDK Engineers!
Cloud dev!
Thanks for listening. Hakim @TechySquirrel
🛋️

