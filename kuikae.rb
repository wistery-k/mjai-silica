require 'mjai_component_leaf.rb'

class KuikaeChecker < MjaiComponentLeaf

  def initialize
    @consumed = nil
  end

  def check(pai)
    if @consumed
      p = (@consumed + [pai]).sort
      same_suit = p[0].suit == p[1].suit && p[1].suit == p[2].suit
      kotsu     = p[0].num == p[1].num && p[1].num == p[2].num
      shuntsu   = p[0].num + 1 == p[1].num && p[1].num + 1 == p[2].num
      same_suit && (kotsu || shuntsu)
    else
      false
    end
  end

  def dahai(action)
    @consumed = nil
  end

  def pon(action)
    @consumed = action['consumed'].map{|s|Pai.parse(s)}
  end

  def chi(action)
    @consumed = action['consumed'].map{|s|Pai.parse(s)}
  end

  
end
