# -*- coding: utf-8 -*-
class SilicaEvalInfo
  def initialize(shanten, ukeire, points)
    @shanten = shanten
    @ukeire = ukeire
    @points = points
  end

  def to_i
    (-100000) * @shanten + @ukeire * 30 + @points
  end

  attr_reader :shanten, :ukeire, :points
end
