#include <stdio.h>
#include <string.h>
int main()
{
	int state = 0,final = 3;
	char string[100];
	printf("ENter the string: \n");
	scanf("%s",string);
	
	int length = strlen(string);
	
	for(int i = 0;i<length;i++)
	{
		switch(state)
		
	   {	case 0:
		if(string[i] == 'a')
		state = 1;
		else if(string[i] == 'b'|| string[i] == 'c')
		state = 0;
		else
		printf("INvalid string entered\n");
		break;
		
		case 1:
		if(string[i]=='a')
		state = 1;
		else if(string[i] == 'b')
		state =2;
		else if(string[i] == 'c')
		state = 0;
		break;
		
		case 2:
		if(string[i] == 'a')
		state = 1;
		if(string[i] == 'b')
		state = 0;
		if(string[i] == 'c')
		state=3;
		break;
		
		case 3:
		if(string[i] == 'a'||string[i] == 'b' || string[i] == 'c')
		state = 3;
		break;
	 }
	}
	if(state == final)
	{
		printf("Accepted\n");
	}
	else
	printf("INvalid\n");
	return 0;
}
