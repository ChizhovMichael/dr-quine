#include <stdio.h>
/*
	Manual: https://habr.com/ru/post/128191/
*/
char *get_src()
{
	char *program = "#include <stdio.h>%c/*%c%cManual: https://habr.com/ru/post/128191/%c*/%cchar *get_src()%c{%c%cchar *program = %c%s%c;%c%creturn program;%c}%cint main()%c{%c%c/*%c%c%cOne of the comments must be present in the main function%c%c*/%c%cchar *program = get_src();%c%cprintf(program,10,10,9,10,10,10,10,9,34,program,34,10,9,10,10,10,10,9,10,9,9,10,9,10,9,10,9,10,9,10,10);%c%creturn (0);%c}%c";
	return program;
}
int main()
{
	/*
		One of the comments must be present in the main function
	*/
	char *program = get_src();
	printf(program,10,10,9,10,10,10,10,9,34,program,34,10,9,10,10,10,10,9,10,9,9,10,9,10,9,10,9,10,9,10,10);
	return (0);
}
