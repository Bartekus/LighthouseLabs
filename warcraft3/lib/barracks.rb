class Barracks

  attr_reader :health_points, :gold, :food, :lumber

  def initialize
    @health_points = 500
    @gold = 1000
    @food = 80
    @lumber = 500
  end

  def damage(attack_power)
    @health_points -= attack_power
  end

  def can_train_peasant?
    if (gold >= 90) && (food >= 5)
      true
    else
      false
    end
  end

  def can_train_footman?
    if (gold >= 135) && (food >= 2)
      true
    else
      false
    end
  end

  def can_train_siege_engine?
    if (gold >= 200) && (food >= 3) && (lumber >= 60)
      true
    else
      false
    end
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def train_siege_engine
    if can_train_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      SiegeEngine.new
    end
  end

end
