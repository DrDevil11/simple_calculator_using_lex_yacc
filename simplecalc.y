%{ 

#include<stdio.h> 
void yyerror();
int yylex(void);
int symbol[26]; 
%} 

%token NUM 

%token VAR

%left '+' '-'

%left '*' '/' '%'

%% 
program   : statement program
          |
          ;
statement : exp          {printf("%d\n",$1);}
          | VAR '=' exp  {symbol[$1]=$3;}
          ;

exp : NUM
    | VAR                 {$$=symbol[$1];}
    |exp '+' exp          {$$=$1+$3;}
    |exp '-' exp          {$$=$1-$3;}
    |exp '*' exp          {$$=$1*$3;}        
    |exp '/' exp          {$$=$1/$3;}
    |exp '%' exp          {$$=$1%$3;}
    | '(' exp ')'         {$$=$2;}
    ;
%% 

int main() 
{ 
yyparse(); 
return 0;
} 

void yyerror() 
{ 
printf("\nEntered arithmetic expression is Invalid\n\n"); 

} 
