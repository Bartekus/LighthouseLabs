class BoxOfBolts < Item

def initialize
  super('box of bolts', 25)
end

  def feed(target)
    target.heal(20)
  end

end
