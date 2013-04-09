require 'mjai_component_leaf.rb'
require 'pai.rb'

class KuikaeChecker < MjaiComponentLeaf

  def initialize
    @consumed = nil
  end

  def check(pai)
    if @consumed
      Pai.mentsu?(@consumed + [pai])
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
