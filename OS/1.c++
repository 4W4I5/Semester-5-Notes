#include <iostream>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
using namespace std;

void *print_message_function(void *ptr)
{
    char *message;
    message = (char *)ptr;
    cout << message << endl;
}

int main(int argc, char *argv[])
{
    // Lab Manual 2
    // Fork, wait, exit, getpid, getppid, cli arguments

    int pid = fork();
    if (pid == 0)
    {
        cout << "CHILD=> Parent PID: " << getppid() << endl;
        cout << "CHILD=> Child PID: " << getpid() << endl;
        exit(0);
    }
    else
    {
        cout << "PARENT=> Parent PID: " << getpid() << endl;
        wait(NULL);
        cout << "PARENT=> Child process finished" << endl;
    }
    cout << endl;

    for (int i = 0; i < argc; i++)
    {
        if (argv[i] == NULL)
        {
            cout << "No Args provided\n";
        }
        else
        {
            cout << "Argument " << i << ": " << argv[i] << endl;
        }
    }
    cout << endl;

    // Lab Manual 3
    // execl, execlp, execv, execvp, execle, execve

    // ///////////////////////////////////////////////////////////////////
    // /////////// Commented to avoid process termination ////////////////
    // ///////////////////////////////////////////////////////////////////

    // cout << "Executing execl: Replaces the current process image with a new one specified by the given path." << endl;
    // execl("/bin/ls", "ls", "-l", (char *)0);

    // cout << "Executing execlp: Similar to execl but searches for the program in the directories listed in the PATH environment variable." << endl;
    // execlp("ls", "ls", "-l", (char *)0);

    // cout << "Executing execv: Replaces the current process image with a new one specified by the given path." << endl;
    // char *args1[] = {"ls", "-l", nullptr};
    // execv("/bin/ls", args1);

    // cout << "Executing execvp: Similar to execv but searches for the program in the directories listed in the PATH environment variable." << endl;
    // char *args2[] = {"ls", "-l", nullptr};
    // execvp("ls", args2);

    // cout << "Executing execle: Replaces the current process image with a new one specified by the given path and allows specifying a custom environment." << endl;
    // char *envp1[] = {"PATH=/bin", "USER=awais", nullptr};
    // execle("/bin/ls", "ls", "-l", (char *)0, envp1);

    // cout << "Executing execve: Similar to execv but allows specifying both the arguments and the environment directly as arrays." << endl;
    // char *args3[] = {"ls", "-l", nullptr};
    // char *envp[] = {"PATH=/bin", "USER=awais", nullptr};
    // execve("/bin/ls", args3, envp);



    // Lab Manual 4
    // Interprocess communication using pipes, no dup2

    int fd[2];
    pid_t childpid;
    char string[] = "Hello world\n";
    char readbuffer[80];
    int result = pipe(fd);

    if (result < 0)
    {
        cout << "Error while creating file ";
        exit(1);
    }

    childpid = fork();

    if (childpid == -1)
    {
        cout << "Error in fork" << endl;
        exit(1);
    }

    if (childpid == 0)
    {
        close(fd[0]);
        cout << "Child writing to the pipe" << endl;
        write(fd[1], string, sizeof(string));
        cout << "Written to a file" << endl;
        exit(0);
    }
    else
    {
        close(fd[1]);
        wait(NULL);
        cout << "Parent reading from the pipe" << endl;
        read(fd[0], readbuffer, sizeof(readbuffer));
        cout << "Received string: " << readbuffer << endl;
        exit(0);
    }

    // Lab Manual 5
    // Threads using pthread

    pthread_t thread1, thread2;
    int iret1, iret2;

    char *message1 = "Thread 1";
    char *message2 = "Thread 2";

    iret1 = pthread_create(&thread1, NULL, print_message_function, (void *)message1);
    iret2 = pthread_create(&thread2, NULL, print_message_function, (void *)message2);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    cout << "Thread 1 returns: " << iret1 << endl;
    cout << "Thread 2 returns: " << iret2 << endl;



    // Lab Named pipes
    // mkfifo("proc1ToProc2", 0666);
    // mkfifo("proc2ToProc1", 0666);

    // O_RDONLY, O_WRONLY, or O_RDWR. 
    
    // int fd1 = open("proc1ToProc2", O_WRONLY);
    // int fd2 = open("proc2ToProc1", O_RDONLY);
    // cout << "Type exit() to close the program" << endl;

    // while (true)
    // {
    //     string message1 = "";
    //     cout << "Process 1 (writer): ";
    //     getline(cin, message1);
    //     write(fd1, message1.c_str(), message1.length());
    //     if (message1 == "exit()")
    //     {
    //         break;
    //     }
    //     char buffer[100];
    //     read(fd2, buffer, sizeof(buffer));
    //     cout << "Process 2 (reader): " << buffer << endl;
    // }

    // close(fd1);
    // close(fd2);
    // unlink("proc1ToProc2");
    // unlink("proc2ToProc1");




    // Lab Mutex
    
    // #include <stdio.h>
    // #include <stdlib.h>
    // #include <pthread.h>
    // #include <unistd.h>
    // #include <time.h>
    // #define MAX_BALANCE 999999 // Maximum balance
    // #define INITIAL_BALANCE 50 // Initial account balance

    // int account_balance = INITIAL_BALANCE;
    // pthread_mutex_t lock;

    // void *withdraw(void *arg)
    // {
    //     for (int i = 0; i < 10; i++)
    //     {

    //         pthread_mutex_lock(&lock);
    //         if (account_balance >= 10)
    //         {
    //             account_balance -= 10;
    //             printf("New Balance: $%d | Withdrawal: $10\n", account_balance);
    //         }
    //         else
    //         {
    //             printf("Insufficient funds for withdrawal\n");
    //         }
    //         pthread_mutex_unlock(&lock);
    //         sleep(1);
    //     }
    //     return NULL;
    // }

    // void *deposit(void *arg)
    // {
    //     for (int i = 0; i < 10; i++)
    //     {
    //         pthread_mutex_lock(&lock);
    //         if (account_balance < MAX_BALANCE)
    //         {
    //             account_balance += 11;
    //             printf("New Balance: $%d | Deposit: $11\n", account_balance);
    //         }
    //         pthread_mutex_unlock(&lock);
    //         sleep(1);
    //     }
    //     return NULL;
    // }

    // int main()
    // {
    //     pthread_t withdraw_thread[2], deposit_thread[2];

    //     pthread_mutex_init(&lock, NULL);
    //     printf("Current Balance is %d\n", account_balance);
    //     for (int i = 0; i < 2; i++)
    //     {
    //         pthread_create(&withdraw_thread[i], NULL, withdraw, NULL);
    //         pthread_create(&deposit_thread[i], NULL, deposit, NULL);
    //     }

    //     for (int i = 0; i < 2; i++)
    //     {
    //         pthread_join(withdraw_thread[i], NULL);
    //         pthread_join(deposit_thread[i], NULL);
    //     }

    //     pthread_mutex_destroy(&lock);
    //     printf("Reached time 10 on all threads. Closing\n");
    //     return 0;
    // }

    return 0;
}
