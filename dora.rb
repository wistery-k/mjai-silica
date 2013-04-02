require 'forwardable'
class Dora < MjaiComponentLeaf

  def initialize
    @dora_marker = nil
  end

  extend Forwardable

  def_delegators :@dora_marker, :to_s

  def is_dora(pai, marker)
    return false if pai.suit != marker.suit

    if pai.jihai?
      pai.num == [1,2,3,0,5,6,4][marker.num]
    else
      pai.num == (marker.num + 1) % 9
    end
  end
  
  def check(pai)
    @dora_marker.any? do |marker|
      is_dora(pai, marker)
    end
  end

  def count(pai)
    @dora_marker.count do |marker|
      is_dora(pai, marker)
    end
  end
  
  def start_kyoku(action)
    @dora_marker = []
    @dora_marker << Pai.parse(action['dora_marker'])
  end

  def dora(action)
    @dora_marker << Pai.parse(action['dora_marker'])
  end

end
