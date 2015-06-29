module Swimming

  def swimming_velocity(speed)
    @swimming_velocity = speed
  end

  def swim
    p "I'm a #{self.class}, I'm Swimming!"
  end
end
