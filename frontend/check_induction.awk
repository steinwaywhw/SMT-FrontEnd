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
	ANS_FILE = ""

	CVC_RESULT = 0
	CVC_TIME = ""
	ALTERGO_RESULT = 0
	ALTERGO_TIME = ""
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

	printf "%s %s %s %s %s %s %s %s %s %s %s\n", LOGIC, EXPECTED, CORRECT, WIN, CVC_RESULT, CVC_TIME, ALTERGO_RESULT, ALTERGO_TIME, FILE, CVC_OUTPUT, ALTERGO_OUTPUT
}

function get_answer_file (file) {
	ans = file
	gsub (/system_c/, "system_c/answer", ans)
	gsub (/lustre/, "lustre/answer", ans)
	return ans + ".bz2.result.txt"
}

function extract_answer (row) {
	ans = row
	gsub (/\(sat\)|\[.+\]|User|Sys|Real/, "", ans)
	return ans
}

function check_answer (ans, file) {
	count = 0
	split (ans, arr, " ")
	for (a in arr) {
		getline exp < file
		
		if (a == exp) {
			count++
			continue
		}

		if (a == unknown)
			continue

		if (exp == sat && a != sat) {
			while ()
		}
	}
	
}


#[QF_LIA] /home/hwwu/SMT/benchmarks/INDUCTION/system_c/mem_slave_tlm.5.c.kratos.int.ind_k100.smt2


BEGIN {
	STATE = 0
	COUNTER = 0
	reset ()
}

/^&\[QF_LIA\]/ {
	STATE = 1
	FILE = $2
	ANS_FILE = get_answer_file (FILE)
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








