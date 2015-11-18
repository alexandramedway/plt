(*
 * COMS4115: Odds semantically checked abstract syntax tree
 *
 * Authors:
 *  - Alex Kalicki
 *  - Alexandra Medway
 *  - Daniel Echikson
 *  - Lilly Wang
 *)

open Ast

(* Data types *)
type data_type = 
  | Num
  | String
  | Bool
  | List
  | Unrestrained

(* Expressions *)
type expr = 
  | Num_lit of Ast.num
  | String_lit of string
  | Bool_lit of bool
  | Unop of Ast.unop * expr
  | Binop of expr * Ast.binop * expr
  | Id of string
  | Assign of string * expr
  | Call of expr * expr list
  | List of expr list
  | Fdecl of fdecl

(* Function Declarations *)
and fdecl =
  {
    name: string;          (* Function Name *)
    params: expr list;     (* Parameters *)
    body: stmt list;       (* Function Body *)
    return: expr;          (* Return *)
  }
  
(* Statements *)
and stmt =
  | Do of expr     (* set foo = bar + 3 *)

(* Program entry point *)
type program = stmt list