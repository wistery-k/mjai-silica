# -*- coding: utf-8 -*-
class SilicaRiskEstimate < MjaiComponentLeaf

  SUJI = [[3], [4], [5], [0, 6], [1, 7], [2, 8], [3], [4], [5]]
  DEFAULT_RISK = [5, 6, 7, 11, 11, 11, 7, 6, 5]

  def initialize
    @id = nil
    @anpais = Array.new(4)
    @reaches = Array.new(4)
  end

  def estimate(pai)
    pai = pai.remove_red

    (0..3).map {|who|
      
      if who == @id || !@reaches[who]
        0
      else
        anpai = @anpais[who].map{|p| p.remove_red}
        
        if anpai.include?(pai)
          0
        elsif pai.suit == 3
          1
        else
          # 筋に掛かってると危険度が下がる
          cnt = SUJI[pai.num].count{|i|anpai.include?(Pai.new(pai.suit, i, false))}
          DEFAULT_RISK[pai.num - 1] - 4 * cnt
        end
      end

    }.inject(&:+)
  end

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)
    4.times do |i|
      @anpais[i] = Array.new
      @reaches[i] = false
    end
  end

  def dahai(action)
    actor = action['actor']
    pai = Pai.parse(action['pai'])

    4.times do |i|
      if i == actor || @reaches[i]
        @anpais[i] << pai
      end
    end
  end

  def reach(action)
    @reaches[action['actor']] = true
  end

end
