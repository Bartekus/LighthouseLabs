class Question

  @number1 = nil
  @number2 = nil
  @method  = nil
  @factor  = nil

  def self.generate
    (@number1, @number2) = 2.times.map { rand(1...100) }
    @method =
      case rand(1..4)
        when 1 then '+'
        when 2 then '-'
        when 3 then '*'
        else '/'
      end
    if @method == '/'
      @factor  = @number1 * @number2
      question = [@factor, @method, @number1]
    else
      question = [@number1, @method, @number2]
    end
    question.flatten.compact.join(' ')
  end

  def self.solution
    case @method
      when '+' then return @number1 + @number2
      when '-' then return @number1 - @number2
      when '*' then return @number1 * @number2
      when '/' then return @number2
      else nil
    end
  end
end
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
