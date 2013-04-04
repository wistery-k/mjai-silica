require 'use_mjai_component.rb'
require 'tehai.rb'
require 'reach.rb'

require 'shanten.rb'

class FuritenChecker < UseMjaiComponent

  # members
  # @id
  # @tehai
  # @reach
  # @furiten_list

  def initialize
    super
    @id = nil
    @reach = add_component(Reach.new)
    @furiten_list = nil

  end

  def check(tehai)
    @furiten_list.any? do |pai|
      tehai.shanten_added(pai, true, Shanten::ALL) == -1
    end
  end

  # interface MjaiComponent

  def start_game(action)
    super
    @id = action['id']
  end

  def start_kyoku(action)
    super
    @furiten_list = []
  end

  def dahai(action)
    super
    if action['actor'] == @id || @reach.check
      @furiten_list << Pai.parse(action['pai'])
    end
  end

end
