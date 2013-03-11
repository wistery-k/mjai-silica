# -*- coding: utf-8 -*-

class SilicaRiskEstimate < UseMjaiComponent

  # 待ちには3種類有る。
  # - 単騎待ち
  # - シャンポン待ち
  # - その他の待ち
  # 以下、牌の見えてない枚数を断りなくNで表す。

  # 1. 単騎待ち
  #   N通りある。
  # 2. シャンポン待ち
  #   (N, 2) 通りある
  # 3. その他の待ち
  #   全部数える。

  # Machi_Suji_pair
  # 待ちに使う牌と、その場合フリテンになる牌のペア
  # 下両面、カンチャン、上両面
  MS = [[[-2, -1], -3], [[-1, 1], nil], [[1, 2], 3]]

  def initialize
    @id = nil
    @anpais = Array.new(4)
    @reaches = Array.new(4)
    @pai_count = add_component(PaiCount.new)
  end

  def estimate(pai)

    pai = pai.remove_red
    ans = 0

    n = @pai_count[pai.to_i]

    (0..3).each do |who|

      next if who == @id || @anpais[who].include?(pai)
      
      ans += n
      ans += n * (n-1) / 2 # (n, 2)
      
      if !pai.jihai?
        (0..2).each do |i|
          furiten_dx = MS[i][1]
          
          if furiten_dx
            num = pai.num + furiten_dx
            next if num >= 0 && num <= 9 && @anpais.include?(Pai.new(pai.suit, num, false))
          end
          
          upai = MS[i][0]
          
          ans += upai.map {|dx|
            @pai_count[pai.num + dx]
          }.inject(:*)
          
        end
      end
    end      

    return ans

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
        @anpais[i] << pai.remove_red
      end
    end
  end

  def reach(action)
    @reaches[action['actor']] = true
  end

end
