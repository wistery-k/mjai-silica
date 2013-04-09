require 'forwardable'

class Meld
  attr_reader :type, :pai, :consumed

  def initialize(type, pai, consumed)
    @type = type
    @pai = pai
    @consumed = consumed
  end

  def all?(&b)
    yield(pai) && consumed.all?(&b)
  end

  def any?(&b)
    yield(pai) || consumed.any?(&b)
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

  def consumed_discard
    @meld.consumed + [@discard]
  end

  def all?(&b)
    @meld.all?(&b)
  end

  def any?(&b)
    @meld.any?(&b)
  end

  None = MeldDiscard.new(Meld.new(:none, nil, nil), :nil)

end
