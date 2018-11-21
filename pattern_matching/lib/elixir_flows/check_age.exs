# each line of cond structure is composed of a logical expression. Used when pattern matching is not needed.

{age, _} = Integer.parse IO.gets("Person's age:\n")

result = cond do
  age < 13 -> "kid"
  age <= 18 -> "teen"
  age > 18 -> "adult"
end

IO.puts "Result: #{result}"
