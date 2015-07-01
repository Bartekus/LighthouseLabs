class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  class InvalidTarget < StandardError
  end

  class InvalidCommand < StandardError
  end

  def attack!(enemy)
    unless enemy.is_a?(Barracks)
      raise InvalidTarget, "Cannot attack dead unit!" if enemy.dead?
      raise InvalidCommand, "Cannot issue commands to a dead unit!" if self.dead?
    end
    enemy.damage(attack_power)
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def dead?
    if @health_points <= 0
      true
    else
      false
    end
  end

end
