# case is used to handle two scenarios, valid input and invalid input.
# add our expressions to match to results, in this case :error and parse results.

user_input = IO.gets "Write your ability score:\n"
case Integer.parse(user_input) do
  :error -> IO.puts "Invalid ability score: #{user_input}"
  {ability_score, _} ->
    ability_modifier = (ability_score - 10) / 2
    IO.puts "Your ability modifier is #{ability_modifier}"
end
