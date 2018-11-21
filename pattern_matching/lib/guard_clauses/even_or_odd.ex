# require keyword used because is_even, is_odd are macro functions, which generates code before evaluating it.
# requires are lexically scoped

defmodule EvenOrOdd do
  require Integer

  def check(number) when Integer.is_even(number), do: "even"
  def check(number) when Integer.is_odd(number), do: "odd"
end
