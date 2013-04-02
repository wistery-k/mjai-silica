class Pai

  def initialize(suit, num, red)
    @suit = suit
    @num = num
    @red = red
  end

  def self.parse(str)
    if str.length == 1 then
      Pai.new(3, 'ESWNPFC'.index(str), false)
    else
      Pai.new('mps'.index(str[1]), str[0].to_i - 1, str.length == 3)
    end
  end

  def self.nan
    Pai.new(3, 7, false) # 34
  end

  def jihai?
    @suit == 3
  end

  def yaochu?
    jihai? || num4 == 0
  end

  attr_reader :num, :suit, :red

  def num4
    4 - (4 - @num).abs
  end

  def remove_red
    Pai.new(@suit, @num, false)
  end

  def tanyaoize
    if yaochu? then Pai.nan else dup end
  end

  def to_i
    9 * @suit + @num
  end

  def to_s
    if @suit == 3 then
      'ESWNPFC?'[@num]
    else
      (@num+1).to_s + 'mps'[@suit] + (@red ? 'r' : '')
    end
  end

  def ==(other)
    if self.class != other.class then
      false
    else
      @num == other.num && @suit == other.suit && @red == other.red
    end
  end

  def <=>(other)
    if self.class == other.class then
      self.to_i <=> other.to_i
    else
      raise(ArgumentError, "Pai: invalid comparison")
    end
  end
end
