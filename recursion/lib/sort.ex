
# if merge empty list with another list - return other list
# find smallest element of list heads
# extract first element of list_a and put it in the first spot in the new list
# tail is made by recursive calls to merge with the remaining elements of a and the full list_b
# before we pass the list to merge, we ensure that lists are sorted

defmodule Sort do
  def ascending([]), do: []
  def ascending([a]), do [a]
  def ascending(list), do
    half_size = div(Enum.count(list), 2)
    {list_a, list_b} = Enum.split(list, half_size)
    merge(
      ascending(list_a),
      ascending(list_b)
    )
  end

  defp merge([], list_b), do: list_b
  defp merge(list_a, []), do: list_a
  defp merge([head_a | tail_a], list_b = [head_b | _]) when head_a <= head_b do
    [head_a | merge(tail_a, list_b)]
  end
  defp merge(list_a = [head_a | _], [head_b | tail_b]) when head_a > head_b do
    [head_b | merge(list_a, tail_b)]
  end
end
