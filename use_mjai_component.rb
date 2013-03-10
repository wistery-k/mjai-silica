class UseMjaiComponent

  def initialize
    @components = []
  end

  def add_component(c)
    @components << c
    c
  end

  def hello(action)
    @components.each do |c|
      c.hello(action)
    end
  end

  def start_game(action)
    @components.each do |c|
      c.start_game(action)
    end
  end

  def start_kyoku(action)
    @components.each do |c|
      c.start_kyoku(action)
    end
  end

  def dahai(action)
    @components.each do |c|
      c.dahai(action)
    end
  end

  def tsumo(action)
    @components.each do |c|
      c.tsumo(action)
    end
  end

  def reach(action)
    @components.each do |c|
      c.reach(action)
    end
  end

  def reach_accepted(action)
    @components.each do |c|
      c.reach_accepted(action)
    end
  end

  def pon(action)
    @components.each do |c|
      c.pon(action)
    end
  end

  def chi(action)
    @components.each do |c|
      c.chi(action)
    end
  end

  def ankan(action)
    @components.each do |c|
      c.ankan(action)
    end
  end

  def daiminkan(action)
    @components.each do |c|
      c.daiminkan(action)
    end
  end

  def kakan(action)
    @components.each do |c|
      c.kakan(action)
    end
  end

  def dora(action)
    @components.each do |c|
      c.dora(action)
    end
  end

  def hora(action)
    @components.each do |c|
      c.hora(action)
    end
  end

  def ryukyoku(action)
    @components.each do |c|
      c.ryukyoku(action)
    end
  end

  def end_kyoku(action)
    @components.each do |c|
      c.end_kyoku(action)
    end
  end

  def end_game(action)
    @components.each do |c|
      c.end_game(action)
    end
  end

end
