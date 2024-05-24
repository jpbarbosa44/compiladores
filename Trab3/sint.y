%{ 
#include "analex.c" 
%}

%token NUM 
%token ID 
%token INT
%token IF 
%token ELSE
%token WHILE
%token GE
%token DO
%token VOID
%token CHAR

%left '+' '-'
%left '*' '/'
%start Prog
%%
Prog : Prog Function
	| Function
	;

Function :
	TypeF ID '(' ')' '{' Decls Statement_Seq '}'  
		
Decls:
	  Decl ';' Decls  
	| 
	;

Decl:
	Type IDs
	; 
	
IDs :
	  IDs ',' ID
	| ID
	;
	
TypeF :
	  VOID
	| INT
	| CHAR
	;

Type :
	  INT
	| CHAR
	;
			
Statement_Seq :
	Statement Statement_Seq
	|
	;
		
Statement: 
	  Atribuicao
	| If
	| While
	| DoWhile
	;

Compound_Stt :
	  Statement
	| '{' Statement_Seq '}'
	;
		
If :
	  IF '(' Exp ')' Compound_Stt
	| IF '(' Exp ')' Compound_Stt ELSE Compound_Stt	  
	;

While:
	WHILE '(' Exp ')' Compound_Stt
	;

DoWhile:
	DO Compound_Stt WHILE '(' Exp ')' ';'
	;
			
Atribuicao : ID '=' Exp ';' 
	;
				
Exp :
	  Exp '+' Exp 
	| Exp '-' Exp
	| Exp '*' Exp
	| Exp '/' Exp	
	| '(' Exp ')' 	  
	| NUM		   
	| ID           
	;   
	
	
%%  
int main(int argc, char **argv) {     
  yyin = fopen(argv[1],"r");
  yyparse();      
} 


