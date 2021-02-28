%{ 

#include<stdio.h> 
#include "y.tab.h" 
extern int yylval; 
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

int yywrap(void) 
{ 
return 1; 
} 
