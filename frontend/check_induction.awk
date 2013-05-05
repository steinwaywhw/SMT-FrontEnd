function get_content (field) {
	return substr(field, 2, length(field) - 2)
}

function to_sec (field) {
	if (field == "-1")
		return -1

	time = field
	gsub (/[:\.]/, " ", time)
	split (time, array, " ")

	sec = array[1] * 60 + array[2] * 1
	return  sec "." array[3]
}

function get_time (row, type) {
	if (match (row, /TIMEOUT/) > 0)
		return "0:15.00"

	if (match (row, /User\[.+\] Sys\[.+\] Real\[.+\]/) > 0) {
		ret = row
		gsub (/(^.*User\[|Sys\[|Real\[|\])/, " ", ret)
		split (ret, array, " ")
		return array[type]
	} else {
		return "0:15.00"
	}
}

function reset () {
	FILE = ""
	ANS_FILE = ""

	CVC_RESULT = 0
	CVC_TIME = ""
	ALTERGO_RESULT = 0
	ALTERGO_TIME = ""

	ANSWER = ""
}

function output () {
	printf "QF_LIA %s %d %.2f %d %.2f %s\n", LOGIC, CVC_RESULT, CVC_TIME, ALTERGO_RESULT, ALTERGO_TIME, FILE
}

function get_answer_file (file) {
	ans = file
	gsub (/system_c/, "system_c/answer", ans)
	gsub (/lustre/, "lustre/answer", ans)
	return ans ".bz2.results.txt"
}

function extract_answer (row) {
	ans = row
	gsub (/\(sat\)|\[(alt\-ergo|OK|cvc|TIMEOUT|ERROR)\]|User\[.+\]/, "", ans)

	return ans
}

function remove_extra (altergo) {
	split (altergo, arr, " ")

	count = 1
	pivot = 0
	all = 0

	i = 1
	while (i in arr) {
		all++
		pivot++
		if (count == pivot) {
			result[count] = arr[i]
			count++
			pivot = 0
		}
		i++
	}

	string = ""
	for (i = 1; i < count; i++)
        string = string " " result[i]

	return string
}

function load_file (file) {
	count = 0
	while ((getline expected < file) > 0) {
		count++
		result[count] = expected
	}

	string = ""
	for (i = 1; i <=count; i++)
		string = string " " result[i]

	return string
}

function check_answer (ans, file) {
	split (ans, arr, " ")
	split (file, arr_2, " ")
	count = 0
	i = 1
	while (i in arr) {
		if (arr[i] == arr_2[i])
			count++

#		print arr[i] " " arr_2[i]
		i++
	}

	return count
}


BEGIN {
	STATE = 0
	COUNTER = 0
	reset ()
}

/^\[QF_LIA\]/ {
	STATE = 1
	FILE = $2
	ANS_FILE = get_answer_file (FILE)
	COUNTER = COUNTER + 1
	ANSWER = load_file (ANS_FILE)
	
}

/\[cvc\]/ {

	if (STATE == 1) {
		STATE = 2
		CVC_RESULT = check_answer (extract_answer ($0), ANSWER)
		CVC_TIME = to_sec (get_time ($0, 3))
	}
}

/\[alt\-ergo\]/ {
	if (STATE == 2) {
		STATE = 3

		ALTERGO_RESULT = check_answer (remove_extra (extract_answer ($0)), ANSWER)
		ALTERGO_TIME = to_sec (get_time ($0, 3))
	} 
}

{
	if (STATE == 3) {
		STATE = 0
		output ()
		reset ()
	}
}








