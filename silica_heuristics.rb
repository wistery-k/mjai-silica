# -*- coding: utf-8 -*-
module SilicaHeuristics

  SUHAI_POINT = [0, 2, 4, 5, 6]

  module_function

  # 適当に決めた牌の点数。ほかで差が付かない時のための傾斜。
  def pai_point(pai, yakuhai, dora)
    ans = 1
    if pai.jihai? then
      ans += 1 if yakuhai.check(pai)
      ans += 5 * dora.count(pai)
    else
      ans += SUHAI_POINT[pai.num4]
      ans += 10 if pai.red # 赤ドラ

      dora.each do |d|
        if pai.suit == d.suit then
          diff = (pai.num - d.num).abs
          ans += 8 if diff == 0 # ドラ # 足して10
          ans += 2 if pai.suit != 3 && diff <= 2 # ドラそば
        end
      end

    end
    return ans
  end

end
