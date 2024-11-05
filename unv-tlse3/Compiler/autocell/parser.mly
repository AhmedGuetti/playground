/*
 * autocell - AutoCell compiler and viewer
 * Copyright (C) 2021  University of Toulouse, France <casse@irit.fr>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

%{

open Common
open Ast
open Printf
open Symbols

(** Raise a syntax error with the given message.
	@param msg	Message of the error. *)
let error msg =
	raise (SyntaxError msg)


(** Restructure the when assignment into selections.
	@param f	Function to build the assignment.
	@param ws	Sequence of (expression, conditions) terminated
				by (expression, NO_COND).
	@return		Built statement. *)
let rec make_when f ws =
	match ws with
	| [(e, NO_COND)]	->	f e
	| (e, c)::t			-> IF_THEN(c, f e, make_when f t)
	| _ -> failwith "whens list not ended by (expression, NO_COND)."

%}

%token EOF

/* keywords */
%token DIMENSIONS

%token END
%token OF

/* symbols */
%token ASSIGN
%token COMMA
%token LBRACKET RBRACKET
%token DOT_DOT
%token DOT
%token IF 

/* Symbols */
%token ASSIGN
%token COMMA
%token LBRACKET RBRACKET
%token DOT_DOT
%token DOT
%token PLUS
%token MINUS
%token MOD
%token TIMES
%token DEVID
%token LPAR
%token RPAR

/* Conditions */
%token EQUALE 
%token GREATER_THAN
%token GREATER_THAN_EQUALE
%token LESS_THAN
%token LESS_THAN_EQUALE
%token NOT_EQUALE

/* Conditions */
%token IF
%token THEN 
%token ELSE 
%token ELSIF


%token WHEN 
%token OTHERWISE


/* values */
%token <string> ID
%token<int> INT

%start program
%type<Ast.prog> program

%%

program: INT DIMENSIONS OF config END opt_statements EOF
	{
		if $1 != 2 then error "only 2 dimension accepted";
		($4, $6)
	}
;

config:
	INT DOT_DOT INT
		{
			if $1 >= $3 then error "illegal field values";
			[("", (0, ($1, $3)))]
		}
|	fields
		{ set_fields $1 }
;

fields:
	field
		{ [$1] }
|	fields COMMA field
		{$3 :: $1 }
;

field:
	ID OF INT DOT_DOT INT
		{
			if $3 >= $5 then error "illegal field values";
			($1, ($3, $5))
		}
;


opt_statements:
	/* empty */
		{ NOP }
|	opt_statements  statement 
		{  SEQ ($1,$2) }
;




statement:
	cell ASSIGN expression
		{
			if (fst $1) != 0 then error "assigned x must be 0";
			if (snd $1) != 0 then error "assigned Y must be 0";
			SET_CELL (0, $3)
		}
	| ID ASSIGN expression
	{
		let r_var = get_var $1 in
		if r_var = -1 then 
			let reg = declare_var $1 in
			SET_VAR (reg, $3)
		else 
			SET_VAR(r_var, $3)
	}
	| ID ASSIGN when_clauses 
	{ 
        make_when (fun expr ->
            let r_var = get_var $1 in
            if r_var = -1 then (*new variabke, we assigne value*)
                let reg = declare_var $1 in 
                SET_VAR (reg, expr)
            else 
                SET_VAR (r_var, expr) (*Variabke already exist, we change the value*)
        ) $3
    }

	| cell ASSIGN when_clauses 
    { 
        make_when (fun expr ->
            if (fst $1) != 0 then error "assigned x must be 0";
            if (snd $1) != 0 then error "assigned y must be 0";
            SET_CELL (0, expr)
        ) $3
    }

	| IF condition THEN opt_statements elif_stmt END{ 
		IF_THEN($2, $4, NOP) 
	}
;


elif_stmt:
	ELSIF condition THEN opt_statements elif_stmt
	{
		IF_THEN($2, $4, $5)
	}
	| ELSE opt_statements { $2 }
	| {NOP} /*No else has been made*/
;


when_clauses:
    expression OTHERWISE
    	{ [($1, NO_COND)] }
|  expression WHEN condition COMMA when_clauses
		{ ($1, $3) :: $5 } /*append the new geneareted (exp, cond) to the when_clause list*/

;

 
condition:
  expression EQUALE expression
  { COMP(COMP_EQ, $1, $3) }
| expression LESS_THAN expression
  { COMP(COMP_LT, $1, $3) }
| expression LESS_THAN_EQUALE expression
  { COMP(COMP_LE, $1, $3) }
| expression GREATER_THAN expression
  { COMP(COMP_GT, $1, $3) }
| expression GREATER_THAN_EQUALE expression
  { COMP(COMP_GE, $1, $3) }
| expression NOT_EQUALE expression
  { COMP(COMP_NE, $1, $3) }
;


cell:
	LBRACKET INT COMMA INT RBRACKET
		{
			if ($2 < -1) || ($2 > 1) then error "x out of range";
			if ($4 < -1) || ($4 > 1) then error "x out of range";
			($2, $4)
		}
;

expression:
  expression PLUS term
  { BINOP(OP_ADD, $1, $3) }
| expression MINUS term
  { BINOP(OP_SUB, $1, $3) }
| term
  { $1 }
;

term:
  term TIMES atom
  { BINOP(OP_MUL, $1, $3) }
| term DEVID atom
  { BINOP(OP_DIV, $1, $3) }
| term MOD atom
  { BINOP(OP_MOD, $1, $3) }
| atom
  { $1 }
;

sign:
  PLUS atom
  { $2 }
| MINUS atom
  { NEG($2) }
;

atom:
  cell
  { CELL(0, fst $1, snd $1) }
| INT
  { CST $1 }
| ID
  {
    let register = get_var $1 in
    if register == -1 then error ("variable not declared");
    VAR(register)
  }
| LPAR expression RPAR
  { $2 }
| sign
  { $1 }
;
