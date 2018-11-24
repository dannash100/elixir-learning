defmodule MyList do
  def max([]), do: []
  def max([a]), do: a
  def max([a, b | rest]) do
    max([biggest(a, b) | rest])
  end

  defp biggest(a, b) when a >= b, do: a
  defp biggest(a, b) when a < b, do: b
end


