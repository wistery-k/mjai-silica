require 'forwardable'

class PaiCount < MjaiComponentLeaf

  # member
  # @id
  # @pai_count

  def initialize
    @id = nil
    @pai_count = nil
  end

  extend Forwardable

  def_delegator :@pai_count, :[]

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)    
    @pai_count = Array.new(34, 4)

    action['tehais'][@id].map{|s|Pai.parse(s)}.each do |p|
      @pai_count[p.to_i] -= 1
    end
  end

  def tsumo(action)
    if action['actor'] == @id
      @pai_count[Pai.parse(action['pai']).to_i] -= 1
    end
  end

  def dahai(action)
    if action['actor'] != @id
      @pai_count[Pai.parse(action['pai']).to_i] -= 1
    end
  end

  # helper
  def naki(action)
    action['consumed'].map{|s|Pai.parse(s)}.each do |p|
      @pai_count[p.to_i] -= 1
    end
  end

  def pon(action)
    naki(action)
  end

  def chi(action)
    naki(action)
  end

  def ankan(action)
    naki(action)
  end

  def daiminkan(action)
    naki(action)
  end

  def kakan(action)
    @pai_count[Pai.parse(action['pai']).to_i] -= 1
  end
  
end
