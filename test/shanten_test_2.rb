require 'shanten'

counts = [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 0]
need_mentsu = 3

puts "normal:"
puts Shanten::normal(counts, need_mentsu)
