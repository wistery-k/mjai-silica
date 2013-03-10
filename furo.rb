require 'forwardable'

class Furo < MjaiComponentLeaf

  def initialize
    @id = nil
    @furo = nil
  end

  extend Forwardable

  def_delegators :@furo, :include?, :[], :any?, :all?, :count, :length, :empty?, :to_s

  def start_game(action)
    @id = action['id']
  end

  def start_kyoku(action)
    @furo = []
  end

  # helper
  def naki(action)
    if action['actor'] == @id
      pai = Pai.parse(action['pai'])
      consumed = action['consumed'].map{|s|Pai.parse(s)}
      @furo << { :type => :pon, :pai => pai, :consumed => consumed }
    end
  end

  def chi(action)
    naki(action)
  end

  def pon(action)
    naki(action)
  end

  def daiminkan(action)
    naki(action)
  end

  def ankan(action)
    if action['actor'] == @id
      consumed = action['consumed'].map{|s|Pai.parse(s)}
      @furo << {:type => :ankan, :consumed => consumed }
    end
  end

  def kakan(action)
    if action['actor'] == @id
      pai = Pai.parse(action[:pai])
      (0...@furo.length).each do |i|
        f = @furo[i]
        if f[:type] == :pon && f[:pai] == pai && f[:consumed].all?{|p|p==pai}
          f[:consumed] << pai
        end
      end
    end
  end
  
end
