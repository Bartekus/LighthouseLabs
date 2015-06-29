require_relative 'animal'
require_relative 'backbone'
require_relative 'flight'

class Parrot < Animal

  include Backbone
  include Flight
  attr_reader :name, :alive, :extinct, :endothermic, :beak

  def initialize( name = 'Frog', alive, extinct, endothermic, beak )
    super(name , alive, extinct )
    @name = name
    @alive = alive
    @extinct = extinct
    @endothermic = endothermic
    @beak = beak
  end

end
