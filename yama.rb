class Yama < MjaiComponentLeaf

  # member
  # @length

  def initialize
    @id = nil
    @length = nil
  end

  def start_kyoku(action)
    @length = 70 # 136 - 13 * 4 - 14
  end

  def tsumo(action)
    @length -= 1
  end

  attr_accessor :length

end
