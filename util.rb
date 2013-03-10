module Util

  module_function
  
  def juni(scores, who)
    my_score = scores[who]
    scores.count{|sc|sc > my_score} + 1
  end

end
