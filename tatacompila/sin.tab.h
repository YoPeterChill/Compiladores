/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_SIN_TAB_H_INCLUDED
# define YY_YY_SIN_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    TOK_IDENT = 258,               /* TOK_IDENT  */
    TOK_PRINT = 259,               /* TOK_PRINT  */
    TOK_SCAN = 260,                /* TOK_SCAN  */
    TOK_IF = 261,                  /* TOK_IF  */
    TOK_ELSE = 262,                /* TOK_ELSE  */
    TOK_WHILE = 263,               /* TOK_WHILE  */
    TOK_FOR = 264,                 /* TOK_FOR  */
    TOK_BREAK = 265,               /* TOK_BREAK  */
    TYPE_BOOL = 266,               /* TYPE_BOOL  */
    TYPE_INT = 267,                /* TYPE_INT  */
    TYPE_FLOAT = 268,              /* TYPE_FLOAT  */
    TYPE_CHAR = 269,               /* TYPE_CHAR  */
    TYPE_STRING = 270,             /* TYPE_STRING  */
    TOK_AND = 271,                 /* TOK_AND  */
    TOK_OR = 272,                  /* TOK_OR  */
    TOK_LESSEQUAL = 273,           /* TOK_LESSEQUAL  */
    TOK_GREATEREQUAL = 274,        /* TOK_GREATEREQUAL  */
    TOK_EQUAL = 275,               /* TOK_EQUAL  */
    TOK_DIFF = 276,                /* TOK_DIFF  */
    TOK_TRUE = 277,                /* TOK_TRUE  */
    TOK_FALSE = 278,               /* TOK_FALSE  */
    TOK_INT = 279,                 /* TOK_INT  */
    TOK_FLOAT = 280,               /* TOK_FLOAT  */
    TOK_CHAR = 281,                /* TOK_CHAR  */
    TOK_STRING = 282               /* TOK_STRING  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_SIN_TAB_H_INCLUDED  */
