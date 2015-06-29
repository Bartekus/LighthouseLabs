require_relative('bottle')
require_relative('cap')
require_relative('content')

class Pop

  attr_reader :pop

  def initialize
    @pop = { }
    @pop << Bottle.new
    @pop << Cap.new
    @pop << Content.new
  end

end
