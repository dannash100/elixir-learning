# greater checks two numbers, first argument will be true if number is greater than second number
# check handles these two possibilities, wildcard tells elixir we don't need this

defmodule NumberCompare do
  def greater(number, other_number) do
    check(number >= other_number, number, other_number)
  end

  defp check(true, number, _), do: number
  defp check(false, _, other_number), do: other_number
end

# one function returns the first number, the other returns the second.
# the when expression is the guard clause. when its true the function will be executed
# if it is false it will run the second function clause

defmodule NumberCompare2 do
  def greater(number, other_number) when number >= other_number, do: number
  def greater(_, other_number), do: other_number
end

