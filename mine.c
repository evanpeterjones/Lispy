#include <stdio.h>
#include <stdlib.h>
//#include <mpc.h>

#ifdef _WIN32
#include <string.h>

static char buffer[2048];

char* readline(char* prompt)
{
  fputs(prompt, stdout);
  fgets(buffer, 2048, stdin);
  char* cpy = malloc(strlen(buffer)+1);
  strcpy(cpy, buffer);
  return cpy;
}

void add_history(char* not_used) {}

#else
#include <editline/readline.h>
#include <editline/history.h>
#endif

char* read(char* input)
{
  return input;
}

int main(int argc, char** argv)
{
  /* version */
  puts("Lispy Version 0.0.0.1");
  puts("Press Ctrl+c to Exit\n");

  while (1)
  {
    char* input = readline("lispy> ");
    add_history(input);

//    read(input);
    printf("%s\n\n", input);
    free(input);
  }
  return 0;
}
