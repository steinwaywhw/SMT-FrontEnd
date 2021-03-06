#!/bin/bash



#timeout 30 (time -o log -f "%U" cvc4 ~/SMT/smtlib-20130327/QF_UF/SEQ/SEQ004_size5.smt2)


#find ../../ -type f -iname *.smt2 | (xargs -n 1 time -f "%U" cvc4) 2>&1 | xargs -IX echo "{X,X}"

#find ../../ -type f -iname *.smt2 | head -n 1 | xargs grep set-logic | awk "{print \$2}"

time=/usr/bin/time

TIMEOUT=30
TIMEFORMAT="User[%U] Sys[%S] Real[%E]"


date
echo ""

for SMT_FILE in $(find ~/SMT/benchmarks/QF_NIA -type f -iname *.smt2)
do

	# Randomly pick
	#R=$[ $RANDOM % 100 ]
	#if ( [ $R -ge 10 ] ) then 
	#	continue 
	#fi

	FOUND=$(grep $SMT_FILE benchmark.log)
	if ( [ $? -eq 0 ] ) then
		continue
	fi

	# Get LOGIC first
	LOGIC=$(grep set-logic $SMT_FILE | awk "{print substr(substr(\$2, 1, length(\$2)-1),1,length(\$0))}")	
	if ( [ $? -ne 0 ] || [ "$LOGIC" == "" ] ) then
		echo "error: can't get logic for $SMT_FILE" 
		LOGIC="N/A"

		continue
	#else

		# Filter LOGIC here
		#if ( [ "$LOGIC" != "QF_UFBV" ] ) then
		#	continue
		#fi
	fi

	

	# Get expected result here
	EXPECTED=$(grep 'set-info :status' $SMT_FILE | awk "{print substr(substr(\$3, 1, length(\$3)-1),1,length(\$0))}")
	if ( [ $? -ne 0 ] || [ "$EXPECTED" == "" ] ) then
	#	echo "error: can't get expected result for $SMT_FILE" 
		EXPECTED="N/A"
	#	continue
	fi

	# Echo
	echo "[$LOGIC] [$EXPECTED] $SMT_FILE"

	# Run CVC
	TIME_CVC=$(timeout $TIMEOUT $time --quiet -f "$TIMEFORMAT" cvc4 --incremental $SMT_FILE 2>&1)

	RC_CVC=$?
	RC_CVC_UNKNOWN=0
	RC_CVC_SAT=10
	RC_CVC_UNSAT=20

	if ( [ $RC_CVC -eq $RC_CVC_UNKNOWN ] || [ $RC_CVC -eq $RC_CVC_SAT ] || [ $RC_CVC -eq $RC_CVC_UNSAT ] ) then
		CVC=""
	else
		CVC=$TIME_CVC
		if ( [ $RC_CVC -eq 124 ] ) then
			TIME_CVC="error: timeout"
		else
			TIME_CVC="error: can't parse"
		fi
	fi


	if ( [ "$EXPECTED" != "sat" ] ) then
		# Run Alt-Ergo
		TIME_ALTERGO=$(timeout $TIMEOUT $time --quiet -f "$TIMEFORMAT" alt-ergo.opt $SMT_FILE 2>&1)

		RC_ALTERGO=$?

		if ( [ $RC_ALTERGO -ne 0 ] ) then
			ALTERGO=$TIME_ALTERGO
			if ( [ $RC_ALTERGO -eq 124 ] ) then
				TIME_ALTERGO="error: timeout"
			else
				TIME_ALTERGO="error: can't parse"
			fi
		fi
	else
		TIME_ALTERGO="skipped"
		ALTERGO=""
	fi


	echo "[cvc]" $TIME_CVC
	echo "[alt-ergo]" $TIME_ALTERGO
	echo "[cvc]" $CVC
	echo "[alt-ergo]" $ALTERGO
	echo ""
done

echo ""
date
