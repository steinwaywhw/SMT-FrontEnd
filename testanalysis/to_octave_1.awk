function to_sec (field) {
	time = field
	gsub (/[:\.]/, " ", time)
	split (time, array, " ")

	return array[1] * 60 + array[2] * 1 + array[3] / 100
}

{
	if ($3 == "both") {
		file1 = sprintf ("octave.both.%s.cvc4.m", $1)
		file2 = sprintf ("octave.both.%s.altergo.m", $1)
		print to_sec ($6) > file1
		print to_sec ($8) > file2
	}
}