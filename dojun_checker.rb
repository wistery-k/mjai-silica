require 'use_mjai_component.rb'
require 'tehai.rb'
require 'shanten.rb'

class DojunChecker < UseMjaiComponent

  # members

  # @id
  # @tehai
  # @last_pai
  # @flg

  def initialize
    super
    @tehai = add_component(Tehai.new)
    @last_pai = nil
    @flg = nil
  end

  def check
    @flg
  end

  # interface MjaiComponent

  def start_game(action)
    super
    @id = action['id']
  end

  def start_kyoku(action)
    super
    @last_pai = nil
    @flg = false
  end

  def dahai(action)
    super
    if action['actor'] == @id
      @last_pai = nil
      @flg = false
    else
      if @last_pai && @tehai.shanten_added(@last_pai, true) == -1
        @flg = true
      end
      @last_pai = Pai.parse(action['pai'])
    end
  end

end
