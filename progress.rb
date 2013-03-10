class Progress < MjaiComponentLeaf

  def initialize
    @kyoku = nil
    @honba = nil
    @kyotaku = nil
  end

  attr_reader :kyoku, :honba, :kyotaku
  
  def start_kyoku(action)
    @kyoku = action['kyoku']
    @honba = action['honba']
    @kyotaku = action['kyotaku']
  end
end
