lex -o analex.c analex.l
yacc -o sint.c sint.y -d
gcc sint.c -o sint.exe
sint.exe teste.c