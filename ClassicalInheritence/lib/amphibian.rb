require_relative 'animal'
require_relative 'backbone'
require_relative 'swimming'

class Amphibian < Animal

  include Backbone
  include Swimming
  attr_reader :name, :alive, :extinct, :exothermic, :gills

  def initialize( name = 'Amphibian', alive, extinct, exothermic, gills)
    super(name, alive, extinct)
    @name = name
    @alive = alive
    @extinct = extinct
    @exothermic = exothermic
    @gills = gills
  end

end
