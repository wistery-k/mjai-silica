require 'pai'
require 'forwardable'

require 'mjai_component_leaf.rb'

require 'meld_discard.rb'

class Tehai < MjaiComponentLeaf

  def initialize
    @id = nil
    @tehai = nil
  end

  extend Forwardable
  
  def_delegators :@tehai, :count, :any?, :length, :[], :map, :all?, :select

  def remove(pai)
    @tehai.delete_at(@tehai.index(pai))
  end
  
  def count_array(yakuari)
    counts = Array.new(34, 0)
    @tehai.each do |p|
      if yakuari || !p.yaochu?
        counts[p.to_i] += 1
      end
    end
    counts
  end

  def need_mentsu(dx)
    (@tehai.length - 1 + dx) / 3
  end
  
  def shanten(yakuari, mask)
    Shanten::all(count_array(yakuari), need_mentsu(0), mask)
  end

  def shanten_added(pai, yakuari, mask)
    counts = count_array(yakuari)
    if yakuari || !pai.yaochu?
      counts[pai.to_i] += 1
    end
    return Shanten::all(counts, need_mentsu(+1), mask)
  end

  def shanten_removed(pai, yakuari, mask)
    shanten_list_removed([pai], yakuari, mask)
  end

  def shanten_list_removed(pais, yakuari, mask)
    
    counts = count_array(yakuari)
    pais.each do |pai|
      if yakuari || !pai.yaochu?
        counts[pai.to_i] -= 1
      end
    end
    return Shanten::all(counts, need_mentsu(-pais.length), mask)
  end

  def ukeire(pai_count, yakuari, mask)
    ukeire_list_removed(pai_count, [], yakuari, mask)
  end

  def ukeire_removed(pai_count, pai, yakuari, mask)
    ukeire_list_removed(pai_count, [pai], yakuari, mask)
  end

  def ukeire_list_removed(pai_count, pais, yakuari, mask)
    counts = count_array(yakuari)
    pais.each do |p|
      if yakuari || !p.yaochu?
        counts[p.to_i] -= 1
      end
    end
    current_shanten = Shanten::all(counts, need_mentsu(-pais.length), mask)
    ans = 0
    34.times do |pai|
      if counts[pai] < 4
        if yakuari || !Pai.new(pai / 9, pai % 9, false).yaochu?
          counts[pai] += 1
          if Shanten::all(counts, need_mentsu(-pais.length+1), mask) < current_shanten
            ans += pai_count[pai]
          end
          counts[pai] -= 1
        end
      end
    end
    return ans
  end

  def list_naki(pai)
    ans = []
    cnt = @tehai.count(pai)
    
    ans << Meld.new(:pon,       pai, [pai, pai]) if cnt >= 2
    ans << Meld.new(:daiminkan, pai, [pai, pai, pai]) if cnt >= 3
    
    if !pai.jihai?
      
      pais = [-2, -1, 1, 2].map do |dx|
        nn = pai.num + dx
        if 0 <= nn && nn <= 8
          Pai.new(pai.suit, nn, false)
        else
          nil
        end
      end
      
      cnts = pais.map{|p| p ? @tehai.count(p) : 0}
      
      [0, 1, 2, 3].each_cons(2) do |i, j|
        if cnts[i] >= 1 && cnts[j] >= 1
          ans << Meld.new(:chi, pai, [pais[i], pais[j]])
        end
      end
      
    end
    
    return ans
  end

  def to_s
    @tehai.sort.map{|p|p.to_s}.join(" ")
  end

  # interface MjaiComponent

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)
    @tehai = action['tehais'][@id].map{|s|Pai.parse(s)}
  end

  def tsumo(action)
    if action['actor'] == @id
      @tehai << (Pai.parse(action['pai']))
    end
  end
  
  def dahai(action)
    if action['actor'] == @id
      remove(Pai.parse(action['pai']))
    end
  end

  # helper
  def naki(action)
    if action['actor'] == @id
      action['consumed'].map{|s|Pai.parse(s)}.each do |p|
        remove(p)
      end
    end
  end

  def chi(action)
    naki(action)
  end

  def pon(action)
    naki(action)
  end

  def daiminkan(action)
    naki(action)
  end

  def ankan(action)
    naki(action)
  end

  def kakan(action)
    if action['actor'] == @id
      remove(Pai.parse(action['pai']))
    end
  end
  

end
