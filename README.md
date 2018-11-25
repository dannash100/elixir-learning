          _ _      _      
      ___| (_)_  _(_)_ __ 
     / _ \ | \ \/ / | '__|
    |  __/ | |>  <| | |   
     \___|_|_/_/\_\_|_|   

elixir and functional programming

*Notes taken while following Learn Functional Programming with Elixir, 2018, Ulisses Almeida*

## syntax

### function-capturing operator

- use named function as a value with ```&``` operator
- eg.```upcase = &String.upcase/1```
- create anonymous functions, ```&``` defines beginning of the function followed by the body inside optional parentheses, ```&1, &2``` would then reference first and second argument
- eg.```total_cost = &(&1 * &2)```

### destructuring data types

- To make the left side match the right side of an expression elixir can create complex bindings.
- it is important to realize that in elixir ```=``` isn't just for binding variables, it can be used for pattern matching, creating checks and unpacking values of different data types.
- pattern matching is used in Elixir to manage program flow

#### string matching

- ```<>``` operator is used to check beginning of a string, useful for checking text organized in key/value pairs.

```elixir
iex> "Authentication:" <> credentials = "Authentication: Basic dXNlcjpwYXNz"
iex> credentials
"Basic dXNlcjpwYXNz"
```

#### tuples

- ```{a, b, c} = {4, 5, 6}```: bind to variables with simple expression
- tuples are also useful for signaling successes and failures in a functions return.
- return a tuple where the first item will be an ```:ok```, use pattern matching to only let the program run when the result is successful.

```elixir
test = fn -> {:ok, 42} end
{:ok, answer} = test.()
IO.puts answer
```

- program will stop at the comparison if incorrect.

#### lists

- linked lists, each item contains implicit reference to next element.
- a list ends by linking to an empty list, this is useful for checking for last item in recursive iteration
- lists can be destructed in the same way as tuple example.
- pattern matching example:

```elixir
[_, a, _] = [10, 2, 12]
# a assigned to 2
[_, a, a] = [16, 4, 4]
# a assigned to 4
```

- special ```|``` operator for lists is used to sperate some elements from the rest of a list
- ```[ head | tail ]``` left side will match first item of a list, and tail will match the rest.
- ```[ a, b | rest ]```

#### maps

- ```%{key: value}``` can also represent complex nested data
- pattern matching:

```elixir
abilities = %{strength: 16, dexterity: 12, intelligence: 10}
%{strength: strength_value, dexterity: 12} = abilities
# strength_value assigned to 16 and map must have a key of dexterity with a value of 12
```

#### keyword lists

- list of two-element tuples, allows duplicated keys but they must be atoms unlike maps which can use any data type as a key.

#### structs

- extension of mapping structures, used in representing consistent structures that have the same set of keys everywhere in a project with a common list of attributes
- everything that is used on maps can be used on structs
- start structs with *sigils*, e.g for word list without quotes use ```~w(cat dog man)```
- Date struc:

```elixir
date = ~D[2018-01-01]
%{year: year} = date
# year assigned as 2018
```

## functions

- functions also control program flow, but can do more than pattern matching which just throw errors.
- default values specified with ```//```
- multiple ```defs``` must be wrapped in ```defmodule```

### clauses
*see pattern_matching/lib/number_compare.ex*

- multiple function definitions are called function clauses, you can create as many as you need as long as they are defined in sequence.
- elixir will execute the function of the first clause that matches.
- ```defp``` defines a private function, they cannot be imported or accessed from the outside.

#### guard clauses
*see pattern_matching/lib/guard_clauses/*

- as an alternative to making multiple auxiliary function clauses
- guard clauses use ```when``` keyword
- can be used to enforce data types
- define macro function for reusing common guard clauses with the ```defguard``` directive
- generated code in macro functions must adhere to the list of allowed functions in guard clauses.

## control-flow structures

### case, cond, if and unless
*see pattern_matching/lib/elixir_flows for examples*

## recursion

### bounded recursion

- type of function where the successive calls to itself have an end called the boundary clause, every time it is called it requires fewer iterations to finish.
- number of repetitions directly associated with the arguments it receives
- navigate recursively through lists with ```[head | tail]``` by returning the tail each time.

### transforming lists
*see recursion/lib/enchanter_shop.ex*

- data is immutable in functional programming - transforming data builds new data.
- prepending and element to a list is many times faster than appending with the ```++``` operator.

### divide-and-conquer
*see recursion/lib/sort.ex*

- technique where a larger processes i.e queries are split into smaller independent operations then combined or reassembled.
- another example is sorting a list by dividing the list in half into smaller and smaller manageable lists.
- in sort example, the recursive call to ascending can work independently, they can compute in parralel, this algorithimn is known as ```merge sort```

### tail-call optimization
*see recursion/lib/tr_factorial.ex*

- replace the use of the function result with an extra argument that accumulates the results of each iteration
- constant and low memory consumption while performing recursive operations

### unbounded recursion
*see recursion/lib/depth_navigator.ex*

- when we cannot predict the number of repetitions for a recursive function. i.e a web-crawler navigating webpages.
- add restrictions to prevent an unbound recursion from running too long. i.e a depth restriction or a timer.

## higher-order functions
