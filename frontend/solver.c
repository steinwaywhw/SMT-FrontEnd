#include "solver.h"
#include <malloc.h>
#include <string.h>
#include <sys/wait.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <assert.h>



void debug(char *msg) {
	#ifdef _DEBUG
	printf("%s\n", msg);
	#endif

	return;
}

solver_t* get_solver(char path[MAX_PATH], char options[MAX_OPTIONS][MAX_SINGLE_OPTION]) {
	solver_t *solver = (solver_t *)malloc(sizeof(solver_t));
	assert(solver != NULL);

	memset(solver, 0, sizeof(solver_t));
	strcpy(solver->path, path);

	int i;
	for (i = 0; i < MAX_OPTIONS; i++)
		if (options[i] != NULL)
			strcpy(solver->options[i], options[i]);

	return solver;
}



void do_child(solver_t *solver, char file[MAX_PATH]) {
	
	//read-end is not used in child
	int rc = close(solver->pipefds[0]);
	assert (rc == 0);

	//redirect stdout(1) to the write-end pipefds[1]
	rc = dup2(solver->pipefds[1], fileno(stdout));
	assert(rc != -1);

	//add the filename into options
	int i;
	char *ops[MAX_OPTIONS];
	memset (ops, 0, sizeof(char *) * MAX_OPTIONS);

	for (i = 0; i < MAX_OPTIONS; i++) {
		ops[i] = solver->options[i];
		if (strcmp(solver->options[i],"") == 0) { 
			ops[i] = file;
			break;
		}
	}

	assert(i < MAX_OPTIONS);

	rc = execvp(solver->path, ops);
	assert(rc != -1);
}

void do_parent(solver_t *solver) {
	
	//write-end is not used in parent
	int rc = close(solver->pipefds[1]);
}

void terminate(solver_t *solver) {
	kill(solver->pid, SIGTERM);
	//free(solver);
}

void solve(solver_t *solver, char file[MAX_PATH]) {
	
	// pipefds[0] for read, pipefds[1] for write
	int rc = pipe(solver->pipefds);
	assert(rc == 0);

	pid_t pid = fork();
	assert (pid >= 0);

	if (pid == 0) {
		do_child (solver, file);
	} else {
		solver->pid = pid;
		do_parent (solver);
	}
}


int get_result(solver_t *solver) {

	int rc = read(solver->pipefds[0], solver->buffer, MAX_BUFFER);
	assert(rc != -1);

	if (strstr(solver->buffer, "unknown") == solver->buffer)
		return UNKNOWN;

	if (strstr(solver->buffer, "unsat") == solver->buffer)
		return UNSAT;

	if (strstr(solver->buffer, "sat") == solver->buffer)
		return SAT;

	return ERROR;
}

void dump(solver_t *solver) {

	printf("%s", solver->buffer);
}