file = File.open("input.txt")
input = file.readlines.map { |depth| depth.chomp.to_i }

depths_increased = input.each_cons(2).count { |a, b| b > a }

puts "How many measurements are larger than the previous measurement?"
puts  depths_increased
