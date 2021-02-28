%{ 

#include<stdio.h> 
#include "y.tab.h" 
extern int yylval; 
void yyerror();
%} 


%% 
[a-z]  {
          yylval=*yytext-'a';
          return VAR;
       }
[0-9]+ { 
		yylval=atoi(yytext); 
		return NUM; 

	   } 

[ \t\n] ; 

[-+()=/*\n] return *yytext; 

.        yyerror();

%% 
void yyerror()
{
	printf("\nEntered arithmetic expression is Invalid\n\n"); 

}

int yywrap(void) 
{ 
return 1; 
} 
