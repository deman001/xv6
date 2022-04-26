
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

  printf(1, "\n This program tests the correctness of your lab#1\n");
   d:	c7 44 24 04 a4 0e 00 	movl   $0xea4,0x4(%esp)
  14:	00 
  15:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1c:	e8 ef 07 00 00       	call   810 <printf>
  
  if (atoi(argv[1]) == 1)
  21:	8b 43 04             	mov    0x4(%ebx),%eax
  24:	89 04 24             	mov    %eax,(%esp)
  27:	e8 34 06 00 00       	call   660 <atoi>
  2c:	83 f8 01             	cmp    $0x1,%eax
  2f:	74 3a                	je     6b <main+0x6b>
	exitWait();
  else if (atoi(argv[1]) == 2)
  31:	8b 43 04             	mov    0x4(%ebx),%eax
  34:	89 04 24             	mov    %eax,(%esp)
  37:	e8 24 06 00 00       	call   660 <atoi>
  3c:	83 f8 02             	cmp    $0x2,%eax
  3f:	74 31                	je     72 <main+0x72>
	waitPid();
  else 
   printf(1, "\ntype \"%s 1\" to test exit and wait, \"%s 2\" to test waitpid\n", argv[0], argv[0]);
  41:	8b 03                	mov    (%ebx),%eax
  43:	c7 44 24 04 d8 0e 00 	movl   $0xed8,0x4(%esp)
  4a:	00 
  4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  52:	89 44 24 0c          	mov    %eax,0xc(%esp)
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	e8 b1 07 00 00       	call   810 <printf>
  
    // End of test
	 exit(0);
  5f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  66:	e8 57 06 00 00       	call   6c2 <exit>
	exitWait();
  6b:	e8 10 00 00 00       	call   80 <exitWait>
  70:	eb ed                	jmp    5f <main+0x5f>
	waitPid();
  72:	e8 09 01 00 00       	call   180 <waitPid>
  77:	eb e6                	jmp    5f <main+0x5f>
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <exitWait>:
	 return 0;
 }
  
int exitWait(void) {
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	56                   	push   %esi
  84:	53                   	push   %ebx
    int i;
  // use this part to test exit(int status) and wait(int* status)
 
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");

  for (i = 0; i < 2; i++) {
  85:	31 db                	xor    %ebx,%ebx
int exitWait(void) {
  87:	83 ec 20             	sub    $0x20,%esp
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
  8a:	c7 44 24 04 78 0b 00 	movl   $0xb78,0x4(%esp)
  91:	00 
      else{
	      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
        exit(-1);
      } 
    } else if (pid > 0) { // only the parent executes this code
      ret_pid = wait(&exit_status);
  92:	8d 75 f4             	lea    -0xc(%ebp),%esi
  printf(1, "\n  Parts a & b) testing exit(int status) and wait(int* status):\n");
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 6f 07 00 00       	call   810 <printf>
    pid = fork();
  a1:	e8 14 06 00 00       	call   6ba <fork>
    if (pid == 0) { // only the child executed this code
  a6:	83 f8 00             	cmp    $0x0,%eax
  a9:	74 45                	je     f0 <exitWait+0x70>
  ab:	90                   	nop
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if (pid > 0) { // only the parent executes this code
  b0:	0f 8e a3 00 00 00    	jle    159 <exitWait+0xd9>
      ret_pid = wait(&exit_status);
  b6:	89 34 24             	mov    %esi,(%esp)
  for (i = 0; i < 2; i++) {
  b9:	83 c3 01             	add    $0x1,%ebx
      ret_pid = wait(&exit_status);
  bc:	e8 09 06 00 00       	call   6ca <wait>
      printf(1, "\n This is the parent: child with PID# %d has exited with status %d\n", ret_pid, exit_status);
  c1:	8b 55 f4             	mov    -0xc(%ebp),%edx
  c4:	c7 44 24 04 f8 0b 00 	movl   $0xbf8,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	89 54 24 0c          	mov    %edx,0xc(%esp)
  d7:	89 44 24 08          	mov    %eax,0x8(%esp)
  db:	e8 30 07 00 00       	call   810 <printf>
  for (i = 0; i < 2; i++) {
  e0:	83 fb 02             	cmp    $0x2,%ebx
  e3:	75 bc                	jne    a1 <exitWait+0x21>
	    printf(2, "\nError using fork\n");
      exit(-1);
    }
  }
  return 0;
}
  e5:	83 c4 20             	add    $0x20,%esp
  e8:	31 c0                	xor    %eax,%eax
  ea:	5b                   	pop    %ebx
  eb:	5e                   	pop    %esi
  ec:	5d                   	pop    %ebp
  ed:	c3                   	ret    
  ee:	66 90                	xchg   %ax,%ax
      if (i == 0){
  f0:	85 db                	test   %ebx,%ebx
  f2:	75 34                	jne    128 <exitWait+0xa8>
        printf(1, "\nThis is child with PID# %d and I will exit with status %d\n", getpid(), 0);
  f4:	e8 49 06 00 00       	call   742 <getpid>
  f9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 100:	00 
 101:	c7 44 24 04 bc 0b 00 	movl   $0xbbc,0x4(%esp)
 108:	00 
 109:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 110:	89 44 24 08          	mov    %eax,0x8(%esp)
 114:	e8 f7 06 00 00       	call   810 <printf>
        exit(0);
 119:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 120:	e8 9d 05 00 00       	call   6c2 <exit>
 125:	8d 76 00             	lea    0x0(%esi),%esi
	      printf(1, "\nThis is child with PID# %d and I will exit with status %d\n" ,getpid(), -1);
 128:	e8 15 06 00 00       	call   742 <getpid>
 12d:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
 134:	ff 
 135:	c7 44 24 04 bc 0b 00 	movl   $0xbbc,0x4(%esp)
 13c:	00 
 13d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 144:	89 44 24 08          	mov    %eax,0x8(%esp)
 148:	e8 c3 06 00 00       	call   810 <printf>
        exit(-1);
 14d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 154:	e8 69 05 00 00       	call   6c2 <exit>
	    printf(2, "\nError using fork\n");
 159:	c7 44 24 04 14 0f 00 	movl   $0xf14,0x4(%esp)
 160:	00 
 161:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 168:	e8 a3 06 00 00       	call   810 <printf>
      exit(-1);
 16d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 174:	e8 49 05 00 00       	call   6c2 <exit>
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000180 <waitPid>:

int waitPid(void){
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	56                   	push   %esi
 184:	53                   	push   %ebx
 185:	83 ec 40             	sub    $0x40,%esp
  int ret_pid, exit_status;
  int i;
  int pid_a[5]={0, 0, 0, 0, 0};
 // use this part to test wait(int pid, int* status, int options)

  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 188:	c7 44 24 04 3c 0c 00 	movl   $0xc3c,0x4(%esp)
 18f:	00 
 190:	8d 5d e4             	lea    -0x1c(%ebp),%ebx
 193:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19a:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int pid_a[5]={0, 0, 0, 0, 0};
 19d:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1a4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 1ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 1b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1b9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  printf(1, "\n  Part c) testing waitpid(int pid, int* status, int options):\n");
 1c0:	e8 4b 06 00 00       	call   810 <printf>

	for (i = 0; i <5; i++) {
		pid_a[i] = fork();
 1c5:	e8 f0 04 00 00       	call   6ba <fork>
		if (pid_a[i] == 0) { // only the child executed this code
 1ca:	85 c0                	test   %eax,%eax
		pid_a[i] = fork();
 1cc:	89 03                	mov    %eax,(%ebx)
		if (pid_a[i] == 0) { // only the child executed this code
 1ce:	0f 84 84 02 00 00    	je     458 <waitPid+0x2d8>
 1d4:	83 c3 04             	add    $0x4,%ebx
	for (i = 0; i <5; i++) {
 1d7:	39 f3                	cmp    %esi,%ebx
 1d9:	75 ea                	jne    1c5 <waitPid+0x45>
			printf(1, "\n This is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
			exit(getpid() + 4);
		}
	}
  sleep(5);
 1db:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 1e2:	8d 5d e0             	lea    -0x20(%ebp),%ebx
  sleep(5);
 1e5:	e8 68 05 00 00       	call   752 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[3]);
 1ea:	8b 75 f0             	mov    -0x10(%ebp),%esi
 1ed:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
 1f4:	00 
 1f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fc:	89 74 24 08          	mov    %esi,0x8(%esp)
 200:	e8 0b 06 00 00       	call   810 <printf>
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 205:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 209:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[3] + 4);
 20c:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[3], &exit_status, 0);
 20f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 216:	00 
 217:	e8 46 05 00 00       	call   762 <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[3] + 4);
 21c:	8b 55 e0             	mov    -0x20(%ebp),%edx
 21f:	89 74 24 10          	mov    %esi,0x10(%esp)
 223:	c7 44 24 04 f8 0c 00 	movl   $0xcf8,0x4(%esp)
 22a:	00 
 22b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 232:	89 54 24 0c          	mov    %edx,0xc(%esp)
 236:	89 44 24 08          	mov    %eax,0x8(%esp)
 23a:	e8 d1 05 00 00       	call   810 <printf>
  sleep(5);
 23f:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 246:	e8 07 05 00 00       	call   752 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[1]);
 24b:	8b 75 e8             	mov    -0x18(%ebp),%esi
 24e:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
 255:	00 
 256:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25d:	89 74 24 08          	mov    %esi,0x8(%esp)
 261:	e8 aa 05 00 00       	call   810 <printf>
  ret_pid = waitpid(pid_a[1], &exit_status, 0);
 266:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 26a:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[1] + 4);
 26d:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[1], &exit_status, 0);
 270:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 277:	00 
 278:	e8 e5 04 00 00       	call   762 <waitpid>
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[1] + 4);
 27d:	8b 55 e0             	mov    -0x20(%ebp),%edx
 280:	89 74 24 10          	mov    %esi,0x10(%esp)
 284:	c7 44 24 04 44 0d 00 	movl   $0xd44,0x4(%esp)
 28b:	00 
 28c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 293:	89 54 24 0c          	mov    %edx,0xc(%esp)
 297:	89 44 24 08          	mov    %eax,0x8(%esp)
 29b:	e8 70 05 00 00       	call   810 <printf>
  sleep(5);
 2a0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 2a7:	e8 a6 04 00 00       	call   752 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[2]);
 2ac:	8b 75 ec             	mov    -0x14(%ebp),%esi
 2af:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
 2b6:	00 
 2b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2be:	89 74 24 08          	mov    %esi,0x8(%esp)
 2c2:	e8 49 05 00 00       	call   810 <printf>
  ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2c7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 2cb:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[2] + 4);
 2ce:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[2], &exit_status, 0);
 2d1:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 2d8:	00 
 2d9:	e8 84 04 00 00       	call   762 <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[2] + 4);
 2de:	8b 55 e0             	mov    -0x20(%ebp),%edx
 2e1:	89 74 24 10          	mov    %esi,0x10(%esp)
 2e5:	c7 44 24 04 f8 0c 00 	movl   $0xcf8,0x4(%esp)
 2ec:	00 
 2ed:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f4:	89 54 24 0c          	mov    %edx,0xc(%esp)
 2f8:	89 44 24 08          	mov    %eax,0x8(%esp)
 2fc:	e8 0f 05 00 00       	call   810 <printf>
  sleep(5);
 301:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 308:	e8 45 04 00 00       	call   752 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[0]);
 30d:	8b 75 e4             	mov    -0x1c(%ebp),%esi
 310:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
 317:	00 
 318:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 31f:	89 74 24 08          	mov    %esi,0x8(%esp)
 323:	e8 e8 04 00 00       	call   810 <printf>
  ret_pid = waitpid(pid_a[0], &exit_status, 0);
 328:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 32c:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[0] + 4);
 32f:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[0], &exit_status, 0);
 332:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 339:	00 
 33a:	e8 23 04 00 00       	call   762 <waitpid>
  printf(1, "\n This is the partent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[0] + 4);
 33f:	8b 55 e0             	mov    -0x20(%ebp),%edx
 342:	89 74 24 10          	mov    %esi,0x10(%esp)
 346:	c7 44 24 04 f8 0c 00 	movl   $0xcf8,0x4(%esp)
 34d:	00 
 34e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 355:	89 54 24 0c          	mov    %edx,0xc(%esp)
 359:	89 44 24 08          	mov    %eax,0x8(%esp)
 35d:	e8 ae 04 00 00       	call   810 <printf>
  sleep(5);
 362:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 369:	e8 e4 03 00 00       	call   752 <sleep>
  printf(1, "\n This is the parent: Now waiting for child with PID# %d\n",pid_a[4]);
 36e:	8b 75 f4             	mov    -0xc(%ebp),%esi
 371:	c7 44 24 04 bc 0c 00 	movl   $0xcbc,0x4(%esp)
 378:	00 
 379:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 380:	89 74 24 08          	mov    %esi,0x8(%esp)
 384:	e8 87 04 00 00       	call   810 <printf>
  ret_pid = waitpid(pid_a[4], &exit_status, 0);
 389:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 38d:	89 34 24             	mov    %esi,(%esp)
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[4] + 4);
 390:	83 c6 04             	add    $0x4,%esi
  ret_pid = waitpid(pid_a[4], &exit_status, 0);
 393:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 39a:	00 
 39b:	e8 c2 03 00 00       	call   762 <waitpid>
  printf(1, "\n This is the parent: Child# %d has exited with status %d, expected: %d\n",ret_pid, exit_status, pid_a[4] + 4);
 3a0:	8b 55 e0             	mov    -0x20(%ebp),%edx
 3a3:	89 74 24 10          	mov    %esi,0x10(%esp)
 3a7:	c7 44 24 04 44 0d 00 	movl   $0xd44,0x4(%esp)
 3ae:	00 
 3af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b6:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3ba:	89 44 24 08          	mov    %eax,0x8(%esp)
 3be:	e8 4d 04 00 00       	call   810 <printf>


  printf(1, "\n This is the parent: Now try to wait for a invalid Number, this should not get stuck..\n");
 3c3:	c7 44 24 04 90 0d 00 	movl   $0xd90,0x4(%esp)
 3ca:	00 
 3cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3d2:	e8 39 04 00 00       	call   810 <printf>
  ret_pid = waitpid(9999, &exit_status, 0);
 3d7:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3db:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 3e2:	00 
 3e3:	c7 04 24 0f 27 00 00 	movl   $0x270f,(%esp)
 3ea:	e8 73 03 00 00       	call   762 <waitpid>
  printf(1, "\n This is the parent: Child# 9999 has ret code %d, expected: -1\n",ret_pid);
 3ef:	c7 44 24 04 ec 0d 00 	movl   $0xdec,0x4(%esp)
 3f6:	00 
 3f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3fe:	89 44 24 08          	mov    %eax,0x8(%esp)
 402:	e8 09 04 00 00       	call   810 <printf>
  //printf(1, "\n This is the parent: Child# %d has exited with status %d\n",ret_pid, exit_status);

  printf(1, "\n This is the parent: Now try to give invalid argument.\n");
 407:	c7 44 24 04 30 0e 00 	movl   $0xe30,0x4(%esp)
 40e:	00 
 40f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 416:	e8 f5 03 00 00       	call   810 <printf>
  ret_pid = waitpid(9999, (int*) 0xffffffff, 0);
 41b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 422:	00 
 423:	c7 44 24 04 ff ff ff 	movl   $0xffffffff,0x4(%esp)
 42a:	ff 
 42b:	c7 04 24 0f 27 00 00 	movl   $0x270f,(%esp)
 432:	e8 2b 03 00 00       	call   762 <waitpid>
  printf(1, "\n This is the parent: Got ret code %d, expected: -1\n",ret_pid);
 437:	c7 44 24 04 6c 0e 00 	movl   $0xe6c,0x4(%esp)
 43e:	00 
 43f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 446:	89 44 24 08          	mov    %eax,0x8(%esp)
 44a:	e8 c1 03 00 00       	call   810 <printf>

  return 0;
 44f:	83 c4 40             	add    $0x40,%esp
 452:	31 c0                	xor    %eax,%eax
 454:	5b                   	pop    %ebx
 455:	5e                   	pop    %esi
 456:	5d                   	pop    %ebp
 457:	c3                   	ret    
			printf(1, "\n This is child with PID# %d and I will exit with status %d\n", getpid(), getpid() + 4);
 458:	e8 e5 02 00 00       	call   742 <getpid>
 45d:	89 c3                	mov    %eax,%ebx
 45f:	e8 de 02 00 00       	call   742 <getpid>
 464:	83 c3 04             	add    $0x4,%ebx
 467:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 46b:	c7 44 24 04 7c 0c 00 	movl   $0xc7c,0x4(%esp)
 472:	00 
 473:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 47a:	89 44 24 08          	mov    %eax,0x8(%esp)
 47e:	e8 8d 03 00 00       	call   810 <printf>
			exit(getpid() + 4);
 483:	e8 ba 02 00 00       	call   742 <getpid>
 488:	83 c0 04             	add    $0x4,%eax
 48b:	89 04 24             	mov    %eax,(%esp)
 48e:	e8 2f 02 00 00       	call   6c2 <exit>
 493:	66 90                	xchg   %ax,%ax
 495:	66 90                	xchg   %ax,%ax
 497:	66 90                	xchg   %ax,%ax
 499:	66 90                	xchg   %ax,%ax
 49b:	66 90                	xchg   %ax,%ax
 49d:	66 90                	xchg   %ax,%ax
 49f:	90                   	nop

000004a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 4a0:	55                   	push   %ebp
 4a1:	89 e5                	mov    %esp,%ebp
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 4a9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4aa:	89 c2                	mov    %eax,%edx
 4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4b0:	83 c1 01             	add    $0x1,%ecx
 4b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 4b7:	83 c2 01             	add    $0x1,%edx
 4ba:	84 db                	test   %bl,%bl
 4bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 4bf:	75 ef                	jne    4b0 <strcpy+0x10>
    ;
  return os;
}
 4c1:	5b                   	pop    %ebx
 4c2:	5d                   	pop    %ebp
 4c3:	c3                   	ret    
 4c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000004d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	8b 55 08             	mov    0x8(%ebp),%edx
 4d6:	53                   	push   %ebx
 4d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 4da:	0f b6 02             	movzbl (%edx),%eax
 4dd:	84 c0                	test   %al,%al
 4df:	74 2d                	je     50e <strcmp+0x3e>
 4e1:	0f b6 19             	movzbl (%ecx),%ebx
 4e4:	38 d8                	cmp    %bl,%al
 4e6:	74 0e                	je     4f6 <strcmp+0x26>
 4e8:	eb 2b                	jmp    515 <strcmp+0x45>
 4ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4f0:	38 c8                	cmp    %cl,%al
 4f2:	75 15                	jne    509 <strcmp+0x39>
    p++, q++;
 4f4:	89 d9                	mov    %ebx,%ecx
 4f6:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 4f9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 4fc:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
 4ff:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 503:	84 c0                	test   %al,%al
 505:	75 e9                	jne    4f0 <strcmp+0x20>
 507:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 509:	29 c8                	sub    %ecx,%eax
}
 50b:	5b                   	pop    %ebx
 50c:	5d                   	pop    %ebp
 50d:	c3                   	ret    
 50e:	0f b6 09             	movzbl (%ecx),%ecx
  while(*p && *p == *q)
 511:	31 c0                	xor    %eax,%eax
 513:	eb f4                	jmp    509 <strcmp+0x39>
 515:	0f b6 cb             	movzbl %bl,%ecx
 518:	eb ef                	jmp    509 <strcmp+0x39>
 51a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000520 <strlen>:

uint
strlen(const char *s)
{
 520:	55                   	push   %ebp
 521:	89 e5                	mov    %esp,%ebp
 523:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 526:	80 39 00             	cmpb   $0x0,(%ecx)
 529:	74 12                	je     53d <strlen+0x1d>
 52b:	31 d2                	xor    %edx,%edx
 52d:	8d 76 00             	lea    0x0(%esi),%esi
 530:	83 c2 01             	add    $0x1,%edx
 533:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 537:	89 d0                	mov    %edx,%eax
 539:	75 f5                	jne    530 <strlen+0x10>
    ;
  return n;
}
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
  for(n = 0; s[n]; n++)
 53d:	31 c0                	xor    %eax,%eax
}
 53f:	5d                   	pop    %ebp
 540:	c3                   	ret    
 541:	eb 0d                	jmp    550 <memset>
 543:	90                   	nop
 544:	90                   	nop
 545:	90                   	nop
 546:	90                   	nop
 547:	90                   	nop
 548:	90                   	nop
 549:	90                   	nop
 54a:	90                   	nop
 54b:	90                   	nop
 54c:	90                   	nop
 54d:	90                   	nop
 54e:	90                   	nop
 54f:	90                   	nop

00000550 <memset>:

void*
memset(void *dst, int c, uint n)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	8b 55 08             	mov    0x8(%ebp),%edx
 556:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 557:	8b 4d 10             	mov    0x10(%ebp),%ecx
 55a:	8b 45 0c             	mov    0xc(%ebp),%eax
 55d:	89 d7                	mov    %edx,%edi
 55f:	fc                   	cld    
 560:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 562:	89 d0                	mov    %edx,%eax
 564:	5f                   	pop    %edi
 565:	5d                   	pop    %ebp
 566:	c3                   	ret    
 567:	89 f6                	mov    %esi,%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000570 <strchr>:

char*
strchr(const char *s, char c)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	53                   	push   %ebx
 577:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 57a:	0f b6 18             	movzbl (%eax),%ebx
 57d:	84 db                	test   %bl,%bl
 57f:	74 1d                	je     59e <strchr+0x2e>
    if(*s == c)
 581:	38 d3                	cmp    %dl,%bl
 583:	89 d1                	mov    %edx,%ecx
 585:	75 0d                	jne    594 <strchr+0x24>
 587:	eb 17                	jmp    5a0 <strchr+0x30>
 589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 590:	38 ca                	cmp    %cl,%dl
 592:	74 0c                	je     5a0 <strchr+0x30>
  for(; *s; s++)
 594:	83 c0 01             	add    $0x1,%eax
 597:	0f b6 10             	movzbl (%eax),%edx
 59a:	84 d2                	test   %dl,%dl
 59c:	75 f2                	jne    590 <strchr+0x20>
      return (char*)s;
  return 0;
 59e:	31 c0                	xor    %eax,%eax
}
 5a0:	5b                   	pop    %ebx
 5a1:	5d                   	pop    %ebp
 5a2:	c3                   	ret    
 5a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005b0 <gets>:

char*
gets(char *buf, int max)
{
 5b0:	55                   	push   %ebp
 5b1:	89 e5                	mov    %esp,%ebp
 5b3:	57                   	push   %edi
 5b4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5b5:	31 f6                	xor    %esi,%esi
{
 5b7:	53                   	push   %ebx
 5b8:	83 ec 2c             	sub    $0x2c,%esp
    cc = read(0, &c, 1);
 5bb:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 5be:	eb 31                	jmp    5f1 <gets+0x41>
    cc = read(0, &c, 1);
 5c0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5c7:	00 
 5c8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 5cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5d3:	e8 02 01 00 00       	call   6da <read>
    if(cc < 1)
 5d8:	85 c0                	test   %eax,%eax
 5da:	7e 1d                	jle    5f9 <gets+0x49>
      break;
    buf[i++] = c;
 5dc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  for(i=0; i+1 < max; ){
 5e0:	89 de                	mov    %ebx,%esi
    buf[i++] = c;
 5e2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 5e5:	3c 0d                	cmp    $0xd,%al
    buf[i++] = c;
 5e7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 5eb:	74 0c                	je     5f9 <gets+0x49>
 5ed:	3c 0a                	cmp    $0xa,%al
 5ef:	74 08                	je     5f9 <gets+0x49>
  for(i=0; i+1 < max; ){
 5f1:	8d 5e 01             	lea    0x1(%esi),%ebx
 5f4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 5f7:	7c c7                	jl     5c0 <gets+0x10>
      break;
  }
  buf[i] = '\0';
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 600:	83 c4 2c             	add    $0x2c,%esp
 603:	5b                   	pop    %ebx
 604:	5e                   	pop    %esi
 605:	5f                   	pop    %edi
 606:	5d                   	pop    %ebp
 607:	c3                   	ret    
 608:	90                   	nop
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000610 <stat>:

int
stat(const char *n, struct stat *st)
{
 610:	55                   	push   %ebp
 611:	89 e5                	mov    %esp,%ebp
 613:	56                   	push   %esi
 614:	53                   	push   %ebx
 615:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 618:	8b 45 08             	mov    0x8(%ebp),%eax
 61b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 622:	00 
 623:	89 04 24             	mov    %eax,(%esp)
 626:	e8 d7 00 00 00       	call   702 <open>
  if(fd < 0)
 62b:	85 c0                	test   %eax,%eax
  fd = open(n, O_RDONLY);
 62d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 62f:	78 27                	js     658 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 631:	8b 45 0c             	mov    0xc(%ebp),%eax
 634:	89 1c 24             	mov    %ebx,(%esp)
 637:	89 44 24 04          	mov    %eax,0x4(%esp)
 63b:	e8 da 00 00 00       	call   71a <fstat>
  close(fd);
 640:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 643:	89 c6                	mov    %eax,%esi
  close(fd);
 645:	e8 a0 00 00 00       	call   6ea <close>
  return r;
 64a:	89 f0                	mov    %esi,%eax
}
 64c:	83 c4 10             	add    $0x10,%esp
 64f:	5b                   	pop    %ebx
 650:	5e                   	pop    %esi
 651:	5d                   	pop    %ebp
 652:	c3                   	ret    
 653:	90                   	nop
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 658:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 65d:	eb ed                	jmp    64c <stat+0x3c>
 65f:	90                   	nop

00000660 <atoi>:

int
atoi(const char *s)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	8b 4d 08             	mov    0x8(%ebp),%ecx
 666:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 667:	0f be 11             	movsbl (%ecx),%edx
 66a:	8d 42 d0             	lea    -0x30(%edx),%eax
 66d:	3c 09                	cmp    $0x9,%al
  n = 0;
 66f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 674:	77 17                	ja     68d <atoi+0x2d>
 676:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 678:	83 c1 01             	add    $0x1,%ecx
 67b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 67e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 682:	0f be 11             	movsbl (%ecx),%edx
 685:	8d 5a d0             	lea    -0x30(%edx),%ebx
 688:	80 fb 09             	cmp    $0x9,%bl
 68b:	76 eb                	jbe    678 <atoi+0x18>
  return n;
}
 68d:	5b                   	pop    %ebx
 68e:	5d                   	pop    %ebp
 68f:	c3                   	ret    

00000690 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 690:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 691:	31 d2                	xor    %edx,%edx
{
 693:	89 e5                	mov    %esp,%ebp
 695:	56                   	push   %esi
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	53                   	push   %ebx
 69a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 69d:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n-- > 0)
 6a0:	85 db                	test   %ebx,%ebx
 6a2:	7e 12                	jle    6b6 <memmove+0x26>
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 6a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 6ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 6af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 6b2:	39 da                	cmp    %ebx,%edx
 6b4:	75 f2                	jne    6a8 <memmove+0x18>
  return vdst;
}
 6b6:	5b                   	pop    %ebx
 6b7:	5e                   	pop    %esi
 6b8:	5d                   	pop    %ebp
 6b9:	c3                   	ret    

000006ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6ba:	b8 01 00 00 00       	mov    $0x1,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <exit>:
SYSCALL(exit)
 6c2:	b8 02 00 00 00       	mov    $0x2,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <wait>:
SYSCALL(wait)
 6ca:	b8 03 00 00 00       	mov    $0x3,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <pipe>:
SYSCALL(pipe)
 6d2:	b8 04 00 00 00       	mov    $0x4,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <read>:
SYSCALL(read)
 6da:	b8 05 00 00 00       	mov    $0x5,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <write>:
SYSCALL(write)
 6e2:	b8 10 00 00 00       	mov    $0x10,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <close>:
SYSCALL(close)
 6ea:	b8 15 00 00 00       	mov    $0x15,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <kill>:
SYSCALL(kill)
 6f2:	b8 06 00 00 00       	mov    $0x6,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <exec>:
SYSCALL(exec)
 6fa:	b8 07 00 00 00       	mov    $0x7,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <open>:
SYSCALL(open)
 702:	b8 0f 00 00 00       	mov    $0xf,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <mknod>:
SYSCALL(mknod)
 70a:	b8 11 00 00 00       	mov    $0x11,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <unlink>:
SYSCALL(unlink)
 712:	b8 12 00 00 00       	mov    $0x12,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <fstat>:
SYSCALL(fstat)
 71a:	b8 08 00 00 00       	mov    $0x8,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <link>:
SYSCALL(link)
 722:	b8 13 00 00 00       	mov    $0x13,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <mkdir>:
SYSCALL(mkdir)
 72a:	b8 14 00 00 00       	mov    $0x14,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <chdir>:
SYSCALL(chdir)
 732:	b8 09 00 00 00       	mov    $0x9,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <dup>:
SYSCALL(dup)
 73a:	b8 0a 00 00 00       	mov    $0xa,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <getpid>:
SYSCALL(getpid)
 742:	b8 0b 00 00 00       	mov    $0xb,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <sbrk>:
SYSCALL(sbrk)
 74a:	b8 0c 00 00 00       	mov    $0xc,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <sleep>:
SYSCALL(sleep)
 752:	b8 0d 00 00 00       	mov    $0xd,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <uptime>:
SYSCALL(uptime)
 75a:	b8 0e 00 00 00       	mov    $0xe,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <waitpid>:
 762:	b8 16 00 00 00       	mov    $0x16,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    
 76a:	66 90                	xchg   %ax,%ax
 76c:	66 90                	xchg   %ax,%ax
 76e:	66 90                	xchg   %ax,%ax

00000770 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	89 c6                	mov    %eax,%esi
 777:	53                   	push   %ebx
 778:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 77b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 77e:	85 db                	test   %ebx,%ebx
 780:	74 09                	je     78b <printint+0x1b>
 782:	89 d0                	mov    %edx,%eax
 784:	c1 e8 1f             	shr    $0x1f,%eax
 787:	84 c0                	test   %al,%al
 789:	75 75                	jne    800 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 78b:	89 d0                	mov    %edx,%eax
  neg = 0;
 78d:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 794:	89 75 c0             	mov    %esi,-0x40(%ebp)
  }

  i = 0;
 797:	31 ff                	xor    %edi,%edi
 799:	89 ce                	mov    %ecx,%esi
 79b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 79e:	eb 02                	jmp    7a2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 7a0:	89 cf                	mov    %ecx,%edi
 7a2:	31 d2                	xor    %edx,%edx
 7a4:	f7 f6                	div    %esi
 7a6:	8d 4f 01             	lea    0x1(%edi),%ecx
 7a9:	0f b6 92 2e 0f 00 00 	movzbl 0xf2e(%edx),%edx
  }while((x /= base) != 0);
 7b0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 7b2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 7b5:	75 e9                	jne    7a0 <printint+0x30>
  if(neg)
 7b7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    buf[i++] = digits[x % base];
 7ba:	89 c8                	mov    %ecx,%eax
 7bc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  if(neg)
 7bf:	85 d2                	test   %edx,%edx
 7c1:	74 08                	je     7cb <printint+0x5b>
    buf[i++] = '-';
 7c3:	8d 4f 02             	lea    0x2(%edi),%ecx
 7c6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 7cb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 7ce:	66 90                	xchg   %ax,%ax
 7d0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 7d5:	83 ef 01             	sub    $0x1,%edi
  write(fd, &c, 1);
 7d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7df:	00 
 7e0:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 7e4:	89 34 24             	mov    %esi,(%esp)
 7e7:	88 45 d7             	mov    %al,-0x29(%ebp)
 7ea:	e8 f3 fe ff ff       	call   6e2 <write>
  while(--i >= 0)
 7ef:	83 ff ff             	cmp    $0xffffffff,%edi
 7f2:	75 dc                	jne    7d0 <printint+0x60>
    putc(fd, buf[i]);
}
 7f4:	83 c4 4c             	add    $0x4c,%esp
 7f7:	5b                   	pop    %ebx
 7f8:	5e                   	pop    %esi
 7f9:	5f                   	pop    %edi
 7fa:	5d                   	pop    %ebp
 7fb:	c3                   	ret    
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    x = -xx;
 800:	89 d0                	mov    %edx,%eax
 802:	f7 d8                	neg    %eax
    neg = 1;
 804:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 80b:	eb 87                	jmp    794 <printint+0x24>
 80d:	8d 76 00             	lea    0x0(%esi),%esi

00000810 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 814:	31 ff                	xor    %edi,%edi
{
 816:	56                   	push   %esi
 817:	53                   	push   %ebx
 818:	83 ec 3c             	sub    $0x3c,%esp
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 81b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  ap = (uint*)(void*)&fmt + 1;
 81e:	8d 45 10             	lea    0x10(%ebp),%eax
{
 821:	8b 75 08             	mov    0x8(%ebp),%esi
  ap = (uint*)(void*)&fmt + 1;
 824:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 827:	0f b6 13             	movzbl (%ebx),%edx
 82a:	83 c3 01             	add    $0x1,%ebx
 82d:	84 d2                	test   %dl,%dl
 82f:	75 39                	jne    86a <printf+0x5a>
 831:	e9 c2 00 00 00       	jmp    8f8 <printf+0xe8>
 836:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 838:	83 fa 25             	cmp    $0x25,%edx
 83b:	0f 84 bf 00 00 00    	je     900 <printf+0xf0>
  write(fd, &c, 1);
 841:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 844:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 84b:	00 
 84c:	89 44 24 04          	mov    %eax,0x4(%esp)
 850:	89 34 24             	mov    %esi,(%esp)
        state = '%';
      } else {
        putc(fd, c);
 853:	88 55 e2             	mov    %dl,-0x1e(%ebp)
  write(fd, &c, 1);
 856:	e8 87 fe ff ff       	call   6e2 <write>
 85b:	83 c3 01             	add    $0x1,%ebx
  for(i = 0; fmt[i]; i++){
 85e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 862:	84 d2                	test   %dl,%dl
 864:	0f 84 8e 00 00 00    	je     8f8 <printf+0xe8>
    if(state == 0){
 86a:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 86c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 86f:	74 c7                	je     838 <printf+0x28>
      }
    } else if(state == '%'){
 871:	83 ff 25             	cmp    $0x25,%edi
 874:	75 e5                	jne    85b <printf+0x4b>
      if(c == 'd'){
 876:	83 fa 64             	cmp    $0x64,%edx
 879:	0f 84 31 01 00 00    	je     9b0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 87f:	25 f7 00 00 00       	and    $0xf7,%eax
 884:	83 f8 70             	cmp    $0x70,%eax
 887:	0f 84 83 00 00 00    	je     910 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 88d:	83 fa 73             	cmp    $0x73,%edx
 890:	0f 84 a2 00 00 00    	je     938 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 896:	83 fa 63             	cmp    $0x63,%edx
 899:	0f 84 35 01 00 00    	je     9d4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 89f:	83 fa 25             	cmp    $0x25,%edx
 8a2:	0f 84 e0 00 00 00    	je     988 <printf+0x178>
  write(fd, &c, 1);
 8a8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 8ab:	83 c3 01             	add    $0x1,%ebx
 8ae:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8b5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 8b6:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 8b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bc:	89 34 24             	mov    %esi,(%esp)
 8bf:	89 55 d0             	mov    %edx,-0x30(%ebp)
 8c2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 8c6:	e8 17 fe ff ff       	call   6e2 <write>
        putc(fd, c);
 8cb:	8b 55 d0             	mov    -0x30(%ebp),%edx
  write(fd, &c, 1);
 8ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
 8d1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 8d8:	00 
 8d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8dd:	89 34 24             	mov    %esi,(%esp)
        putc(fd, c);
 8e0:	88 55 e7             	mov    %dl,-0x19(%ebp)
  write(fd, &c, 1);
 8e3:	e8 fa fd ff ff       	call   6e2 <write>
  for(i = 0; fmt[i]; i++){
 8e8:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 8ec:	84 d2                	test   %dl,%dl
 8ee:	0f 85 76 ff ff ff    	jne    86a <printf+0x5a>
 8f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
}
 8f8:	83 c4 3c             	add    $0x3c,%esp
 8fb:	5b                   	pop    %ebx
 8fc:	5e                   	pop    %esi
 8fd:	5f                   	pop    %edi
 8fe:	5d                   	pop    %ebp
 8ff:	c3                   	ret    
        state = '%';
 900:	bf 25 00 00 00       	mov    $0x25,%edi
 905:	e9 51 ff ff ff       	jmp    85b <printf+0x4b>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 910:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 913:	b9 10 00 00 00       	mov    $0x10,%ecx
      state = 0;
 918:	31 ff                	xor    %edi,%edi
        printint(fd, *ap, 16, 0);
 91a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 921:	8b 10                	mov    (%eax),%edx
 923:	89 f0                	mov    %esi,%eax
 925:	e8 46 fe ff ff       	call   770 <printint>
        ap++;
 92a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 92e:	e9 28 ff ff ff       	jmp    85b <printf+0x4b>
 933:	90                   	nop
 934:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 938:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 93b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        s = (char*)*ap;
 93f:	8b 38                	mov    (%eax),%edi
          s = "(null)";
 941:	b8 27 0f 00 00       	mov    $0xf27,%eax
 946:	85 ff                	test   %edi,%edi
 948:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 94b:	0f b6 07             	movzbl (%edi),%eax
 94e:	84 c0                	test   %al,%al
 950:	74 2a                	je     97c <printf+0x16c>
 952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 958:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 95b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
          s++;
 95e:	83 c7 01             	add    $0x1,%edi
  write(fd, &c, 1);
 961:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 968:	00 
 969:	89 44 24 04          	mov    %eax,0x4(%esp)
 96d:	89 34 24             	mov    %esi,(%esp)
 970:	e8 6d fd ff ff       	call   6e2 <write>
        while(*s != 0){
 975:	0f b6 07             	movzbl (%edi),%eax
 978:	84 c0                	test   %al,%al
 97a:	75 dc                	jne    958 <printf+0x148>
      state = 0;
 97c:	31 ff                	xor    %edi,%edi
 97e:	e9 d8 fe ff ff       	jmp    85b <printf+0x4b>
 983:	90                   	nop
 984:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 988:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      state = 0;
 98b:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 98d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 994:	00 
 995:	89 44 24 04          	mov    %eax,0x4(%esp)
 999:	89 34 24             	mov    %esi,(%esp)
 99c:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 9a0:	e8 3d fd ff ff       	call   6e2 <write>
 9a5:	e9 b1 fe ff ff       	jmp    85b <printf+0x4b>
 9aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 9b0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 9b3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      state = 0;
 9b8:	66 31 ff             	xor    %di,%di
        printint(fd, *ap, 10, 1);
 9bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9c2:	8b 10                	mov    (%eax),%edx
 9c4:	89 f0                	mov    %esi,%eax
 9c6:	e8 a5 fd ff ff       	call   770 <printint>
        ap++;
 9cb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 9cf:	e9 87 fe ff ff       	jmp    85b <printf+0x4b>
        putc(fd, *ap);
 9d4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      state = 0;
 9d7:	31 ff                	xor    %edi,%edi
        putc(fd, *ap);
 9d9:	8b 00                	mov    (%eax),%eax
  write(fd, &c, 1);
 9db:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 9e2:	00 
 9e3:	89 34 24             	mov    %esi,(%esp)
        putc(fd, *ap);
 9e6:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 9e9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 9ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 9f0:	e8 ed fc ff ff       	call   6e2 <write>
        ap++;
 9f5:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 9f9:	e9 5d fe ff ff       	jmp    85b <printf+0x4b>
 9fe:	66 90                	xchg   %ax,%ax

00000a00 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a00:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a01:	a1 fc 11 00 00       	mov    0x11fc,%eax
{
 a06:	89 e5                	mov    %esp,%ebp
 a08:	57                   	push   %edi
 a09:	56                   	push   %esi
 a0a:	53                   	push   %ebx
 a0b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a0e:	8b 08                	mov    (%eax),%ecx
  bp = (Header*)ap - 1;
 a10:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a13:	39 d0                	cmp    %edx,%eax
 a15:	72 11                	jb     a28 <free+0x28>
 a17:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a18:	39 c8                	cmp    %ecx,%eax
 a1a:	72 04                	jb     a20 <free+0x20>
 a1c:	39 ca                	cmp    %ecx,%edx
 a1e:	72 10                	jb     a30 <free+0x30>
 a20:	89 c8                	mov    %ecx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a22:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a24:	8b 08                	mov    (%eax),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a26:	73 f0                	jae    a18 <free+0x18>
 a28:	39 ca                	cmp    %ecx,%edx
 a2a:	72 04                	jb     a30 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a2c:	39 c8                	cmp    %ecx,%eax
 a2e:	72 f0                	jb     a20 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 a30:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a33:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 a36:	39 cf                	cmp    %ecx,%edi
 a38:	74 1e                	je     a58 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a3a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a3d:	8b 48 04             	mov    0x4(%eax),%ecx
 a40:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 a43:	39 f2                	cmp    %esi,%edx
 a45:	74 28                	je     a6f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a47:	89 10                	mov    %edx,(%eax)
  freep = p;
 a49:	a3 fc 11 00 00       	mov    %eax,0x11fc
}
 a4e:	5b                   	pop    %ebx
 a4f:	5e                   	pop    %esi
 a50:	5f                   	pop    %edi
 a51:	5d                   	pop    %ebp
 a52:	c3                   	ret    
 a53:	90                   	nop
 a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 a58:	03 71 04             	add    0x4(%ecx),%esi
 a5b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a5e:	8b 08                	mov    (%eax),%ecx
 a60:	8b 09                	mov    (%ecx),%ecx
 a62:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a65:	8b 48 04             	mov    0x4(%eax),%ecx
 a68:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 a6b:	39 f2                	cmp    %esi,%edx
 a6d:	75 d8                	jne    a47 <free+0x47>
    p->s.size += bp->s.size;
 a6f:	03 4b fc             	add    -0x4(%ebx),%ecx
  freep = p;
 a72:	a3 fc 11 00 00       	mov    %eax,0x11fc
    p->s.size += bp->s.size;
 a77:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a7a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 a7d:	89 10                	mov    %edx,(%eax)
}
 a7f:	5b                   	pop    %ebx
 a80:	5e                   	pop    %esi
 a81:	5f                   	pop    %edi
 a82:	5d                   	pop    %ebp
 a83:	c3                   	ret    
 a84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 a8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a90 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a90:	55                   	push   %ebp
 a91:	89 e5                	mov    %esp,%ebp
 a93:	57                   	push   %edi
 a94:	56                   	push   %esi
 a95:	53                   	push   %ebx
 a96:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a99:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 a9c:	8b 1d fc 11 00 00    	mov    0x11fc,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aa2:	8d 48 07             	lea    0x7(%eax),%ecx
 aa5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 aa8:	85 db                	test   %ebx,%ebx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aaa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 aad:	0f 84 9b 00 00 00    	je     b4e <malloc+0xbe>
 ab3:	8b 13                	mov    (%ebx),%edx
 ab5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ab8:	39 fe                	cmp    %edi,%esi
 aba:	76 64                	jbe    b20 <malloc+0x90>
 abc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
  if(nu < 4096)
 ac3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 ac8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 acb:	eb 0e                	jmp    adb <malloc+0x4b>
 acd:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 ad2:	8b 78 04             	mov    0x4(%eax),%edi
 ad5:	39 fe                	cmp    %edi,%esi
 ad7:	76 4f                	jbe    b28 <malloc+0x98>
 ad9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 adb:	3b 15 fc 11 00 00    	cmp    0x11fc,%edx
 ae1:	75 ed                	jne    ad0 <malloc+0x40>
  if(nu < 4096)
 ae3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 ae6:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 aec:	bf 00 10 00 00       	mov    $0x1000,%edi
 af1:	0f 43 fe             	cmovae %esi,%edi
 af4:	0f 42 c3             	cmovb  %ebx,%eax
  p = sbrk(nu * sizeof(Header));
 af7:	89 04 24             	mov    %eax,(%esp)
 afa:	e8 4b fc ff ff       	call   74a <sbrk>
  if(p == (char*)-1)
 aff:	83 f8 ff             	cmp    $0xffffffff,%eax
 b02:	74 18                	je     b1c <malloc+0x8c>
  hp->s.size = nu;
 b04:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 b07:	83 c0 08             	add    $0x8,%eax
 b0a:	89 04 24             	mov    %eax,(%esp)
 b0d:	e8 ee fe ff ff       	call   a00 <free>
  return freep;
 b12:	8b 15 fc 11 00 00    	mov    0x11fc,%edx
      if((p = morecore(nunits)) == 0)
 b18:	85 d2                	test   %edx,%edx
 b1a:	75 b4                	jne    ad0 <malloc+0x40>
        return 0;
 b1c:	31 c0                	xor    %eax,%eax
 b1e:	eb 20                	jmp    b40 <malloc+0xb0>
    if(p->s.size >= nunits){
 b20:	89 d0                	mov    %edx,%eax
 b22:	89 da                	mov    %ebx,%edx
 b24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 b28:	39 fe                	cmp    %edi,%esi
 b2a:	74 1c                	je     b48 <malloc+0xb8>
        p->s.size -= nunits;
 b2c:	29 f7                	sub    %esi,%edi
 b2e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 b31:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 b34:	89 70 04             	mov    %esi,0x4(%eax)
      freep = prevp;
 b37:	89 15 fc 11 00 00    	mov    %edx,0x11fc
      return (void*)(p + 1);
 b3d:	83 c0 08             	add    $0x8,%eax
  }
}
 b40:	83 c4 1c             	add    $0x1c,%esp
 b43:	5b                   	pop    %ebx
 b44:	5e                   	pop    %esi
 b45:	5f                   	pop    %edi
 b46:	5d                   	pop    %ebp
 b47:	c3                   	ret    
        prevp->s.ptr = p->s.ptr;
 b48:	8b 08                	mov    (%eax),%ecx
 b4a:	89 0a                	mov    %ecx,(%edx)
 b4c:	eb e9                	jmp    b37 <malloc+0xa7>
    base.s.ptr = freep = prevp = &base;
 b4e:	c7 05 fc 11 00 00 00 	movl   $0x1200,0x11fc
 b55:	12 00 00 
    base.s.size = 0;
 b58:	ba 00 12 00 00       	mov    $0x1200,%edx
    base.s.ptr = freep = prevp = &base;
 b5d:	c7 05 00 12 00 00 00 	movl   $0x1200,0x1200
 b64:	12 00 00 
    base.s.size = 0;
 b67:	c7 05 04 12 00 00 00 	movl   $0x0,0x1204
 b6e:	00 00 00 
 b71:	e9 46 ff ff ff       	jmp    abc <malloc+0x2c>
