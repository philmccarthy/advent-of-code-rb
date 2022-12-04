require 'csv'

data = CSV.readlines(ARGV[0])

data.each do |row|
  row.map! do |assignment|
    range = assignment.split('-')
    Range.new(range.first.to_i, range.last.to_i)
  end
end

# Part 1
puts "In how many assignment pairs does one range fully contain the other?"
puts data.count { |row| row[0].cover?(row[1]) || row[1].cover?(row[0]) }

# Part 2
puts "In how many assignment pairs do the ranges overlap?"
puts data.count { |row| row[0].cover?(row[1].first) || row[1].cover?(row[0].first) }
