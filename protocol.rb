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

  def pon(actor, target, pai, consumed)
    { :type => 'pon', :actor => actor, :target => target, :pai => pai, :consumed => consumed.map(&:to_s) }
  end

  def chi(actor, target, pai, consumed)
    { :type => 'chi', :actor => actor, :target => target, :pai => pai, :consumed => consumed.map(&:to_s) }
  end

end
