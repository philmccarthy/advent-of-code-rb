data = ARGF.read
elves_calories = data.split("\n\n").map do |elf_calories|
  elf_calories.split("\n").map(&:to_i).sum
end

max = elves_calories.max

puts "Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?"
puts max
