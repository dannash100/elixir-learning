# Integer.parse returns a tuple with {parsed_info, remaining_info} or :error if failed
# Pattern matching expression will stop the code if it cannot match the result of Integer.parse to the tuple.

user_input = IO.gets "Write your ability score:\n"
{ability_score, _} = Integer.parse(user_input)
ability_modifier = (ability_score - 10) / 2
IO.puts "Your ability modifier is #{ability_modifier}"

