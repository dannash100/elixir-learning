defmodule TRAddSum do
    def add_up(n), do: up_to(n, 0)
    defp up_to(0, acc), do: acc
    defp up_to(n, acc), do: n + up_to(n - 1, n + acc)

    def sum(n), do: sum_of(n, 0)
    def sum_of([], acc), do: acc
    def sum_of([head | tail], acc), do: sum_of(tail, head + acc)
end
