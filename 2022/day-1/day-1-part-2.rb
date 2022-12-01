data = ARGF.read
elves_calories = data.split("\n\n").map do |elf_calories|
  elf_calories.split("\n").map(&:to_i).sum
end

max_three = elves_calories.max(3)

puts "Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?"
puts max_three.sum
