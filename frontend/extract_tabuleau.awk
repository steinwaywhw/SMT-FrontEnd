function get_content (field) {
	return substr(field, 2, length(field) - 2)
}

function get_result (row) {
	if (match (row, "timeout") > 0)
		return "timeout"
	if (match (row, "error") > 0)
		return "error"
	if (match (row, "\] unsat U") > 0)
		return "unsat"
	if (match (row, "\] unknown ") > 0)
		return "unknown"
	if (match (row, "\] sat U") > 0)
		return "sat"
	if (match (row, "\] skipped") > 0)
		return "skipped"

	return "multiple"
}

function to_sec (field) {
	if (field == "-1")
		return -1

	time = field
	gsub (/[:\.]/, " ", time)
	split (time, array, " ")

	return array[1] * 60 + array[2] * 1 + array[3] / 100
}

function get_time (row, type) {
	if (match (row, /User\[.+\] Sys\[.+\] Real\[.+\]/) > 0) {
		ret = row
		gsub (/(^.*User\[|Sys\[|Real\[|\])/, " ", ret)
		split (ret, array, " ")
		return array[type]
	} else {
		return "-1"
	}
}

function reset () {
	FILE = ""
	EXPECTED = ""
	LOGIC = ""
	CVC_RESULT = ""
	CVC_TIME = ""
	CVC_OUTPUT = ""
	ALTERGO_RESULT = ""
	ALTERGO_TIME = ""
	ALTERGO_OUTPUT = ""
}

function who_is_correct () {
	ANS = 0
	if (CVC_RESULT == EXPECTED)
		ANS = ANS + 1
	if (ALTERGO_RESULT == EXPECTED)
		ANS = ANS + 1

	if (ANS == 2)
		return "both"
	if (ANS == 0)
		return "none"

	if (CVC_RESULT == EXPECTED)
		return "cvc4"
	if (ALTERGO_RESULT == EXPECTED)
		return "alt-ergo"
}

function who_wins () {
	if (CVC_TIME == "-1" && ALTERGO_TIME == "-1")
		return "none"
	if (ALTERGO_TIME == "-1" && CVC_RESULT == EXPECTED)
		return "cvc4"
	if (CVC_TIME == "-1" && ALTERGO_RESULT == EXPECTED)
		return "alt-ergo"

	if (CVC_TIME > ALTERGO_TIME)
		return "alt-ergo"
	if (ALTERGO_TIME > CVC_TIME)
		return "cvc4"
	if (ALTERGO_TIME == CVC_TIME)
		return "both"

	return "error"
}

function output () {

	CORRECT = who_is_correct ()
	WIN = who_wins()

	if (EXPECTED == CVC_RESULT && EXPECTED == ALTERGO_RESULT)
		CORRECT = "both"
	else if (EXPECTED == CVC_RESULT)
		CORRECT = "cvc"
	else if (EXPECTED == ALTERGO_RESULT)
		CORRECT = "alt-ergo"
	else
		CORRECT = "none"

	printf "%s %s cvc %s %s %s %s\n", LOGIC, EXPECTED, CORRECT, CVC_RESULT, CVC_TIME, FILE
	printf "%s %s alt-ergo %s %s %s %s\n", LOGIC, EXPECTED, CORRECT, ALTERGO_RESULT, ALTERGO_TIME, FILE

}

function get_answer_file (file) {
	return file + ".bz2.result.txt"
}

BEGIN {
	STATE = 0
	COUNTER = 0
	reset ()
}

/\[.+\] \[(sat|unsat)\] \/home/ {
	STATE = 1
	FILE = $3
	EXPECTED = get_content ($2)
	LOGIC = get_content ($1)
	COUNTER = COUNTER + 1
}

/\[cvc\]/ {
	if (STATE == 1) {
		STATE = 2

		CVC_RESULT = get_result ($0)
		CVC_TIME = to_sec (get_time ($0, 3))
		if (CVC_TIME > 30) {
			STATE = 0
			reset ()
			COUNT = COUNT - 1
			next
		}
	} else if (STATE == 3) {
		STATE = 4
		#CVC_OUTPUT = $2
	}
}

/\[alt\-ergo\]/ {
	if (STATE == 2) {
		STATE = 3

		ALTERGO_RESULT = get_result ($0)
		ALTERGO_TIME = to_sec (get_time ($0, 3))
		if (ALTERGO_TIME > 30) {
			STATE = 0
			reset ()
			COUNT = COUNT - 1
			next
		}
	} else if (STATE == 4) {
		STATE = 5
		#ALTERGO_OUTPUT = $2
	}
}

{
	if (STATE == 5) {
		STATE = 0
		output ()
		reset ()
	}
}








