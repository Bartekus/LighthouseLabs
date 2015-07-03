class Robot
  @@robots = []
  MAX_WEIGHT          = 250
  WEAK_DEFAULT_ATTACK = 5

  attr_reader :position, :items, :health
  attr_accessor :equipped_weapon, :equipped_shield

  class InvalidTarget < StandardError
  end

  class InvalidCommand < StandardError
  end

  def initialize
    @position        = [0, 0]
    @items           = []
    @health          = 100
    @equipped_weapon = nil
    @equipped_shield = nil
  end

  def x_coord
    @position[0]
  end

  def y_coord
    @position[1]
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def items_weight
    items.map(&:weight).inject(0, :+)
    # items.inject(0) { |sum, item| sum += item.weight }
  end

  def pick_up_safe?(item)
    items_weight + item.weight <= MAX_WEIGHT
  end

  def dead?
    health == 0
  end

  def at_full?
    health == 100
  end

  def below_80?
    health <= 80
  end

  def got_shield?
    @equipped_shield != nil
  end

  def in_reach?(target)
    if equipped_weapon
     within_distance(target, equipped_weapon.range)
    else
     within_distance(target, 1)
    end
  end

  def within_distance(target, distance)
    ((target.x_coord - x_coord).abs <= distance) && ((target.y_coord - y_coord).abs <= distance)
  end

  def valid?(target)
    target.is_a?(Robot)
  end

  def heal!
    raise InvalidTarget, 'Cannot heal a dead target!' if dead?
    raise InvalidCommand, 'Target already at maximum health!' if at_full?
  end

  def attack!(target)
    raise InvalidTarget, 'Cannot attack non-robot targets' unless valid?(target)
  end

  def wound(full_damage)
    unless dead?

      if got_shield?
        damage = equipped_shield.absorb(full_damage)
      else
        damage = full_damage
      end

      puts "Any ?? #{damage}"
      @health - damage <= 0 ? @health = 0 : @health -= damage
    end
  end

  def heal(healing)
    unless at_full? || dead?
      @health + healing >= 100 ? @health = 100 : @health += healing
    end
  end

  def attack(target)
    if valid?(target) && in_reach?(target)
      @equipped_weapon ? @equipped_weapon.hit(target) : target.wound(WEAK_DEFAULT_ATTACK)
    else
       attack!(target)
    end
  end

  def pick_up(item)
      if pick_up_safe?(item)
        @equipped_weapon = item if item.weapon?
        if item.item?
          item.feed(self) if item.eatable? && below_80?
          @equipped_shield = item if item.shield?
          @items.push(item)
        end
      end
  end

end

