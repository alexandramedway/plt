(*
 * COMS4115: Odds abstract syntax tree
 *
 * Authors:
 *  - Alex Kalicki
 *  - Alexandra Medway
 *  - Daniel Echikson
 *  - Lilly Wang
 *)

(* Unary operators *)
type unop =
  | Sub      (* - *) 
  | Not      (* ! *)

(* Binary operators *)
type binop =
  (* Arithmetic *)
  | Add      (* + *)
  | Sub      (* - *)
  | Mult     (* * *)
  | Div      (* / *)
  | Mod      (* % *)
  | Pow      (* ** *)
  (* Boolean *)
  | Or       (* || *)
  | And      (* && *)
  | Eq       (* == *)
  | Neq      (* != *)
  | Less     (* < *)
  | Leq      (* <= *)
  | Greater  (* > *)
  | Geq      (* >= *)

(* Expressions *)
type num =
  | Num_int of int      (* 42 *)
  | Num_float of float  (* 42.0 *)

type expr =
  | Num_lit of num                (* 42 *)
  | String_lit of string          (* "Hello, world" *)
  | Bool_lit of bool              (* true *)
  | Void_lit                      (* void *)
  | Unop of unop * expr           (* -5 *)
  | Binop of expr * binop * expr  (* a + b *)
  | Id of string                  (* x *)
  | Assign of string * expr       (* x = 4 *)
  | Call of expr * expr list      (* add(1, 2) *)
  | List of expr list             (* [1, 2, 3] *)
  | Fdecl of fdecl                (* (x) -> ... return x *)
  | If of expr * expr * expr     (* if true then 42 else 43 *)

(* Function Declarations *)
and fdecl = {
  params: string list;  (* Parameters *)
  body: stmt list;      (* Function Body *)
  return: expr;         (* Return *)
}
  
(* Statements *)
and stmt =
  | Do of expr     (* set foo = bar + 3 *)

(* Program entry point *)
type program = stmt list
