#include "types.h"
#include "user.h"

#define WNOHANG 	1

int main(int argc, char *argv[])
{
	
	int exitWait(void);
	int waitPid(void);
  int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
  
  if (atoi(argv[1]) == 1)
	exitWait();
  else if (atoi(argv[1]) == 2)
	waitPid();
  else if (atoi(argv[1]) == 3)
  PScheduler();
  else 
   printf(1, "\ntype \"%s 1\" to test exit and wait, \"%s 2\" to test waitpid\n", argv[0], argv[0]);
  
    // End of test
  exit(0);
  return 0;
}

/*int PScheduler(void){
  // use this part to test the priority scheduler. Assuming that the priorities range between range between 0 to 31
  // 0 is the highest priority and 31 is the lowest priority.
  int pid;
  int i,j,k;
  int priorityArr[] = {30, 15, 25, 0, 9};

  printf(1, "\n  Testing the priority scheduler and setPriority(int priority) system call:\n");
  printf(1, "\n  Assuming that the priorities range between range between 0 to 31\n");
  printf(1, "\n  0 is the highest priority. All processes have a default priority of 10\n");
  printf(1, "\n  The parent processes will switch to priority 0\n");
  setPrior(0);

  for(i = 0; i < 5; i++) {
      pid = fork();
      if (pid > 0 ) {
          continue;
      } else if ( pid == 0) {
          setPrior(priorityArr[i]);
          printf(1, "\n child# %d has priority %d before starting its work", getpid(), getPrior());
          for (j=0;j<50000;j++) {
              for(k=0;k<1000;k++) {
                  asm("nop");
              }
          }
          printf(1, "\n child# %d has priority %d after finishing its work", getpid(), getPrior());
          printf(1, "\n child# %d with original priority %d has finished! \n", getpid(), priorityArr[i]);
          exit(0);
      } else {
          printf(2," \n Error \n");
      }
  }

  if(pid > 0) {
      for(i = 0; i < 5; i++) {
          wait(0);
      }
      printf(1,"\n if processes with highest priority finished first then its correct \n");
  }
  exit(0);
}*/

void work() {
  int i,k;
  for(i = 0; i < 43000; i++) {
    for(k = 0; k < 43000; k++) {
      asm("nop");
    }
  }
}

int PScheduler(void) {

  setPrior(0);
  int i = 0;
  int pid = 0;
  for(i = 0; i < 3; i++) {
    pid = fork();
    if(!pid) {
      setPrior(i * 10);
      work();
      printf(0, "child %d done\n", getpid());
      exit(0);
    }
  }
  if(pid) {
    for(i = 0; i < 3; i++)
      wait(0);
  }
  printf(0, "parent %d done\n", getpid());
  exit(0);
}
  
int exitWait(void) {
	  int pid, ret_pid, exit_status;
    int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
    pid = fork();
    if (pid == 0) { // only the child executed this code
      if (i == 0){
        printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
        exit(0);
      }
      else{
	      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
        exit(-1);
      } 
    } else if (pid > 0) { // only the parent executes this code
      ret_pid = wait(&exit_status);
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
    } else { // something went wrong with fork system call
	    printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}

int waitPid(void){
	
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();
		if (pid_a[i] == 0) { // only the child executed this code
			printf(1, "\n This is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
			exit(getpid() + 4);
		}
	}
  sleep(5);
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[3] + 4);
  sleep(5);
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
  ret_pid = waitpid(pid_a[1], &exit_status, 0);
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[1] + 4);
  sleep(5);
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
  ret_pid = waitpid(pid_a[2], &exit_status, 0);
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[2] + 4);
  sleep(5);
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
  ret_pid = waitpid(pid_a[0], &exit_status, 0);
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[0] + 4);
  sleep(5);
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
  ret_pid = waitpid(pid_a[4], &exit_status, 0);
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[4] + 4);


  printf(1, "\n This is the parent: Now try to wait for a invalid Number, this should not get stuck..\n");
  ret_pid = waitpid(9999, &exit_status, 0);
  printf(1, "\n This is the parent: Child# 9999 has ret code %d, expected: -1\n",ret_pid);
  //printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);

  printf(1, "\n This is the parent: Now try to give invalid argument.\n");
  ret_pid = waitpid(9999, (int*) 0xffffffff, 0);
  printf(1, "\n This is the parent: Got ret code %d, expected: -1\n",ret_pid);

  return 0;
}