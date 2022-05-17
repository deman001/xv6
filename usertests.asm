
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"

#define WNOHANG 	1

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
   a:	8b 5d 0c             	mov    0xc(%ebp),%ebx
	
	int exitWait(void);
	int waitPid(void);
  int PScheduler(void);

  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 f8 0f 00 	movl   $0xff8,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 0f 09 00 00       	call   930 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 44 07 00 00       	call   770 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 4a                	je     7b <main+0x7b>
	exitWait();
  else if (atoi(argv[1]) == 2)
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 34 07 00 00       	call   770 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 41                	je     82 <main+0x82>
	waitPid();
  else if (atoi(argv[1]) == 3)
  41:	8b 43 04             	mov    0x4(%ebx),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 24 07 00 00       	call   770 <atoi>
  4c:	83 f8 03             	cmp    $0x3,%eax
  4f:	74 38                	je     89 <main+0x89>
  PScheduler();
  else 
   printf(1, "\ntype \"%s 1\" to test exit and wait, \"%s 2\" to test waitpid\n", argv[0], argv[0]);
  51:	8b 03                	mov    (%ebx),%eax
  53:	c7 44 24 04 2c 10 00 	movl   $0x102c,0x4(%esp)
  5a:	00 
  5b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  62:	89 44 24 0c          	mov    %eax,0xc(%esp)
  66:	89 44 24 08          	mov    %eax,0x8(%esp)
  6a:	e8 c1 08 00 00       	call   930 <printf>
  
    // End of test
  exit(0);
  6f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  76:	e8 57 07 00 00       	call   7d2 <exit>
	exitWait();
  7b:	e8 10 01 00 00       	call   190 <exitWait>
  80:	eb ed                	jmp    6f <main+0x6f>
	waitPid();
  82:	e8 09 02 00 00       	call   290 <waitPid>
  87:	eb e6                	jmp    6f <main+0x6f>
  89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  PScheduler();
  90:	e8 2b 00 00 00       	call   c0 <PScheduler>
  95:	66 90                	xchg   %ax,%ax
  97:	66 90                	xchg   %ax,%ax
  99:	66 90                	xchg   %ax,%ax
  9b:	66 90                	xchg   %ax,%ax
  9d:	66 90                	xchg   %ax,%ax
  9f:	90                   	nop

000000a0 <work>:
      printf(1,"\n if processes with highest priority finished first then its correct \n");
  }
  exit(0);
}*/

void work() {
  a0:	55                   	push   %ebp
  a1:	ba f8 a7 00 00       	mov    $0xa7f8,%edx
  a6:	89 e5                	mov    %esp,%ebp
  a8:	b8 f8 a7 00 00       	mov    $0xa7f8,%eax
  ad:	8d 76 00             	lea    0x0(%esi),%esi
  int i,k;
  for(i = 0; i < 43000; i++) {
    for(k = 0; k < 43000; k++) {
      asm("nop");
  b0:	90                   	nop
    for(k = 0; k < 43000; k++) {
  b1:	83 e8 01             	sub    $0x1,%eax
  b4:	75 fa                	jne    b0 <work+0x10>
  for(i = 0; i < 43000; i++) {
  b6:	83 ea 01             	sub    $0x1,%edx
  b9:	75 ed                	jne    a8 <work+0x8>
    }
  }
}
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    
  bd:	8d 76 00             	lea    0x0(%esi),%esi

000000c0 <PScheduler>:

int PScheduler(void) {
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	53                   	push   %ebx

  setPrior(0);
  int i = 0;
  int pid = 0;
  for(i = 0; i < 3; i++) {
  c4:	31 db                	xor    %ebx,%ebx
int PScheduler(void) {
  c6:	83 ec 14             	sub    $0x14,%esp
  setPrior(0);
  c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  d0:	e8 a5 07 00 00       	call   87a <setPrior>
    pid = fork();
  d5:	e8 f0 06 00 00       	call   7ca <fork>
    if(!pid) {
  da:	85 c0                	test   %eax,%eax
  dc:	74 55                	je     133 <PScheduler+0x73>
  for(i = 0; i < 3; i++) {
  de:	83 c3 01             	add    $0x1,%ebx
  e1:	83 fb 03             	cmp    $0x3,%ebx
  e4:	75 ef                	jne    d5 <PScheduler+0x15>
      exit(0);
    }
  }
  if(pid) {
    for(i = 0; i < 3; i++)
      wait(0);
  e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  ed:	e8 e8 06 00 00       	call   7da <wait>
  f2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  f9:	e8 dc 06 00 00       	call   7da <wait>
  fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 105:	e8 d0 06 00 00       	call   7da <wait>
  }
  printf(0, "parent %d done\n", getpid());
 10a:	e8 43 07 00 00       	call   852 <getpid>
 10f:	c7 44 24 04 a7 0c 00 	movl   $0xca7,0x4(%esp)
 116:	00 
 117:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 11e:	89 44 24 08          	mov    %eax,0x8(%esp)
 122:	e8 09 08 00 00       	call   930 <printf>
  exit(0);
 127:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 12e:	e8 9f 06 00 00       	call   7d2 <exit>
      setPrior(i * 10);
 133:	6b db 0a             	imul   $0xa,%ebx,%ebx
 136:	89 1c 24             	mov    %ebx,(%esp)
 139:	e8 3c 07 00 00       	call   87a <setPrior>
 13e:	ba f8 a7 00 00       	mov    $0xa7f8,%edx
 143:	90                   	nop
 144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 3; i++) {
 148:	b8 f8 a7 00 00       	mov    $0xa7f8,%eax
 14d:	8d 76 00             	lea    0x0(%esi),%esi
      asm("nop");
 150:	90                   	nop
    for(k = 0; k < 43000; k++) {
 151:	83 e8 01             	sub    $0x1,%eax
 154:	75 fa                	jne    150 <PScheduler+0x90>
  for(i = 0; i < 43000; i++) {
 156:	83 ea 01             	sub    $0x1,%edx
 159:	75 ed                	jne    148 <PScheduler+0x88>
      printf(0, "child %d done\n", getpid());
 15b:	e8 f2 06 00 00       	call   852 <getpid>
 160:	c7 44 24 04 98 0c 00 	movl   $0xc98,0x4(%esp)
 167:	00 
 168:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16f:	89 44 24 08          	mov    %eax,0x8(%esp)
 173:	e8 b8 07 00 00       	call   930 <printf>
      exit(0);
 178:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 17f:	e8 4e 06 00 00       	call   7d2 <exit>
 184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 18a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000190 <exitWait>:
}
  
int exitWait(void) {
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
    int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
 195:	31 db                	xor    %ebx,%ebx
int exitWait(void) {
 197:	83 ec 20             	sub    $0x20,%esp
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
 19a:	c7 44 24 04 cc 0c 00 	movl   $0xccc,0x4(%esp)
 1a1:	00 
      else{
	      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
        exit(-1);
      } 
    } else if (pid > 0) { // only the parent executes this code
      ret_pid = wait(&exit_status);
 1a2:	8d 75 f4             	lea    -0xc(%ebp),%esi
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
 1a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ac:	e8 7f 07 00 00       	call   930 <printf>
    pid = fork();
 1b1:	e8 14 06 00 00       	call   7ca <fork>
    if (pid == 0) { // only the child executed this code
 1b6:	83 f8 00             	cmp    $0x0,%eax
 1b9:	74 45                	je     200 <exitWait+0x70>
 1bb:	90                   	nop
 1bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if (pid > 0) { // only the parent executes this code
 1c0:	0f 8e a3 00 00 00    	jle    269 <exitWait+0xd9>
      ret_pid = wait(&exit_status);
 1c6:	89 34 24             	mov    %esi,(%esp)
  for (i = 0; i < 2; i++) {
 1c9:	83 c3 01             	add    $0x1,%ebx
      ret_pid = wait(&exit_status);
 1cc:	e8 09 06 00 00       	call   7da <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
 1d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1d4:	c7 44 24 04 4c 0d 00 	movl   $0xd4c,0x4(%esp)
 1db:	00 
 1dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1e3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 1e7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1eb:	e8 40 07 00 00       	call   930 <printf>
  for (i = 0; i < 2; i++) {
 1f0:	83 fb 02             	cmp    $0x2,%ebx
 1f3:	75 bc                	jne    1b1 <exitWait+0x21>
	    printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
 1f5:	83 c4 20             	add    $0x20,%esp
 1f8:	31 c0                	xor    %eax,%eax
 1fa:	5b                   	pop    %ebx
 1fb:	5e                   	pop    %esi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    
 1fe:	66 90                	xchg   %ax,%ax
      if (i == 0){
 200:	85 db                	test   %ebx,%ebx
 202:	75 34                	jne    238 <exitWait+0xa8>
        printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
 204:	e8 49 06 00 00       	call   852 <getpid>
 209:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 210:	00 
 211:	c7 44 24 04 10 0d 00 	movl   $0xd10,0x4(%esp)
 218:	00 
 219:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 220:	89 44 24 08          	mov    %eax,0x8(%esp)
 224:	e8 07 07 00 00       	call   930 <printf>
        exit(0);
 229:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 230:	e8 9d 05 00 00       	call   7d2 <exit>
 235:	8d 76 00             	lea    0x0(%esi),%esi
	      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 238:	e8 15 06 00 00       	call   852 <getpid>
 23d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 244:	ff 
 245:	c7 44 24 04 10 0d 00 	movl   $0xd10,0x4(%esp)
 24c:	00 
 24d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 254:	89 44 24 08          	mov    %eax,0x8(%esp)
 258:	e8 d3 06 00 00       	call   930 <printf>
        exit(-1);
 25d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 264:	e8 69 05 00 00       	call   7d2 <exit>
	    printf(2, "\nError using fork\n");
 269:	c7 44 24 04 b7 0c 00 	movl   $0xcb7,0x4(%esp)
 270:	00 
 271:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 278:	e8 b3 06 00 00       	call   930 <printf>
      exit(-1);
 27d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 284:	e8 49 05 00 00       	call   7d2 <exit>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <waitPid>:

int waitPid(void){
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
 295:	83 ec 40             	sub    $0x40,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 298:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 29f:	00 
 2a0:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 2a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2aa:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int pid_a[5]={0, 0, 0, 0, 0};
 2ad:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 2b4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 2bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 2c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 2c9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 2d0:	e8 5b 06 00 00       	call   930 <printf>

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();
 2d5:	e8 f0 04 00 00       	call   7ca <fork>
		if (pid_a[i] == 0) { // only the child executed this code
 2da:	85 c0                	test   %eax,%eax
		pid_a[i] = fork();
 2dc:	89 03                	mov    %eax,(%ebx)
		if (pid_a[i] == 0) { // only the child executed this code
 2de:	0f 84 84 02 00 00    	je     568 <waitPid+0x2d8>
 2e4:	83 c3 04             	add    $0x4,%ebx
	for (i = 0; i <5; i++) {
 2e7:	39 f3                	cmp    %esi,%ebx
 2e9:	75 ea                	jne    2d5 <waitPid+0x45>
			printf(1, "\n This is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
			exit(getpid() + 4);
		}
	}
  sleep(5);
 2eb:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 2f2:	8d 5d e0             	lea    -0x20(%ebp),%ebx
  sleep(5);
 2f5:	e8 68 05 00 00       	call   862 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 2fa:	8b 75 f0             	mov    -0x10(%ebp),%esi
 2fd:	c7 44 24 04 10 0e 00 	movl   $0xe10,0x4(%esp)
 304:	00 
 305:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 30c:	89 74 24 08          	mov    %esi,0x8(%esp)
 310:	e8 1b 06 00 00       	call   930 <printf>
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 315:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 319:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[3] + 4);
 31c:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 31f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 326:	00 
 327:	e8 46 05 00 00       	call   872 <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[3] + 4);
 32c:	8b 55 e0             	mov    -0x20(%ebp),%edx
 32f:	89 74 24 10          	mov    %esi,0x10(%esp)
 333:	c7 44 24 04 4c 0e 00 	movl   $0xe4c,0x4(%esp)
 33a:	00 
 33b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 342:	89 54 24 0c          	mov    %edx,0xc(%esp)
 346:	89 44 24 08          	mov    %eax,0x8(%esp)
 34a:	e8 e1 05 00 00       	call   930 <printf>
  sleep(5);
 34f:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 356:	e8 07 05 00 00       	call   862 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 35b:	8b 75 e8             	mov    -0x18(%ebp),%esi
 35e:	c7 44 24 04 10 0e 00 	movl   $0xe10,0x4(%esp)
 365:	00 
 366:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36d:	89 74 24 08          	mov    %esi,0x8(%esp)
 371:	e8 ba 05 00 00       	call   930 <printf>
  ret_pid = waitpid(pid_a[1], &exit_status, 0);
 376:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 37a:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[1] + 4);
 37d:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[1], &exit_status, 0);
 380:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 387:	00 
 388:	e8 e5 04 00 00       	call   872 <waitpid>
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[1] + 4);
 38d:	8b 55 e0             	mov    -0x20(%ebp),%edx
 390:	89 74 24 10          	mov    %esi,0x10(%esp)
 394:	c7 44 24 04 98 0e 00 	movl   $0xe98,0x4(%esp)
 39b:	00 
 39c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3a3:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3a7:	89 44 24 08          	mov    %eax,0x8(%esp)
 3ab:	e8 80 05 00 00       	call   930 <printf>
  sleep(5);
 3b0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 3b7:	e8 a6 04 00 00       	call   862 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 3bc:	8b 75 ec             	mov    -0x14(%ebp),%esi
 3bf:	c7 44 24 04 10 0e 00 	movl   $0xe10,0x4(%esp)
 3c6:	00 
 3c7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3ce:	89 74 24 08          	mov    %esi,0x8(%esp)
 3d2:	e8 59 05 00 00       	call   930 <printf>
  ret_pid = waitpid(pid_a[2], &exit_status, 0);
 3d7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3db:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[2] + 4);
 3de:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[2], &exit_status, 0);
 3e1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 3e8:	00 
 3e9:	e8 84 04 00 00       	call   872 <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[2] + 4);
 3ee:	8b 55 e0             	mov    -0x20(%ebp),%edx
 3f1:	89 74 24 10          	mov    %esi,0x10(%esp)
 3f5:	c7 44 24 04 4c 0e 00 	movl   $0xe4c,0x4(%esp)
 3fc:	00 
 3fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 404:	89 54 24 0c          	mov    %edx,0xc(%esp)
 408:	89 44 24 08          	mov    %eax,0x8(%esp)
 40c:	e8 1f 05 00 00       	call   930 <printf>
  sleep(5);
 411:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 418:	e8 45 04 00 00       	call   862 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 41d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 420:	c7 44 24 04 10 0e 00 	movl   $0xe10,0x4(%esp)
 427:	00 
 428:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 42f:	89 74 24 08          	mov    %esi,0x8(%esp)
 433:	e8 f8 04 00 00       	call   930 <printf>
  ret_pid = waitpid(pid_a[0], &exit_status, 0);
 438:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 43c:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[0] + 4);
 43f:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[0], &exit_status, 0);
 442:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 449:	00 
 44a:	e8 23 04 00 00       	call   872 <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[0] + 4);
 44f:	8b 55 e0             	mov    -0x20(%ebp),%edx
 452:	89 74 24 10          	mov    %esi,0x10(%esp)
 456:	c7 44 24 04 4c 0e 00 	movl   $0xe4c,0x4(%esp)
 45d:	00 
 45e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 465:	89 54 24 0c          	mov    %edx,0xc(%esp)
 469:	89 44 24 08          	mov    %eax,0x8(%esp)
 46d:	e8 be 04 00 00       	call   930 <printf>
  sleep(5);
 472:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 479:	e8 e4 03 00 00       	call   862 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 47e:	8b 75 f4             	mov    -0xc(%ebp),%esi
 481:	c7 44 24 04 10 0e 00 	movl   $0xe10,0x4(%esp)
 488:	00 
 489:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 490:	89 74 24 08          	mov    %esi,0x8(%esp)
 494:	e8 97 04 00 00       	call   930 <printf>
  ret_pid = waitpid(pid_a[4], &exit_status, 0);
 499:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 49d:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[4] + 4);
 4a0:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[4], &exit_status, 0);
 4a3:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 4aa:	00 
 4ab:	e8 c2 03 00 00       	call   872 <waitpid>
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[4] + 4);
 4b0:	8b 55 e0             	mov    -0x20(%ebp),%edx
 4b3:	89 74 24 10          	mov    %esi,0x10(%esp)
 4b7:	c7 44 24 04 98 0e 00 	movl   $0xe98,0x4(%esp)
 4be:	00 
 4bf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4c6:	89 54 24 0c          	mov    %edx,0xc(%esp)
 4ca:	89 44 24 08          	mov    %eax,0x8(%esp)
 4ce:	e8 5d 04 00 00       	call   930 <printf>


  printf(1, "\n This is the parent: Now try to wait for a invalid Number, this should not get stuck..\n");
 4d3:	c7 44 24 04 e4 0e 00 	movl   $0xee4,0x4(%esp)
 4da:	00 
 4db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 4e2:	e8 49 04 00 00       	call   930 <printf>
  ret_pid = waitpid(9999, &exit_status, 0);
 4e7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 4eb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 4f2:	00 
 4f3:	c7 04 24 0f 27 00 00 	movl   $0x270f,(%esp)
 4fa:	e8 73 03 00 00       	call   872 <waitpid>
  printf(1, "\n This is the parent: Child# 9999 has ret code %d, expected: -1\n",ret_pid);
 4ff:	c7 44 24 04 40 0f 00 	movl   $0xf40,0x4(%esp)
 506:	00 
 507:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 50e:	89 44 24 08          	mov    %eax,0x8(%esp)
 512:	e8 19 04 00 00       	call   930 <printf>
  //printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);

  printf(1, "\n This is the parent: Now try to give invalid argument.\n");
 517:	c7 44 24 04 84 0f 00 	movl   $0xf84,0x4(%esp)
 51e:	00 
 51f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 526:	e8 05 04 00 00       	call   930 <printf>
  ret_pid = waitpid(9999, (int*) 0xffffffff, 0);
 52b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 532:	00 
 533:	c7 44 24 04 ff ff ff 	movl   $0xffffffff,0x4(%esp)
 53a:	ff 
 53b:	c7 04 24 0f 27 00 00 	movl   $0x270f,(%esp)
 542:	e8 2b 03 00 00       	call   872 <waitpid>
  printf(1, "\n This is the parent: Got ret code %d, expected: -1\n",ret_pid);
 547:	c7 44 24 04 c0 0f 00 	movl   $0xfc0,0x4(%esp)
 54e:	00 
 54f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 556:	89 44 24 08          	mov    %eax,0x8(%esp)
 55a:	e8 d1 03 00 00       	call   930 <printf>

  return 0;
 55f:	83 c4 40             	add    $0x40,%esp
 562:	31 c0                	xor    %eax,%eax
 564:	5b                   	pop    %ebx
 565:	5e                   	pop    %esi
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    
			printf(1, "\n This is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
 568:	e8 e5 02 00 00       	call   852 <getpid>
 56d:	89 c3                	mov    %eax,%ebx
 56f:	e8 de 02 00 00       	call   852 <getpid>
 574:	83 c3 04             	add    $0x4,%ebx
 577:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 57b:	c7 44 24 04 d0 0d 00 	movl   $0xdd0,0x4(%esp)
 582:	00 
 583:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 58a:	89 44 24 08          	mov    %eax,0x8(%esp)
 58e:	e8 9d 03 00 00       	call   930 <printf>
			exit(getpid() + 4);
 593:	e8 ba 02 00 00       	call   852 <getpid>
 598:	83 c0 04             	add    $0x4,%eax
 59b:	89 04 24             	mov    %eax,(%esp)
 59e:	e8 2f 02 00 00       	call   7d2 <exit>
 5a3:	66 90                	xchg   %ax,%ax
 5a5:	66 90                	xchg   %ax,%ax
 5a7:	66 90                	xchg   %ax,%ax
 5a9:	66 90                	xchg   %ax,%ax
 5ab:	66 90                	xchg   %ax,%ax
 5ad:	66 90                	xchg   %ax,%ax
 5af:	90                   	nop

000005b0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 5b9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 5ba:	89 c2                	mov    %eax,%edx
 5bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5c0:	83 c1 01             	add    $0x1,%ecx
 5c3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 5c7:	83 c2 01             	add    $0x1,%edx
 5ca:	84 db                	test   %bl,%bl
 5cc:	88 5a ff             	mov    %bl,-0x1(%edx)
 5cf:	75 ef                	jne    5c0 <strcpy+0x10>
    ;
  return os;
}
 5d1:	5b                   	pop    %ebx
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000005e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	8b 55 08             	mov    0x8(%ebp),%edx
 5e6:	53                   	push   %ebx
 5e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 5ea:	0f b6 02             	movzbl (%edx),%eax
 5ed:	84 c0                	test   %al,%al
 5ef:	74 2d                	je     61e <strcmp+0x3e>
 5f1:	0f b6 19             	movzbl (%ecx),%ebx
 5f4:	38 d8                	cmp    %bl,%al
 5f6:	74 0e                	je     606 <strcmp+0x26>
 5f8:	eb 2b                	jmp    625 <strcmp+0x45>
 5fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 600:	38 c8                	cmp    %cl,%al
 602:	75 15                	jne    619 <strcmp+0x39>
    p++, q++;
 604:	89 d9                	mov    %ebx,%ecx
 606:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 609:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 60c:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 60f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 613:	84 c0                	test   %al,%al
 615:	75 e9                	jne    600 <strcmp+0x20>
 617:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 619:	29 c8                	sub    %ecx,%eax
}
 61b:	5b                   	pop    %ebx
 61c:	5d                   	pop    %ebp
 61d:	c3                   	ret    
 61e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 621:	31 c0                	xor    %eax,%eax
 623:	eb f4                	jmp    619 <strcmp+0x39>
 625:	0f b6 cb             	movzbl %bl,%ecx
 628:	eb ef                	jmp    619 <strcmp+0x39>
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000630 <strlen>:

uint
strlen(const char *s)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 636:	80 39 00             	cmpb   $0x0,(%ecx)
 639:	74 12                	je     64d <strlen+0x1d>
 63b:	31 d2                	xor    %edx,%edx
 63d:	8d 76 00             	lea    0x0(%esi),%esi
 640:	83 c2 01             	add    $0x1,%edx
 643:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 647:	89 d0                	mov    %edx,%eax
 649:	75 f5                	jne    640 <strlen+0x10>
    ;
  return n;
}
 64b:	5d                   	pop    %ebp
 64c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 64d:	31 c0                	xor    %eax,%eax
}
 64f:	5d                   	pop    %ebp
 650:	c3                   	ret    
 651:	eb 0d                	jmp    660 <memset>
 653:	90                   	nop
 654:	90                   	nop
 655:	90                   	nop
 656:	90                   	nop
 657:	90                   	nop
 658:	90                   	nop
 659:	90                   	nop
 65a:	90                   	nop
 65b:	90                   	nop
 65c:	90                   	nop
 65d:	90                   	nop
 65e:	90                   	nop
 65f:	90                   	nop

00000660 <memset>:

void*
memset(void *dst, int c, uint n)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	8b 55 08             	mov    0x8(%ebp),%edx
 666:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 667:	8b 4d 10             	mov    0x10(%ebp),%ecx
 66a:	8b 45 0c             	mov    0xc(%ebp),%eax
 66d:	89 d7                	mov    %edx,%edi
 66f:	fc                   	cld    
 670:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 672:	89 d0                	mov    %edx,%eax
 674:	5f                   	pop    %edi
 675:	5d                   	pop    %ebp
 676:	c3                   	ret    
 677:	89 f6                	mov    %esi,%esi
 679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000680 <strchr>:

char*
strchr(const char *s, char c)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	53                   	push   %ebx
 687:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 68a:	0f b6 18             	movzbl (%eax),%ebx
 68d:	84 db                	test   %bl,%bl
 68f:	74 1d                	je     6ae <strchr+0x2e>
    if(*s == c)
 691:	38 d3                	cmp    %dl,%bl
 693:	89 d1                	mov    %edx,%ecx
 695:	75 0d                	jne    6a4 <strchr+0x24>
 697:	eb 17                	jmp    6b0 <strchr+0x30>
 699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6a0:	38 ca                	cmp    %cl,%dl
 6a2:	74 0c                	je     6b0 <strchr+0x30>
  for(; *s; s++)
 6a4:	83 c0 01             	add    $0x1,%eax
 6a7:	0f b6 10             	movzbl (%eax),%edx
 6aa:	84 d2                	test   %dl,%dl
 6ac:	75 f2                	jne    6a0 <strchr+0x20>
      return (char*)s;
  return 0;
 6ae:	31 c0                	xor    %eax,%eax
}
 6b0:	5b                   	pop    %ebx
 6b1:	5d                   	pop    %ebp
 6b2:	c3                   	ret    
 6b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006c0 <gets>:

char*
gets(char *buf, int max)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 6c5:	31 f6                	xor    %esi,%esi
{
 6c7:	53                   	push   %ebx
 6c8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 6cb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 6ce:	eb 31                	jmp    701 <gets+0x41>
    cc = read(0, &c, 1);
 6d0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6d7:	00 
 6d8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 6dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 6e3:	e8 02 01 00 00       	call   7ea <read>
    if(cc < 1)
 6e8:	85 c0                	test   %eax,%eax
 6ea:	7e 1d                	jle    709 <gets+0x49>
      break;
    buf[i++] = c;
 6ec:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 6f0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 6f2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 6f5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 6f7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 6fb:	74 0c                	je     709 <gets+0x49>
 6fd:	3c 0a                	cmp    $0xa,%al
 6ff:	74 08                	je     709 <gets+0x49>
  for(i=0; i+1 < max; ){
 701:	8d 5e 01             	lea    0x1(%esi),%ebx
 704:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 707:	7c c7                	jl     6d0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 710:	83 c4 2c             	add    $0x2c,%esp
 713:	5b                   	pop    %ebx
 714:	5e                   	pop    %esi
 715:	5f                   	pop    %edi
 716:	5d                   	pop    %ebp
 717:	c3                   	ret    
 718:	90                   	nop
 719:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000720 <stat>:

int
stat(const char *n, struct stat *st)
{
 720:	55                   	push   %ebp
 721:	89 e5                	mov    %esp,%ebp
 723:	56                   	push   %esi
 724:	53                   	push   %ebx
 725:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 732:	00 
 733:	89 04 24             	mov    %eax,(%esp)
 736:	e8 d7 00 00 00       	call   812 <open>
  if(fd < 0)
 73b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 73d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 73f:	78 27                	js     768 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 741:	8b 45 0c             	mov    0xc(%ebp),%eax
 744:	89 1c 24             	mov    %ebx,(%esp)
 747:	89 44 24 04          	mov    %eax,0x4(%esp)
 74b:	e8 da 00 00 00       	call   82a <fstat>
  close(fd);
 750:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 753:	89 c6                	mov    %eax,%esi
  close(fd);
 755:	e8 a0 00 00 00       	call   7fa <close>
  return r;
 75a:	89 f0                	mov    %esi,%eax
}
 75c:	83 c4 10             	add    $0x10,%esp
 75f:	5b                   	pop    %ebx
 760:	5e                   	pop    %esi
 761:	5d                   	pop    %ebp
 762:	c3                   	ret    
 763:	90                   	nop
 764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 768:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 76d:	eb ed                	jmp    75c <stat+0x3c>
 76f:	90                   	nop

00000770 <atoi>:

int
atoi(const char *s)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	8b 4d 08             	mov    0x8(%ebp),%ecx
 776:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 777:	0f be 11             	movsbl (%ecx),%edx
 77a:	8d 42 d0             	lea    -0x30(%edx),%eax
 77d:	3c 09                	cmp    $0x9,%al
  n = 0;
 77f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 784:	77 17                	ja     79d <atoi+0x2d>
 786:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 788:	83 c1 01             	add    $0x1,%ecx
 78b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 78e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 792:	0f be 11             	movsbl (%ecx),%edx
 795:	8d 5a d0             	lea    -0x30(%edx),%ebx
 798:	80 fb 09             	cmp    $0x9,%bl
 79b:	76 eb                	jbe    788 <atoi+0x18>
  return n;
}
 79d:	5b                   	pop    %ebx
 79e:	5d                   	pop    %ebp
 79f:	c3                   	ret    

000007a0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 7a0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 7a1:	31 d2                	xor    %edx,%edx
{
 7a3:	89 e5                	mov    %esp,%ebp
 7a5:	56                   	push   %esi
 7a6:	8b 45 08             	mov    0x8(%ebp),%eax
 7a9:	53                   	push   %ebx
 7aa:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7ad:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 7b0:	85 db                	test   %ebx,%ebx
 7b2:	7e 12                	jle    7c6 <memmove+0x26>
 7b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 7b8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 7bc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 7bf:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 7c2:	39 da                	cmp    %ebx,%edx
 7c4:	75 f2                	jne    7b8 <memmove+0x18>
  return vdst;
}
 7c6:	5b                   	pop    %ebx
 7c7:	5e                   	pop    %esi
 7c8:	5d                   	pop    %ebp
 7c9:	c3                   	ret    

000007ca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 7ca:	b8 01 00 00 00       	mov    $0x1,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    

000007d2 <exit>:
SYSCALL(exit)
 7d2:	b8 02 00 00 00       	mov    $0x2,%eax
 7d7:	cd 40                	int    $0x40
 7d9:	c3                   	ret    

000007da <wait>:
SYSCALL(wait)
 7da:	b8 03 00 00 00       	mov    $0x3,%eax
 7df:	cd 40                	int    $0x40
 7e1:	c3                   	ret    

000007e2 <pipe>:
SYSCALL(pipe)
 7e2:	b8 04 00 00 00       	mov    $0x4,%eax
 7e7:	cd 40                	int    $0x40
 7e9:	c3                   	ret    

000007ea <read>:
SYSCALL(read)
 7ea:	b8 05 00 00 00       	mov    $0x5,%eax
 7ef:	cd 40                	int    $0x40
 7f1:	c3                   	ret    

000007f2 <write>:
SYSCALL(write)
 7f2:	b8 10 00 00 00       	mov    $0x10,%eax
 7f7:	cd 40                	int    $0x40
 7f9:	c3                   	ret    

000007fa <close>:
SYSCALL(close)
 7fa:	b8 15 00 00 00       	mov    $0x15,%eax
 7ff:	cd 40                	int    $0x40
 801:	c3                   	ret    

00000802 <kill>:
SYSCALL(kill)
 802:	b8 06 00 00 00       	mov    $0x6,%eax
 807:	cd 40                	int    $0x40
 809:	c3                   	ret    

0000080a <exec>:
SYSCALL(exec)
 80a:	b8 07 00 00 00       	mov    $0x7,%eax
 80f:	cd 40                	int    $0x40
 811:	c3                   	ret    

00000812 <open>:
SYSCALL(open)
 812:	b8 0f 00 00 00       	mov    $0xf,%eax
 817:	cd 40                	int    $0x40
 819:	c3                   	ret    

0000081a <mknod>:
SYSCALL(mknod)
 81a:	b8 11 00 00 00       	mov    $0x11,%eax
 81f:	cd 40                	int    $0x40
 821:	c3                   	ret    

00000822 <unlink>:
SYSCALL(unlink)
 822:	b8 12 00 00 00       	mov    $0x12,%eax
 827:	cd 40                	int    $0x40
 829:	c3                   	ret    

0000082a <fstat>:
SYSCALL(fstat)
 82a:	b8 08 00 00 00       	mov    $0x8,%eax
 82f:	cd 40                	int    $0x40
 831:	c3                   	ret    

00000832 <link>:
SYSCALL(link)
 832:	b8 13 00 00 00       	mov    $0x13,%eax
 837:	cd 40                	int    $0x40
 839:	c3                   	ret    

0000083a <mkdir>:
SYSCALL(mkdir)
 83a:	b8 14 00 00 00       	mov    $0x14,%eax
 83f:	cd 40                	int    $0x40
 841:	c3                   	ret    

00000842 <chdir>:
SYSCALL(chdir)
 842:	b8 09 00 00 00       	mov    $0x9,%eax
 847:	cd 40                	int    $0x40
 849:	c3                   	ret    

0000084a <dup>:
SYSCALL(dup)
 84a:	b8 0a 00 00 00       	mov    $0xa,%eax
 84f:	cd 40                	int    $0x40
 851:	c3                   	ret    

00000852 <getpid>:
SYSCALL(getpid)
 852:	b8 0b 00 00 00       	mov    $0xb,%eax
 857:	cd 40                	int    $0x40
 859:	c3                   	ret    

0000085a <sbrk>:
SYSCALL(sbrk)
 85a:	b8 0c 00 00 00       	mov    $0xc,%eax
 85f:	cd 40                	int    $0x40
 861:	c3                   	ret    

00000862 <sleep>:
SYSCALL(sleep)
 862:	b8 0d 00 00 00       	mov    $0xd,%eax
 867:	cd 40                	int    $0x40
 869:	c3                   	ret    

0000086a <uptime>:
SYSCALL(uptime)
 86a:	b8 0e 00 00 00       	mov    $0xe,%eax
 86f:	cd 40                	int    $0x40
 871:	c3                   	ret    

00000872 <waitpid>:
SYSCALL(waitpid)
 872:	b8 16 00 00 00       	mov    $0x16,%eax
 877:	cd 40                	int    $0x40
 879:	c3                   	ret    

0000087a <setPrior>:
SYSCALL(setPrior)
 87a:	b8 17 00 00 00       	mov    $0x17,%eax
 87f:	cd 40                	int    $0x40
 881:	c3                   	ret    

00000882 <getPrior>:
 882:	b8 18 00 00 00       	mov    $0x18,%eax
 887:	cd 40                	int    $0x40
 889:	c3                   	ret    
 88a:	66 90                	xchg   %ax,%ax
 88c:	66 90                	xchg   %ax,%ax
 88e:	66 90                	xchg   %ax,%ax

00000890 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	57                   	push   %edi
 894:	56                   	push   %esi
 895:	89 c6                	mov    %eax,%esi
 897:	53                   	push   %ebx
 898:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 89e:	85 db                	test   %ebx,%ebx
 8a0:	74 09                	je     8ab <printint+0x1b>
 8a2:	89 d0                	mov    %edx,%eax
 8a4:	c1 e8 1f             	shr    $0x1f,%eax
 8a7:	84 c0                	test   %al,%al
 8a9:	75 75                	jne    920 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 8ab:	89 d0                	mov    %edx,%eax
  neg = 0;
 8ad:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 8b4:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 8b7:	31 ff                	xor    %edi,%edi
 8b9:	89 ce                	mov    %ecx,%esi
 8bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 8be:	eb 02                	jmp    8c2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 8c0:	89 cf                	mov    %ecx,%edi
 8c2:	31 d2                	xor    %edx,%edx
 8c4:	f7 f6                	div    %esi
 8c6:	8d 4f 01             	lea    0x1(%edi),%ecx
 8c9:	0f b6 92 6f 10 00 00 	movzbl 0x106f(%edx),%edx
  }while((x /= base) != 0);
 8d0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 8d2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 8d5:	75 e9                	jne    8c0 <printint+0x30>
  if(neg)
 8d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 8da:	89 c8                	mov    %ecx,%eax
 8dc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 8df:	85 d2                	test   %edx,%edx
 8e1:	74 08                	je     8eb <printint+0x5b>
    buf[i++] = '-';
 8e3:	8d 4f 02             	lea    0x2(%edi),%ecx
 8e6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 8eb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 8ee:	66 90                	xchg   %ax,%ax
 8f0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 8f5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 8f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8ff:	00 
 900:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 904:	89 34 24             	mov    %esi,(%esp)
 907:	88 45 d7             	mov    %al,-0x29(%ebp)
 90a:	e8 e3 fe ff ff       	call   7f2 <write>
  while(--i >= 0)
 90f:	83 ff ff             	cmp    $0xffffffff,%edi
 912:	75 dc                	jne    8f0 <printint+0x60>
    putc(fd, buf[i]);
}
 914:	83 c4 4c             	add    $0x4c,%esp
 917:	5b                   	pop    %ebx
 918:	5e                   	pop    %esi
 919:	5f                   	pop    %edi
 91a:	5d                   	pop    %ebp
 91b:	c3                   	ret    
 91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 920:	89 d0                	mov    %edx,%eax
 922:	f7 d8                	neg    %eax
    neg = 1;
 924:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 92b:	eb 87                	jmp    8b4 <printint+0x24>
 92d:	8d 76 00             	lea    0x0(%esi),%esi

00000930 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 934:	31 ff                	xor    %edi,%edi
{
 936:	56                   	push   %esi
 937:	53                   	push   %ebx
 938:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 93b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 93e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 941:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 944:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 947:	0f b6 13             	movzbl (%ebx),%edx
 94a:	83 c3 01             	add    $0x1,%ebx
 94d:	84 d2                	test   %dl,%dl
 94f:	75 39                	jne    98a <printf+0x5a>
 951:	e9 c2 00 00 00       	jmp    a18 <printf+0xe8>
 956:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 958:	83 fa 25             	cmp    $0x25,%edx
 95b:	0f 84 bf 00 00 00    	je     a20 <printf+0xf0>
  write(fd, &c, 1);
 961:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 964:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 96b:	00 
 96c:	89 44 24 04          	mov    %eax,0x4(%esp)
 970:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 973:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 976:	e8 77 fe ff ff       	call   7f2 <write>
 97b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 97e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 982:	84 d2                	test   %dl,%dl
 984:	0f 84 8e 00 00 00    	je     a18 <printf+0xe8>
    if(state == 0){
 98a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 98c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 98f:	74 c7                	je     958 <printf+0x28>
      }
    } else if(state == '%'){
 991:	83 ff 25             	cmp    $0x25,%edi
 994:	75 e5                	jne    97b <printf+0x4b>
      if(c == 'd'){
 996:	83 fa 64             	cmp    $0x64,%edx
 999:	0f 84 31 01 00 00    	je     ad0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 99f:	25 f7 00 00 00       	and    $0xf7,%eax
 9a4:	83 f8 70             	cmp    $0x70,%eax
 9a7:	0f 84 83 00 00 00    	je     a30 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 9ad:	83 fa 73             	cmp    $0x73,%edx
 9b0:	0f 84 a2 00 00 00    	je     a58 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 9b6:	83 fa 63             	cmp    $0x63,%edx
 9b9:	0f 84 35 01 00 00    	je     af4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 9bf:	83 fa 25             	cmp    $0x25,%edx
 9c2:	0f 84 e0 00 00 00    	je     aa8 <printf+0x178>
  write(fd, &c, 1);
 9c8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 9cb:	83 c3 01             	add    $0x1,%ebx
 9ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9d5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9d6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 9d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 9dc:	89 34 24             	mov    %esi,(%esp)
 9df:	89 55 d0             	mov    %edx,-0x30(%ebp)
 9e2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 9e6:	e8 07 fe ff ff       	call   7f2 <write>
        putc(fd, c);
 9eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 9ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 9f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9f8:	00 
 9f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9fd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 a00:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 a03:	e8 ea fd ff ff       	call   7f2 <write>
  for(i = 0; fmt[i]; i++){
 a08:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 a0c:	84 d2                	test   %dl,%dl
 a0e:	0f 85 76 ff ff ff    	jne    98a <printf+0x5a>
 a14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 a18:	83 c4 3c             	add    $0x3c,%esp
 a1b:	5b                   	pop    %ebx
 a1c:	5e                   	pop    %esi
 a1d:	5f                   	pop    %edi
 a1e:	5d                   	pop    %ebp
 a1f:	c3                   	ret    
        state = '%';
 a20:	bf 25 00 00 00       	mov    $0x25,%edi
 a25:	e9 51 ff ff ff       	jmp    97b <printf+0x4b>
 a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 a30:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 a33:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 a38:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 a3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 a41:	8b 10                	mov    (%eax),%edx
 a43:	89 f0                	mov    %esi,%eax
 a45:	e8 46 fe ff ff       	call   890 <printint>
        ap++;
 a4a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 a4e:	e9 28 ff ff ff       	jmp    97b <printf+0x4b>
 a53:	90                   	nop
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 a58:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 a5b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 a5f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 a61:	b8 68 10 00 00       	mov    $0x1068,%eax
 a66:	85 ff                	test   %edi,%edi
 a68:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 a6b:	0f b6 07             	movzbl (%edi),%eax
 a6e:	84 c0                	test   %al,%al
 a70:	74 2a                	je     a9c <printf+0x16c>
 a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a78:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 a7b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 a7e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 a81:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 a88:	00 
 a89:	89 44 24 04          	mov    %eax,0x4(%esp)
 a8d:	89 34 24             	mov    %esi,(%esp)
 a90:	e8 5d fd ff ff       	call   7f2 <write>
        while(*s != 0){
 a95:	0f b6 07             	movzbl (%edi),%eax
 a98:	84 c0                	test   %al,%al
 a9a:	75 dc                	jne    a78 <printf+0x148>
      state = 0;
 a9c:	31 ff                	xor    %edi,%edi
 a9e:	e9 d8 fe ff ff       	jmp    97b <printf+0x4b>
 aa3:	90                   	nop
 aa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 aa8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 aab:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 aad:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 ab4:	00 
 ab5:	89 44 24 04          	mov    %eax,0x4(%esp)
 ab9:	89 34 24             	mov    %esi,(%esp)
 abc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 ac0:	e8 2d fd ff ff       	call   7f2 <write>
 ac5:	e9 b1 fe ff ff       	jmp    97b <printf+0x4b>
 aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 ad0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 ad3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 ad8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 adb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ae2:	8b 10                	mov    (%eax),%edx
 ae4:	89 f0                	mov    %esi,%eax
 ae6:	e8 a5 fd ff ff       	call   890 <printint>
        ap++;
 aeb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 aef:	e9 87 fe ff ff       	jmp    97b <printf+0x4b>
        putc(fd, *ap);
 af4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 af7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 af9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 afb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 b02:	00 
 b03:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 b06:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 b09:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 b0c:	89 44 24 04          	mov    %eax,0x4(%esp)
 b10:	e8 dd fc ff ff       	call   7f2 <write>
        ap++;
 b15:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 b19:	e9 5d fe ff ff       	jmp    97b <printf+0x4b>
 b1e:	66 90                	xchg   %ax,%ax

00000b20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 b20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b21:	a1 78 13 00 00       	mov    0x1378,%eax
{
 b26:	89 e5                	mov    %esp,%ebp
 b28:	57                   	push   %edi
 b29:	56                   	push   %esi
 b2a:	53                   	push   %ebx
 b2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b2e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 b30:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b33:	39 d0                	cmp    %edx,%eax
 b35:	72 11                	jb     b48 <free+0x28>
 b37:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b38:	39 c8                	cmp    %ecx,%eax
 b3a:	72 04                	jb     b40 <free+0x20>
 b3c:	39 ca                	cmp    %ecx,%edx
 b3e:	72 10                	jb     b50 <free+0x30>
 b40:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b42:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b44:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 b46:	73 f0                	jae    b38 <free+0x18>
 b48:	39 ca                	cmp    %ecx,%edx
 b4a:	72 04                	jb     b50 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 b4c:	39 c8                	cmp    %ecx,%eax
 b4e:	72 f0                	jb     b40 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 b50:	8b 73 fc             	mov    -0x4(%ebx),%esi
 b53:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 b56:	39 cf                	cmp    %ecx,%edi
 b58:	74 1e                	je     b78 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 b5a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b5d:	8b 48 04             	mov    0x4(%eax),%ecx
 b60:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b63:	39 f2                	cmp    %esi,%edx
 b65:	74 28                	je     b8f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 b67:	89 10                	mov    %edx,(%eax)
  freep = p;
 b69:	a3 78 13 00 00       	mov    %eax,0x1378
}
 b6e:	5b                   	pop    %ebx
 b6f:	5e                   	pop    %esi
 b70:	5f                   	pop    %edi
 b71:	5d                   	pop    %ebp
 b72:	c3                   	ret    
 b73:	90                   	nop
 b74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 b78:	03 71 04             	add    0x4(%ecx),%esi
 b7b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 b7e:	8b 08                	mov    (%eax),%ecx
 b80:	8b 09                	mov    (%ecx),%ecx
 b82:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 b85:	8b 48 04             	mov    0x4(%eax),%ecx
 b88:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 b8b:	39 f2                	cmp    %esi,%edx
 b8d:	75 d8                	jne    b67 <free+0x47>
    p->s.size += bp->s.size;
 b8f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 b92:	a3 78 13 00 00       	mov    %eax,0x1378
    p->s.size += bp->s.size;
 b97:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 b9a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 b9d:	89 10                	mov    %edx,(%eax)
}
 b9f:	5b                   	pop    %ebx
 ba0:	5e                   	pop    %esi
 ba1:	5f                   	pop    %edi
 ba2:	5d                   	pop    %ebp
 ba3:	c3                   	ret    
 ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
 bb3:	57                   	push   %edi
 bb4:	56                   	push   %esi
 bb5:	53                   	push   %ebx
 bb6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bb9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 bbc:	8b 1d 78 13 00 00    	mov    0x1378,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bc2:	8d 48 07             	lea    0x7(%eax),%ecx
 bc5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 bc8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 bca:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 bcd:	0f 84 9b 00 00 00    	je     c6e <malloc+0xbe>
 bd3:	8b 13                	mov    (%ebx),%edx
 bd5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 bd8:	39 fe                	cmp    %edi,%esi
 bda:	76 64                	jbe    c40 <malloc+0x90>
 bdc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 be3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 be8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 beb:	eb 0e                	jmp    bfb <malloc+0x4b>
 bed:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bf0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 bf2:	8b 78 04             	mov    0x4(%eax),%edi
 bf5:	39 fe                	cmp    %edi,%esi
 bf7:	76 4f                	jbe    c48 <malloc+0x98>
 bf9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 bfb:	3b 15 78 13 00 00    	cmp    0x1378,%edx
 c01:	75 ed                	jne    bf0 <malloc+0x40>
  if(nu < 4096)
 c03:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 c06:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 c0c:	bf 00 10 00 00       	mov    $0x1000,%edi
 c11:	0f 43 fe             	cmovae %esi,%edi
 c14:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 c17:	89 04 24             	mov    %eax,(%esp)
 c1a:	e8 3b fc ff ff       	call   85a <sbrk>
  if(p == (char*)-1)
 c1f:	83 f8 ff             	cmp    $0xffffffff,%eax
 c22:	74 18                	je     c3c <malloc+0x8c>
  hp->s.size = nu;
 c24:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 c27:	83 c0 08             	add    $0x8,%eax
 c2a:	89 04 24             	mov    %eax,(%esp)
 c2d:	e8 ee fe ff ff       	call   b20 <free>
  return freep;
 c32:	8b 15 78 13 00 00    	mov    0x1378,%edx
      if((p = morecore(nunits)) == 0)
 c38:	85 d2                	test   %edx,%edx
 c3a:	75 b4                	jne    bf0 <malloc+0x40>
        return 0;
 c3c:	31 c0                	xor    %eax,%eax
 c3e:	eb 20                	jmp    c60 <malloc+0xb0>
    if(p->s.size >= nunits){
 c40:	89 d0                	mov    %edx,%eax
 c42:	89 da                	mov    %ebx,%edx
 c44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 c48:	39 fe                	cmp    %edi,%esi
 c4a:	74 1c                	je     c68 <malloc+0xb8>
        p->s.size -= nunits;
 c4c:	29 f7                	sub    %esi,%edi
 c4e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 c51:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 c54:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 c57:	89 15 78 13 00 00    	mov    %edx,0x1378
      return (void*)(p + 1);
 c5d:	83 c0 08             	add    $0x8,%eax
  }
}
 c60:	83 c4 1c             	add    $0x1c,%esp
 c63:	5b                   	pop    %ebx
 c64:	5e                   	pop    %esi
 c65:	5f                   	pop    %edi
 c66:	5d                   	pop    %ebp
 c67:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 c68:	8b 08                	mov    (%eax),%ecx
 c6a:	89 0a                	mov    %ecx,(%edx)
 c6c:	eb e9                	jmp    c57 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 c6e:	c7 05 78 13 00 00 7c 	movl   $0x137c,0x1378
 c75:	13 00 00 
    base.s.size = 0;
 c78:	ba 7c 13 00 00       	mov    $0x137c,%edx
    base.s.ptr = freep = prevp = &base;
 c7d:	c7 05 7c 13 00 00 7c 	movl   $0x137c,0x137c
 c84:	13 00 00 
    base.s.size = 0;
 c87:	c7 05 80 13 00 00 00 	movl   $0x0,0x1380
 c8e:	00 00 00 
 c91:	e9 46 ff ff ff       	jmp    bdc <malloc+0x2c>
