file = File.open("input.txt")
input = file.readlines.map(&:chomp).map(&:to_i)

windows = input.each_cons(3).to_a

depth_increases = 0
windows.each_with_index do |window, idx|
  if window.sum > windows[idx - 1].sum
    depth_increases += 1
  end
end

require 'pry'; binding.pry
