require_relative 'mammal'

class Primate < Mammal

  attr_reader :name, :alive, :extinct, :endothermic, :hair, :color_vision

  def initialize( name = 'Primate', alive, extinct, endothermic, hair, color_vision)
    super(name, alive, extinct, endothermic, hair)
    @name = name
    @alive = alive
    @extinct = extinct
    @hair = hair
    @endothermic = endothermic
    @color_vision = color_vision
  end

end
