#! /usr/bin/bash

if [ $# -eq 1 ]
then
    cd "$1"
fi

res=0
declare -A ref_time=( ["6"]="-1.7209e+17" ["24"]="-3.4926e+17" )

for size in 6 24
do
    raw=`python3 n-bodies-seq.py $size 10 -nodisplay`

    base=`echo $raw | tail -n 1 | awk '{print $4}'`
    if [ "$base" != ${ref_time[$size]} ]
    then
	echo Problem with base time for $size stars
    else
	echo Ok with base time for $size stars
	res=$(( $res + 1 ))
    fi
    
    for target in n-bodies-par.py n-bodies-opt.py
    do
	if [ -e $target ]
	then
	    for nproc in 1 2 3
	    do
		raw=`mpirun -n $nproc python3 $target $size 10 -nodisplay`

		val=`echo $raw | tail -n 1 | awk '{print $4}'`
		
		if [ "$val" != "$base" ]
		then
		    echo Problem with $nproc processes and $size stars using $target
			echo "    Last line of output \"$val\""
		else
		    echo OK for $nproc processes and $size stars using $target
		    res=$(( $res + 1 ))
		fi
	    done
	else
	    echo File $target does not exist
	fi
    done
done

echo Good results : $res

if [ $# -eq 1 ]
then
    cd -
fi
