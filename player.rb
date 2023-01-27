class Player
  attr_reader :score
  attr_reader :name

  def initialize(name)
    @score = 3
    @name = name
  end 

  def lose_life
    @score -= 1
  end

end
