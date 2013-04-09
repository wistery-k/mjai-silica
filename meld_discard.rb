require 'forwardable'

class Meld
  attr_reader :type, :pai, :consumed

  def initialize(type, pai, consumed)
    @type = type
    @pai = pai
    @consumed = consumed
  end
end

class MeldDiscard

  extend Forwardable

  def_delegators :@meld, :type, :pai, :consumed
  attr_reader :discard

  def initialize(meld, discard)
    @meld = meld
    @discard = discard
  end

end
