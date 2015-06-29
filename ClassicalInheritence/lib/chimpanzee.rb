require_relative 'primate'

class Chimpanzee < Primate

  attr_reader :name, :alive, :extinct, :endothermic, :hair, :color_vision, :flat_face

  def initialize( name = 'Chimpanzee', alive, extinct, endothermic, hair, color_vision, flat_face)
    super(name, alive, extinct, endothermic, hair, color_vision)
    @name = name
    @alive = alive
    @extinct = extinct
    @endothermic = endothermic
    @hair = hair
    @color_vision = color_vision
    @flat_face = flat_face
  end

end
