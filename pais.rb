require 'pai'

module Pais

  module_function

  def MAN(n)
    Pai.new(0, n, false)
  end
  def PIN(n)
    Pai.new(1, n, false)
  end
  def SOU(n)
    Pai.new(2, n, false)
  end
  
  TON   = Pai.new(3, 0, false)
  NAN   = Pai.new(3, 1, false)
  XIA   = Pai.new(3, 2, false)
  PEI   = Pai.new(3, 3, false)
  HAKU  = Pai.new(3, 4, false)
  HATSU = Pai.new(3, 5, false)
  CHUN  = Pai.new(3, 6, false)

  def JIHAIS
    [TON, NAN, XIA, PEI, HAKU, HATSU, CHUN]
  end

  def FONPAIS
    [TON, NAN, XIA, PEI]
  end

  def SANGENPAIS
    [HAKU, HATSU, CHUN]
  end
end
