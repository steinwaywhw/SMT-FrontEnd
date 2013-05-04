

declare -a LOGICS=("QF_IDL" "QF_NIA" "QF_UFBV" "QF_UFLIA" "UFNIA" "QF_BV" "QF_LIA" "QF_UF" "QF_UFIDL")


for LOGIC in "${LOGICS[@]}"
do
	echo "$LOGIC"
	COUNT_ALL=$(grep "^$LOGIC" benchmark.report | wc -l)
	COUNT_UNSAT=$(grep "^$LOGIC unsat" benchmark.report | wc -l)
	COUNT_SAT=$(grep "^$LOGIC sat" benchmark.report | wc -l)
	COUNT_CVC_CORRECT_SAT=$(grep -E "^$LOGIC sat (cvc4|both)" benchmark.report | wc -l)
	COUNT_CVC_CORRECT_UNSAT=$(grep -E "^$LOGIC unsat (cvc4|both)" benchmark.report | wc -l)
	COUNT_ALT_CORRECT=$(grep -E "^$LOGIC (unsat|sat) (alt\-ergo|both)" benchmark.report | wc -l)

	#grep -E "^QF_IDL unsat \w* \w* timeout" benchmark.report |


	COUNT=0
	CVC_TIME_SAT=0
	ALL_TIMES=$(awk "/^$LOGIC sat (cvc4|both)/ {print \$6}" benchmark.report)
	for TIME in $ALL_TIMES
	do
		let COUNT+=1
		CVC_TIME_SAT=$(echo "scale=2; $CVC_TIME_SAT + $TIME" | bc -q)
	done
	if ( [ $COUNT -ne 0 ] ) then
		CVC_TIME_SAT=$(echo "scale=2; $CVC_TIME_SAT / $COUNT" | bc -q)
	fi

	COUNT=0
	CVC_TIME_UNSAT=0
	ALL_TIMES=$(awk "/^$LOGIC unsat \w+ \w+ unsat/ {print \$6}" benchmark.report)
	for TIME in $ALL_TIMES
	do
		let COUNT+=1
		CVC_TIME_UNSAT=$(echo "scale=2; $CVC_TIME_UNSAT + $TIME" | bc -q)
	done
	if ( [ $COUNT -ne 0 ] ) then
		CVC_TIME_UNSAT=$(echo "scale=2; $CVC_TIME_UNSAT / $COUNT" | bc -q)
	fi

	COUNT=0
	ALT_TIME_UNSAT=0
	ALL_TIMES=$(awk "/^$LOGIC unsat \w+ \w+ \w+ .+ unsat/ {print \$8}" benchmark.report)
	for TIME in $ALL_TIMES
	do
		let COUNT+=1
		ALT_TIME_UNSAT=$(echo "scale=2; $ALT_TIME_UNSAT + $TIME" | bc -q)
	done
	if ( [ $COUNT -ne 0 ] ) then
		ALT_TIME_UNSAT=$(echo "scale=2; $ALT_TIME_UNSAT / $COUNT" | bc -q)
	fi 


	#done
	echo "all    $COUNT_ALL"
	echo "unsat  $COUNT_UNSAT"
	echo "sat    $COUNT_SAT"
	echo "cvc_s  $COUNT_CVC_CORRECT_SAT"
	echo "cvc_n  $COUNT_CVC_CORRECT_UNSAT"
	echo "alt    $COUNT_ALT_CORRECT"
	echo "cvc_ts $CVC_TIME_SAT"
	echo "cvc_tn $CVC_TIME_UNSAT"
	echo "alt_tn $ALT_TIME_UNSAT"
	echo ""
done
