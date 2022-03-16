#include <string.h>
#include <unistd.h>
#include <stdio.h>
#define SRC "#include <string.h>%c#include <unistd.h>%c#include <stdio.h>%c#define SRC %c%s%c%cint main(){%c%cint i = %d;%c%cif (strcmp(strchr(__FILE__, 0) - 7, %cSully.c%c))--i;%c%cif (i < 0) return 0;%c%cchar name[100];char file[100];char exec[100];sprintf(name, %cSully_%%d%c, i);sprintf(file, %cSully_%%d.c%c, i);sprintf(exec, %cgcc %%s.c -o %%s && ./%%s%c, name, name, name);char *cmd[]= {%csh%c, %c-c%c, exec, (char*)0};FILE *f = fopen(file, %cw%c);if (f != NULL) {fprintf(f,SRC,10,10,10,34,SRC,34,10,10,9,i,10,9,34,34,10,9,10,9,34,34,34,34,34,34,34,34,34,34,34,34,34,34,10,9,10);fclose(f);execv(%c/bin/sh%c, cmd);}%c%creturn 0;%c}"
int main(){
	int i = 5;
	if (strcmp(strchr(__FILE__, 0) - 7, "Sully.c"))--i;
	if (i < 0) return 0;
	char name[100];char file[100];char exec[100];sprintf(name, "Sully_%d", i);sprintf(file, "Sully_%d.c", i);sprintf(exec, "gcc %s.c -o %s && ./%s", name, name, name);char *cmd[]= {"sh", "-c", exec, (char*)0};FILE *f = fopen(file, "w");if (f != NULL) {fprintf(f,SRC,10,10,10,34,SRC,34,10,10,9,i,10,9,34,34,10,9,10,9,34,34,34,34,34,34,34,34,34,34,34,34,34,34,10,9,10);fclose(f);execv("/bin/sh", cmd);}
	return 0;
}