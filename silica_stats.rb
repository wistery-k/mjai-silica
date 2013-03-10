require 'use_mjai_component.rb'
require 'furo.rb'
require 'score.rb'

class SilicaStats < UseMjaiComponent

  def initialize
    super
    @id = nil
    @reach  = add_component(Reach.new)
    @furo   = add_component(Furo.new)
    @scores = add_component(Score.new)
    @stat_hora = nil
    @stat_hoju = nil
  end

  def start_game(action)
    super
    @id = action['id']
  end

  def hora(action)
    super
    if action['actor'] == @id then
      @stat_hora = action['hora_points']
    elsif action['target'] == @id then
      @stat_hoju = action['hora_points']
    end
  end

  def end_kyoku(action)
    super
    File.open('stats.txt', 'a') do |f|
      f.puts [@reach.check, @furo.length, @stat_hora || 0, @stat_hoju || 0].join(' ')
    end
  end

  def end_game(action)
    super
    File.open('results.txt', 'a') do |f|
      f.puts Util::juni(@scores, @id)
    end
  end

end
