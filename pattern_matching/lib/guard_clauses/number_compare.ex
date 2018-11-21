# one function returns the first number, the other returns the second.
# the when expression is the guard clause. when its true the function will be executed
# if it is false it will run the second function clause

defmodule NumberCompare2 do
  def greater(number, other_number) when number >= other_number, do: number
  def greater(_, other_number), do: other_number
end

# anonomous version

number_compare = fn
  number, other_number when number >= other_number -> number
  _, other_number -> other_number
end
