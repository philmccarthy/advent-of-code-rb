def ord_to_priority(i)
  if i <= 90
    i - 38
  else
    i - 96
  end
end

data = ARGF.readlines(chomp: true)

badges = []
groups = data.each_slice(3) do |group|
  group.map!(&:chars)
  badges << group[0].intersection(group[1], group[2]).first
end

badges.map! { |group| ord_to_priority(group.ord) }

puts "Find the item type that appears in both compartments of each rucksack. What is the sum of the priorities of those item types?"
puts badges.sum
