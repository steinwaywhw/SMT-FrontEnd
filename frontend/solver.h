#ifndef _SOLVER_H
#define _SOLVER_H

#include "config.h"
#include <unistd.h>
#include <sys/types.h>

typedef struct {
	int result;
	pid_t pid;
	char path[MAX_PATH];
	char options[MAX_OPTIONS][MAX_SINGLE_OPTION];
	int pipefds[2];
	char buffer[MAX_BUFFER];
} solver_t;


void terminate(solver_t *solver);
void solve(solver_t *solver, char file[MAX_PATH]);
solver_t* get_solver(char path[MAX_PATH], char options[MAX_OPTIONS][MAX_SINGLE_OPTION]);

int get_result(solver_t *solver);
void dump(solver_t *solver);

#endif
