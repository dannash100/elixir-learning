# elixir-learning
elixir and functional programming

*Notes taken while following Learn Functional Programming with Elixir, 2018, Ulisses Almeida*

## syntax

### function-capturing operator

- Use named function as a value with ```&``` operator
- eg.```upcase = &String.upcase/1```
- create anonymous functions, ```&``` defines beginning of the function followed by the body inside optional parentheses, ```&1, &2``` would then reference first and second argument
- eg.```total_cost = &(&1 * &2)```
