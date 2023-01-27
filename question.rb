require './player'

class Question

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @ans = @num1 + @num2
  end

  def generate_question
    print "What does #{@num1} plus #{@num2} euqal?"
  end
    
  def compare_answers(user_input)
    user_input == @ans
  end

end