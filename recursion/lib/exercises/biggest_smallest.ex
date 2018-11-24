defmodule MyList do
  def max([]), do: []
  def max([a]), do: a
  def max([a, b | rest]) when a >= b do
    max([a | rest])
  end
  def max([a, b | rest]) do
    max([b | rest])
  end
end
