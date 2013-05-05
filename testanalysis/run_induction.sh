#!/bin/bash



#timeout 30 (time -o log -f "%U" cvc4 ~/SMT/smtlib-20130327/QF_UF/SEQ/SEQ004_size5.smt2)


#find ../../ -type f -iname *.smt2 | (xargs -n 1 time -f "%U" cvc4) 2>&1 | xargs -IX echo "{X,X}"

#find ../../ -type f -iname *.smt2 | head -n 1 | xargs grep set-logic | awk "{print \$2}"

time=/usr/bin/time

TIMEOUT=15
TIMEFORMAT="User[%U] Sys[%S] Real[%E]"


date
echo ""

for SMT_FILE in $(find ~/SMT/benchmarks/INDUCTION -type f -iname *.smt2)
do

	# Randomly pick
	R=$[ $RANDOM % 100 ]
	if ( [ $R -ge 50 ] ) then 
		continue 
	fi

	FOUND=$(grep $SMT_FILE benchmark.induction)
	if ( [ $? -eq 0 ] ) then
		continue
	fi

	# Get LOGIC first
	LOGIC=$(grep set-logic $SMT_FILE | awk "{print substr(substr(\$2, 1, length(\$2)-1),1,length(\$0))}")	
	if ( [ $? -ne 0 ] || [ "$LOGIC" == "" ] ) then
		echo "error: can't get logic for $SMT_FILE" 
		LOGIC="N/A"

		continue
	fi

	# Echo
	echo "[$LOGIC] $SMT_FILE"

	# Run CVC
	TIME_CVC=$(timeout $TIMEOUT $time --quiet -f "$TIMEFORMAT" cvc4 --incremental $SMT_FILE 2>&1)

	RC_CVC=$?
	RC_CVC_UNKNOWN=0
	RC_CVC_SAT=10
	RC_CVC_UNSAT=20

	if ( [ $RC_CVC -eq $RC_CVC_UNKNOWN ] || [ $RC_CVC -eq $RC_CVC_SAT ] || [ $RC_CVC -eq $RC_CVC_UNSAT ] ) then
		TIME_CVC="[OK] $TIME_CVC"
	else
		if ( [ $RC_CVC -eq 124 ] ) then
			TIME_CVC="[TIMEOUT] $TIME_CVC"
		else
			TIME_CVC="[ERROR] $TIME_CVC"
		fi
	fi


	# Run Alt-Ergo
	TIME_ALTERGO=$(timeout $TIMEOUT $time --quiet -f "$TIMEFORMAT" alt-ergo.opt $SMT_FILE 2>&1)

	RC_ALTERGO=$?

	if ( [ $RC_ALTERGO -ne 0 ] ) then
		if ( [ $RC_ALTERGO -eq 124 ] ) then
			TIME_ALTERGO="[TIMEOUT] $TIME_ALTERGO"
		else
			TIME_ALTERGO="[ERROR] $TIME_ALTERGO"
		fi
	else
		TIME_ALTERGO="[OK] $TIME_ALTERGO"
	fi


	echo "[cvc]" $TIME_CVC
	echo "[alt-ergo]" $TIME_ALTERGO
	echo ""
done

echo ""
date
