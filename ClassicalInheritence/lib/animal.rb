class Animal

@@animals = []

attr_reader :name, :alive, :extinct

  def initialize( name = 'Animal', alive, extinct )
    @name = name
    @alive = alive
    @extinct = extinct
  end

end
