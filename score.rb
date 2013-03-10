require 'forwardable'

class Score < MjaiComponentLeaf

  def initialize
    @scores = nil
  end

  extend Forwardable

  def_delegators :@scores, :[], :count, :to_s

  def start_game(action)
    @scores = Array.new(4, 25000)
  end

  def reach_accepted(action)
    @scores = action['scores']
  end

  def hora(action)
    @scores = action['scores']
  end

  def ryukyoku(action)
    @scores = action['scores']
  end

end
