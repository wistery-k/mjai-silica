require 'shanten'

def main

  tehai = Array.new(34, 0)

  n = gets.to_i
  $stderr.puts n
  
  n.times do |t|
    
    if t % 1000 == 0
      $stderr.puts t
    end
    
    34.times do |i|
      tehai[i] = 0
    end
    
    gets.split.map(&:to_i).each do |pai|
      tehai[pai] += 1
    end
    
    puts "%d %d %d" % [Shanten::normal(tehai, 4), Shanten::kokushi(tehai), Shanten::chitoi(tehai)]
  end

end

# entry point
main()
