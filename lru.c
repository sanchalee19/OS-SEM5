#include<stdio.h>

void lru(int string[20],int n,int size)
{
    int frames[n];
    
    for (int i=0;i<n;i++)
    {
        frames[i]=-1;
    } 
    
    int index=-1;
    int page_miss=0;
    int page_hits=0;
    
    for (int i=0;i<size;i++)
    {
        int symbol=string[i];
        int flag=0;
        //To signal if array is full or not
        int full=0;
        for(int j=0;j<n;j++)
        {
          if (symbol==frames[j])
          {
              flag=1;
              break;
          }
        }
        if (flag==1)
        {
            printf("\nSymbol: %d Frame: ",symbol);
            for (int j=0;j<n;j++)
            printf("%d ",frames[j]);
            page_hits+=1;
        }
    
        else
        {
            if (full==0)
            {
                index=(index+1)%n;
                frames[index]=symbol;
                page_miss+=1;
                printf("\nSymbol: %d Frame: ",symbol);
                for (int j=0;j<n;j++)
                printf("%d ",frames[j]);
             }
              else
              {
                  int pos=999;
                  int index=-1;
                  for(int j=0;j<n;j++)
                  {
                    for(int k=0;k<size;k++)
                    {
                        if (frames[j]==string[k])
                        {
                          if (pos>k)
                          {
                            pos=k;
                            index=j;
                            break;
                          }
                        }
                     }
                  }
                  frames[index]=symbol;
              } // inner else
        }  //outer else
    } // for
    printf("\nPage hits: %d",page_hits);
    printf("\nPage misses: %d",page_miss);
} // lru fun 

int main(void)
{
    int string[]={7,0,1,2,0,3,0,4,2,3,0,3,2};
    int no_frames=4;
    int size=sizeof(string)/sizeof(int);
    lru(string,no_frames,size);
    return 0;
}
