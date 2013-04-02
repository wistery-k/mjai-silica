# -*- coding: utf-8 -*-

class SilicaEvalInfo
  def initialize(pai, shanten, ukeire, points, risk)
    @pai = pai
    @shanten = shanten
    @ukeire = ukeire
    @points = points
    @risk = risk
  end

  def to_i
    (-100000) * @shanten + 30 * @ukeire + @points
  end

  def to_s
    "EvalInfo(%s, %d, %d, %d, %d)" % [@pai, @shanten, @ukeire, @points, @risk]
  end

  attr_reader :pai, :shanten, :ukeire, :points, :risk
end
