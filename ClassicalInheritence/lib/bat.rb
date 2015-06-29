require_relative 'mammal'
require_relative 'backbone'
require_relative 'flight'

class Bat < Mammal

  include Flight
  include Backbone


  attr_reader :name, :alive, :extinct, :endothermic, :hair, :nocturnal

  def initialize( name = 'Bat', alive, extinct, endothermic, hair, nocturnal)
    super(name, alive, extinct, endothermic, hair)
    @name = name
    @alive = alive
    @extinct = extinct
    @endothermic = endothermic
    @hair = hair
    @nocturnal = nocturnal
  end

end
