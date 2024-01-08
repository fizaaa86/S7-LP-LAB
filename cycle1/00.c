#include <stdio.h>
#include <string.h>

int checker(char c,int state)
{
	if(state == 0 && c== '0')
		{
			return 1;
		}
	if(state == 1 && c == '0')
		{
			return 2;
		}
	if(state == 2 && c == '0')
		{
			return 2;
		}
	else
	{
		return 0;
	}
}
int main()
{
	char string[100];
	int state = 0;
	printf("Enter the string: \n");
	scanf("%s",string);
	
	int i=0;
	
	
	while(string[i]!= '\0')
	{
		if(string[i]!= '0' && string[i]!= '1')
		{
			printf("Not a binary string\n");
			return -1;
		}
		state = checker(string[i],state);
		i++;
	}
	
	if(state == 2)
	{
		printf("The given Binary string ends with 00\n");
	}
	else
	{
		printf("The given Binary string doesnt ends with 00\n");
	}
	return 0;
}
