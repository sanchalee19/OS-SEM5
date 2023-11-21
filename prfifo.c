#include<stdio.h>
int main()
{
int incomingStream[] = {7,0,1,2,0,3,0,4,2,3,0,3,2,1,2,0,1,7,0,1};
int pageFaults = 0;
int frames = 3;
int m, n, s, pages;
pages = sizeof(incomingStream)/sizeof(incomingStream[0]);
printf("Incoming \t\t Frame 1 \t\t Frame 2 \t\t Frame 3 ");
int temp[ frames ];
for(m = 0; m < frames; m++)
{
temp[m] = -1;
}
for(m = 0; m < pages; m++)
{
s = 0;
for(n = 0; n < frames; n++)
{
if(incomingStream[m] == temp[n])
{
s++;
pageFaults--;
}
}
pageFaults++;
if((pageFaults <= frames) && (s == 1))
{
temp[m] = incomingStream[m];
}
else if(s == 0)
{
temp[(pageFaults - 1) % frames] = incomingStream[m];
}
printf("\n");
printf("%d\t\t\t",incomingStream[m]);
for(n = 0; n < frames; n++)
{
if(temp[n] != -1)
printf(" %d\t\t\t", temp[n]);
else
printf(" - \t\t\t");

}
}
printf("\nTotal Page Faults: %d\n", pageFaults);
int h;
h = pages - pageFaults;
printf("\nTotal Page hit: %d\n",h);
float ffreq = (float)pageFaults / pages * 100;
printf("Page fault frequency : %.2f%% \n",ffreq);
float hfreq = (float)h / pages * 100;
printf("Page hit frequency : %.2f%% \n",hfreq);
return 0;
}
