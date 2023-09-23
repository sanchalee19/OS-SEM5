#include<stdio.h>
#include<stdlib.h>

typedef struct Process {
    int id, bt, at, ct, tat, wt;
} Process;

void input(Process p[], int n);
void calc(Process p[], int n);
void show(Process p[], int n);
void sort(Process p[], int n);
void compute_avg_times(Process p[], int n);

int main() {
    int n;
    printf("Enter number of processes : ");
    scanf("%d", &n);

    Process* p = (Process*)malloc(n * sizeof(Process));
    input(p, n);
    sort(p, n);
    calc(p, n);
    show(p, n);
    compute_avg_times(p, n);
    free(p);
    return 0;
}

void input(Process p[], int n) {
    for (int i = 0; i < n; i++) {
        printf("Enter arrival time for process %d: ", i + 1);
        scanf("%d", &p[i].at);
        printf("Enter burst time for process %d:", i + 1);
        scanf("%d", &p[i].bt);
        p[i].id = i + 1;
    }
}

void calc(Process p[], int n) {
    int sum = 0;
    sum = sum + p[0].at;
    for (int i = 0; i < n; i++) {
        sum = sum + p[i].bt;
        p[i].ct = sum;
        p[i].tat = p[i].ct - p[i].at;
        p[i].wt = p[i].tat - p[i].bt;
        if (i < n - 1 && sum < p[i + 1].at) {
            int t = p[i + 1].at - sum;
            sum = sum + t;
        }
    }
}

void sort(Process p[], int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (p[j].at > p[j + 1].at) {
                Process temp = p[j];
                p[j] = p[j + 1];
                p[j + 1] = temp;
            }
        }
    }
}

void show(Process p[], int n) {
    printf("Process\tArrival Time\tBurst Time\tWaiting Time\tTurn Around Time\tCompletion Time\n");
    for (int i = 0; i < n; i++) {
        printf(" P[%d]\t\t%d\t\t%d\t\t%d\t\t%d\t\t%d\n", p[i].id, p[i].at, p[i].bt, p[i].wt, p[i].tat, p[i].ct);
    }
}
void compute_avg_times(Process p[], int n) {
    float total_wt = 0, total_tat = 0;
    for (int i = 0; i < n; i++) {
        total_wt += p[i].wt;
        total_tat += p[i].tat;
    }

    printf("\nAverage Turn Around Time = %f", (float)total_tat / n);
    printf("\nAverage Waiting Time = %f\n", (float)total_wt / n);
}
