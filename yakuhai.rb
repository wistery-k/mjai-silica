require 'pais.rb'
class Yakuhai < MjaiComponentLeaf

  def initialize
    @id = nil
    @bakaze = nil
    @jikaze = nil
  end

  attr_reader :bakaze, :jikaze

  def check(pai)
    ([@bakaze, @jikaze] + Pais.SANGENPAIS).include?(pai)
  end

  def count(pai)
    ([@bakaze, @jikaze] + Pais.SANGENPAIS).count(pai)
  end

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)
    @bakaze = Pai.parse(action['bakaze'])
    @jikaze = Pais.FONPAIS[(@id - action['oya'] + 4) % 4]
  end

end
