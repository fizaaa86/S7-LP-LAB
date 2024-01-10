#include <stdio.h>
#include <string.h>
int main()
{
	int flag = 0;
	int transition[5][2] = {{1,3},{2,4},{4,3},{1,3},{4,4}};
	int currentstate = 0;
	char string[100];
	
	printf("Enter the string: \n");
	scanf("%s",string);
	
	int length = strlen(string);
	
	for(int i=0;i<length;i++)
	{
		int inputbit = string[i] - '0';
		currentstate = transition[currentstate][inputbit];
		
		if(currentstate == 3)
		{
			flag=1;
		}
		if(currentstate == 4)
		{
			flag = 0;
			break;
		}
	}
	if(flag == 1)
	{
		printf("Accepted\n");
	}
	else
	{
		printf("Rejected\n");
	}
	return 0;
}
