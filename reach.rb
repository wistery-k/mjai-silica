class Reach < MjaiComponentLeaf

  def initialize
    @reach = nil
  end

  def check
    @reach
  end

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)
    @reach = false
  end

  def reach_accepted(action)
    if action['actor'] == @id
      @reach = true
    end
  end
end
