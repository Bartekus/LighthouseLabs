require_relative 'amphibian'
require_relative 'backbone'
require_relative 'swimming'

class Frog < Amphibian

  include Backbone
  include Swimming
  attr_accessor :name, :alive, :extinct, :exothermic, :gills

  def initialize( name = 'Frog', alive, extinct, exothermic, gills, webbed_feet)
    super(name , alive, extinct, exothermic, gills)
    @name = name
    @alive = alive
    @extinct = extinct
    @exothermic = exothermic
    @gills = gills
    @webbed_feet = webbed_feet
  end

end