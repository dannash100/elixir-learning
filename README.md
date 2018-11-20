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
