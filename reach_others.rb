class ReachOthers < MjaiComponentLeaf

  def initialize
    @id = nil
    @flg = nil
  end

  def check
    @flg
  end

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)
    @flg = false
  end

  def reach(action)
    if action['actor'] != @id
      @flg = true
    end
  end

end
