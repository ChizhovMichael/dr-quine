#include <stdio.h>
#define ARG1 "#include <stdio.h>%c#define ARG1 %c%s%c%c#define ARG2 %c./Grace_kid.c%c%c/*%c%cThis is comment%c*/%c#define FT(x)int main(){FILE *f=fopen(ARG2, %cw%c);if(f!= NULL){fprintf(f,x,10,34,x,34,10,34,34,10,10,9,10,10,34,34,10,10);fclose(f);}return (0);}%c%cFT(ARG1)"
#define ARG2 "./Grace_kid.c"
/*
	This is comment
*/
#define FT(x)int main(){FILE *f=fopen(ARG2, "w");if(f!= NULL){fprintf(f,x,10,34,x,34,10,34,34,10,10,9,10,10,34,34,10,10);fclose(f);}return (0);}

FT(ARG1)