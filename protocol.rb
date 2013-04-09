module Action

  module_function

  def none()
    { :type => 'none' }
  end
  
  def join(name, room)
    { :type => 'join', :name => name, :room => room }
  end
  
  def dahai(actor, pai, tsumogiri)
    { :type => 'dahai', :actor => actor, :pai => pai.to_s, :tsumogiri => tsumogiri }
  end
  
  def reach(actor)
    { :type => 'reach', :actor => actor }
  end
  
  def hora(actor, target, pai)
    { :type => 'hora', :actor => actor, :target => target, :pai => pai }
  end

  def naki(type, actor, target, pai, consumed)
    { :type => type, :actor => actor, :target => target, :pai => pai, :consumed => consumed.map(&:to_s) }
  end

  def pon(actor, target, pai, consumed)
    naki('pon', actor, target, pai, consumed)
  end

  def chi(actor, target, pai, consumed)
    naki('chi', actor, target, pai, consumed)
  end

  def daiminkan(actor, target, pai, consumed)
    naki('daiminkan', actor, target, pai, consumed)
  end

end
