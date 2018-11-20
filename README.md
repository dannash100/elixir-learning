# elixir-learning
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

### functions

- functions also control program flow, but can do more than pattern matching which just throw errors.
