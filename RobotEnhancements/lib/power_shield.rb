class PowerShield < Item

  attr_reader :capacity

  def initialize
    super('Power Shield', 0)
    @capacity = 50
  end

  def absorb(damage)
    puts "Shield #{damage}"
    if damage >= capacity
      @capacity = 0
      damage - capacity
    else
      @capacity -= damage
      0
    end
  end

end
