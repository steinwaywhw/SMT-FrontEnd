#include "frontend.h"
#include "solver.h"
#include <malloc.h>
#include <string.h>
#include <assert.h>

frontend_t *get_frontend() {
	frontend_t *fe = (frontend_t *)malloc(sizeof(frontend_t));
	assert(fe != NULL);

	memset(fe, 0, sizeof(frontend_t));

	fe->winner = -1;
	fe->timeout.tv_sec = NO_TIMEOUT;

	return fe;
}

void timeout(frontend_t *fe, int seconds) {
	fe->timeout.tv_sec = seconds;
}

void add_solver(frontend_t *fe, char *path, char options[MAX_OPTIONS][MAX_SINGLE_OPTION]) {
	solver_t *solver = get_solver(path, options);
	assert(fe->count < MAX_SOLVERS);
	fe->solvers[fe->count++] = solver;
}

void print_result(int result) {
	switch (result) {
	case TIMEOUT: printf("timeout\n"); break;
	case SAT: printf("sat\n"); break;
	case UNSAT:	printf("unsat\n"); break;
	case UNKNOWN: printf("unknown\n"); break;
	default: printf("error\n"); break;
	}
}

int solve_all(frontend_t *fe, char *file) {

	int i;
	for (i = 0; i < fe->count; i++) {
		solve(fe->solvers[i], file);
	}

	int wait = 1;
	fd_set fds;
	int max_fd = 0;

	while (wait) {
		//reset fd set
		FD_ZERO(&fds);

		//update max_fd and add all fds
		for (i = 0; i < fe->count; i++) {
			int fd = fe->solvers[i]->pipefds[0];
			max_fd = max_fd > fd ? max_fd : fd;
			FD_SET(fd, &fds);
		}

		//select
		int rc = select(max_fd + 1, &fds, NULL, NULL, &(fe->timeout));
		if (rc == 0) {
			//printf("Timeout.\n");
			break;
		}

		assert(rc != -1);

		//someone responsed
		for (i = 0; i < fe->count; i++) {
			int fd = fe->solvers[i]->pipefds[0];
			
			//if this solver returns
			if (FD_ISSET(fd, &fds)) {

				int result = get_result(fe->solvers[i]);

				// if we get a good result, prepare to exit loop
				if (result > UNKNOWN) {
					fe->winner = i;
					wait = 0;
					break;
				}
			}
		}		
	}

	if (fe->winner >= 0) {
		solver_t *winner = fe->solvers[fe->winner];
		int result = get_result(winner);
		return result;
	} else {
		return TIMEOUT;	
	}
}

void terminate_all(frontend_t *fe) {
	int i;
	for (i = 0; i < fe->count; i++) {
		terminate(fe->solvers[i]);
	}
}


void dump_all(frontend_t *fe) {
	int i;
	for (i = 0; i < fe->count; i++) {
		solver_t *solver = fe->solvers[i];
		printf("[%s]\n", solver->path);
		print_result(get_result(solver));
		dump(solver);
	}
}