

declare -a LOGICS=("QF_IDL" "QF_NIA" "QF_UFBV" "QF_UFLIA" "UFNIA" "QF_BV" "QF_LIA" "QF_UF" "QF_UFIDL")

for LOGIC in "${LOGICS[@]}"
do	
	COUNT_ALL=$(grep "^$LOGIC" benchmark.report | wc -l)
	COUNT_UNSAT=$(grep "^$LOGIC unsat" benchmark.report | wc -l)
	COUNT_SAT=$(grep "^$LOGIC sat" benchmark.report | wc -l)

	COUNT_CVC_CORRECT_UNSAT=$(grep -E "^$LOGIC unsat (cvc4|both)" benchmark.report | wc -l)
	COUNT_CVC_ERROR_UNSAT=$(grep -E "^$LOGIC unsat .+ .+ (sat|error)" benchmark.report | wc -l)
	COUNT_CVC_TIMEOUT_UNSAT=$(grep -E "^$LOGIC unsat .+ .+ timeout" benchmark.report | wc -l)
	COUNT_CVC_UNKNOWN_UNSAT=$(grep -E "^$LOGIC unsat .+ .+ unknown" benchmark.report | wc -l)

	COUNT_ALT_CORRECT=$(grep -E "^$LOGIC unsat (alt\-ergo|both)" benchmark.report | wc -l)
	COUNT_ALT_ERROR=$(grep -E "^$LOGIC unsat .+ .+ .+ .+ (sat|error)" benchmark.report | wc -l)
	COUNT_ALT_TIMEOUT=$(grep -E "^$LOGIC unsat .+ .+ .+ .+ timeout" benchmark.report | wc -l)
	COUNT_ALT_UNKNOWN=$(grep -E "^$LOGIC unsat .+ .+ .+ .+ unknown" benchmark.report | wc -l)

	COUNT_CVC_CORRECT_SAT=$(grep -E "^$LOGIC sat (cvc4|both)" benchmark.report | wc -l)
	COUNT_CVC_TIMEOUT_SAT=$(grep -E "^$LOGIC sat .+ .+ timeout" benchmark.report | wc -l)
	COUNT_CVC_ERROR_SAT=$(grep -E "^$LOGIC sat .+ .+ error" benchmark.report | wc -l)
	COUNT_CVC_UNKNOWN_SAT=$(grep -E "^$LOGIC sat .+ .+ unknown" benchmark.report | wc -l)

	COUNT=0
	CVC_TIME_SAT=0
	ALL_TIMES=$(awk "/^$LOGIC sat .+ .+ sat/ {print \$6}" benchmark.report)
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
	ALL_TIMES=$(awk "/^$LOGIC unsat .+ .+ unsat/ {print \$6}" benchmark.report)
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
	ALL_TIMES=$(awk "/^$LOGIC unsat .+ .+ .+ .+ unsat/ {print \$8}" benchmark.report)
	for TIME in $ALL_TIMES
	do
		let COUNT+=1
		ALT_TIME_UNSAT=$(echo "scale=2; $ALT_TIME_UNSAT + $TIME" | bc -q)
	done
	if ( [ $COUNT -ne 0 ] ) then
		ALT_TIME_UNSAT=$(echo "scale=2; $ALT_TIME_UNSAT / $COUNT" | bc -q)
	fi 

	printf "%s unsat(%d) cvc(%d,%d,%d,%d) alt(%d,%d,%d,%d) cvc(%.2f) alt(%.2f)\n" "$LOGIC" "$COUNT_UNSAT" "$COUNT_CVC_CORRECT_UNSAT" "$COUNT_CVC_TIMEOUT_UNSAT" "$COUNT_CVC_ERROR_UNSAT" "$COUNT_CVC_UNKNOWN_UNSAT" "$COUNT_ALT_CORRECT" "$COUNT_ALT_TIMEOUT" "$COUNT_ALT_ERROR" "$COUNT_ALT_UNKNOWN" "$CVC_TIME_UNSAT" "$ALT_TIME_UNSAT"
done
