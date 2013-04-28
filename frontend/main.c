#include "frontend.h"
#include "solver.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>



int main(int argc, char *argv[]) {

	if (argc != 2) {
		printf("Usage: sfe <somescript.smt2>\n");
		exit(0);
	}

	frontend_t *fe = get_frontend();
	timeout(fe, 5);

	char options[MAX_OPTIONS][MAX_SINGLE_OPTION];

	memset(options, 0, sizeof(options));
	strcpy(options[0], "cvc4");
	strcpy(options[1], "--incremental");
	add_solver(fe, "cvc4", options);

	memset(options, 0, sizeof(options));
	strcpy(options[0], "alt-ergo.opt");
	add_solver(fe, "alt-ergo.opt", options);



	int result = solve_all(fe, argv[1]);

	if (fe->winner >= 0)
		printf("[%s] ", fe->solvers[fe->winner]->path);

	print_result(result);
	terminate_all(fe);
	//dump_all(fe);

	int i;
	for (i = 0; i < fe->count; i++) {
		free(fe->solvers[i]);
	}
	free(fe);
}