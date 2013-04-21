#include <stdio.h>
#include <fcntl.h>  
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>


int main(int argc, char* argv[]) {


	int pid = fork();

	if (pid == 0) {
		execlp("cvc4", "", "/home/hwwu/SMT/smtlib-20130327/QF_UF/SEQ/SEQ004_size5.smt2", NULL);
	} else {
		wait(NULL);
		printf("Wait finished\n");
	}
}