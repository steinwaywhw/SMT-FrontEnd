#ifndef _FRONTEND_H
#define _FRONTEND_H

#include "config.h"
#include "solver.h"


typedef struct {
	int count;
	solver_t *solvers[MAX_SOLVERS];
	struct timeval timeout;
	int winner;
} frontend_t;


frontend_t *get_frontend();
void timeout(frontend_t *fe, int seconds);
void add_solver(frontend_t *fe, char *path, char options[MAX_OPTIONS][MAX_SINGLE_OPTION]);
int solve_all(frontend_t *fe, char *file);
void dump_all(frontend_t *fe);
void terminate_all(frontend_t *fe);
#endif