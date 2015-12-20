### Constraint System will not constrain:

1) Function parameters if they are passed to a function that is itself a
parameter prior to that function's args being constrained. For example:
```
do call = (f, x) ->
  do f(x)
  do f(2)
  return (* ... *)
```
`x` will not be constrained to a `Num` even though it ought to be. The second 
parameter of `call` will be `Any`.

2) The elements of a list if they are all unconstrained when the list is 
instantiated (i.e. they are all parameters), and a constrained type is cons'd
to the list. For example:
```
do foo = (x, y) ->
    do bar = [x, y]
    do cons(42, bar)
    return (* ... *)
```
Neither `x` nor `y` will be constrained to `Num`. Both parameters of `foo` will
be `Any`.

3) User or standard library-defined "template" functions that work with
multiple types. The type returned will be unconstrained until it is first used:
```
do foo = list_rev([3, 2, 1])  (* foo is of type List[Unconst] *)
do bar = cons("str", foo)     (* bar is now of type List[String] *)
do cons(4, bar)               (* ERROR *)
```