#! /usr/bin/bash

if [ $# -eq 1 ]
then
    cd "$1"
fi

echo "size      seq       par       opt"

size=60
duration=200

for nproc in 1 2 3 4
do

    printf "%2d   " $nproc


    raw=`python3 n-bodies-seq.py $size $duration -nodisplay`
    perf=`echo $raw | tail -n 1 | awk '{print $2}'`
    echo -n $perf"  "

    for target in n-bodies-par.py n-bodies-opt.py
    do
	if [ -e $target ]
	then
	    raw=`mpirun -n $nproc python3 $target $size $duration -nodisplay`
	    
	    perf=`echo $raw | tail -n 1 | awk '{print $2}'`
	    echo -n $perf"  "

	else
	    echo File $target does not exist
	fi
    done
    echo
done

if [ $# -eq 1 ]
then
    cd -
fi
