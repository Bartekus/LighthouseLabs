module Flight

  def airspeed_velocity(speed)
    @airspeed_velocity = speed
  end

  def fly
    p "I'm a #{self.class}, I'm flying!"
  end
end
