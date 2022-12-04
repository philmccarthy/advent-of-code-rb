def ord_to_priority(i)
  if i <= 90
    i - 38
  else
    i - 96
  end
end

rucksacks = ARGF.readlines(chomp: true)

# Split each rucksack into its 2 compartments
rucksacks.map! { |sack| [sack[0..(sack.length / 2) - 1], sack[(sack.length / 2)..-1]]}

# Find the one matching element (the mistake) in each compartment
rucksacks.map! { |compartments| compartments[0].chars.intersection(compartments[1].chars)}.flatten!

# Calculate priority of the mistake
rucksacks.map! { |mistake| ord_to_priority(mistake.ord) }

puts "Find the item type that corresponds to the badges of each three-Elf group. What is the sum of the priorities of those item types?"
puts rucksacks.sum
