require 'csv'

commands = CSV.read("input.csv", col_sep: " ")
commands.map! { |command| [command[0], command[1].to_i] }

position = {
  horiz: 0,
  depth: 0,
  aim: 0
}

commands.each do |command|
  case command[0]
  when "forward"
    position[:horiz] += command[1]
    position[:depth] += position[:aim] * command[1]
  when "down"
    position[:aim] += command[1]
  when "up"
    position[:aim] -= command[1]
  end
end

answer = position[:horiz] * position[:depth]

puts "Horizontal position: #{position[:horiz]}"
puts "Depth: #{position[:depth]}"
puts "Answer: #{answer}"
