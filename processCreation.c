#include<stdio.h>
#include<sys/types.h>
#include<ctype.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/wait.h>
#include <stdbool.h>

void swap(int* xp, int* yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void ascending(int *arr, int n)
{
         
  int i, j;  
  for (i = 0; i < n - 1; i++) {  
    for (j = 0; j < n - i - 1; j++) {  
      if (arr[j] > arr[j + 1]) {  
        int temp = arr[j];  
        arr[j] = arr[j + 1];  
        arr[j + 1] = temp;  
      }  
    }  
  }  

        for(int i = 0; i < n ; i++)
        {
                printf("%d ",arr[i]);
        }
        printf("\n");
}

void descending(int *arr, int n)
{
        
  int i, j;  
  for (i = 0; i < n - 1; i++) {  
    for (j = 0; j < n - i - 1; j++) {  
      if (arr[j] > arr[j + 1]) {  
        int temp = arr[j];  
        arr[j] = arr[j + 1];  
        arr[j + 1] = temp;  
      }  
    }  
  }  

        for(int i = 0; i < n ; i++)
        {
                printf("%d ",arr[i]);
        }
        printf("\n");
}



int main()
{
        int *arr, n;
        pid_t pid;
        printf("Enter no of elements : ");
        scanf("%d",&n);
        arr = (int*)malloc(n*sizeof(int));
        printf("Enter array\n");
        for(int i = 0; i < n; i++)
        {
                scanf("%d",&arr[i]);
        }

        pid = fork();

        if(pid < 0)
        {
                perror("Fork Error\n");
        }
        else if(pid == 0)
        {
                printf("Child process id is : %ld\n",(long)getpid());
        }
        else
        {
                printf("Parent process id is : %ld\n",(long)getpid());
        }

        switch(pid)
        {
                case -1:
                        printf("Fork Error\n");
                        exit(-1);
                case 0:
                        printf("Child executes\n");
                        ascending(arr, n);
                        exit(pid);

                default:
                        wait(NULL);
                        printf("Parent executes\n");
                        descending(arr, n);
                        system("ps -elf");
                        exit(pid);
        }

        return 0;
}          
