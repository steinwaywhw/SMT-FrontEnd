	


/^QF_IDL unsat (cvc4|alt-ergo|both|none) (cvc4|alt-ergo|both|none) unsat/ {
	next
}

/^QF_IDL unsat (cvc4|alt-ergo|both|none) (cvc4|alt-ergo|both|none) (sat|error)/ {
	next
}

/^QF_IDL unsat (cvc4|alt-ergo|both|none) (cvc4|alt-ergo|both|none) timeout/ {
	next
}

/^QF_IDL unsat (cvc4|alt-ergo|both|none) (cvc4|alt-ergo|both|none) error/ {
	next
}

/^QF_IDL unsat/ {
	print $0
}