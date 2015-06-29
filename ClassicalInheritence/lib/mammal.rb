require_relative 'animal'
require_relative 'backbone'

class Mammal < Animal

  include Backbone
  attr_reader :name, :alive, :extinct, :endothermic, :hair

  def initialize(name = 'Mammal', alive, extinct, endothermic, hair)
    super(name , alive, extinct)
    @name = name
    @alive = alive
    @extinct = extinct
    @endothermic = endothermic
    @hair = hair
  end

end
