# -*- coding: utf-8 -*-
class SilicaEvalInfo
  def initialize(shanten, ukeire, points)
    @shanten = shanten
    @ukeire = ukeire
    @points = points
  end

  def to_i
    (-100000) * @shanten + 30 * @ukeire + @points
  end

  def to_s
    "EvalInfo(%d, %d, %d)" % [@shanten, @ukeire, @points]
  end

  attr_reader :shanten, :ukeire, :points
end
