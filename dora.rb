require 'forwardable'
class Dora < MjaiComponentLeaf

  def initialize
    @dora = nil
  end

  extend Forwardable

  def_delegators :@dora, :include?, :count, :each, :to_s

  def start_kyoku(action)
    @dora = []
    @dora << Pai.parse(action['dora_marker']).remove_red.succ
  end

  def dora(action)
    @dora << Pai.parse(action['dora_marker']).remove_red.succ
  end

end
