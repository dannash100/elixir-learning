# pass navigate .., which path expand will transform into a complete path, passed to go_through as a list
# go_through: stop clause for empty directory, another clause for navigating the contents of that directory.
# for each piece of content, try to print the path, and navigate through its children.
# recursive call to keep navigating through contents.
# print_and_navigate: clause checks dir? flag stop iteration when it finds something that is not a directory.
# otherwise lists all contents using File.ls!
# expand_dir: to check if something is a directory we need a full path of that directory, then continue to explore with go_through.


defmodule Navigator do
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir])
  end

  defp go_through([]), do: nill
  defp go_through([content | rest]) do
    print_and_navigate(content, File.dir?(content))
    go_through(rest)
  end

  defp print_and_navigate(_dir, false), do: nil
  defp print_and_navigate(dir, true) do
    IO.puts dir
    children_dirs = File.ls!(dir)
    go_through(expand_dirs(children_dirs, dir))
  end

  defp expand_dirs([], _relative_to), do: []
  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end
end
