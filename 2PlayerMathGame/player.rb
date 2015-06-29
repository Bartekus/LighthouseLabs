class Player
  attr_reader :name
  attr_accessor :answer, :score, :life

  def initialize(name, life = 3, score = 0, answer = nil)
    @name   = name
    @answer = answer
    @score  = score
    @life   = life
  end

  def gain_a_point
    @score += 1
  end

  def lose_a_life
    @life -= 1
  end
end
