class Item

  attr_reader :name, :weight

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

    def weapon?
      self.is_a?(Weapon)
    end

    def item?
      self.is_a?(Item)
    end

    def eatable?
      self.is_a?(BoxOfBolts)
    end

end
