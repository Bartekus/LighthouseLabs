class TheCode
  
  def color_cost_adjustment(colors)
    count = colors.size
    count * (count <= 2 ? 10 : 15)
  end

  def boss_inquiry(length, width, *colors)
    cost = 15
    area = length * width
    adjusted_cost = cost + color_cost_adjustment(colors)
    total = area * adjusted_cost * 1.15
    puts "Your total comes to: #{total.round(0.1)}$"
  end

  def little_helper
    terminated = false
    colors = []

    puts "What's the length of the banner?"
    length = gets.chomp.to_i
    puts "What's the width of the banner?"
    width = gets.chomp.to_i

    until terminated
      puts "What's the color(s) of the banner?"
      colors.push(gets.chomp)
      puts "Another one? Type 'y' / 'yes' to continue or just press enter to abort"
      answer = gets.chomp.downcase
      (answer == 'y' || answer == 'yes') ? (terminated = false) : (terminated = true)
    end
    boss_inquiry(length, width, colors)
  end
  
end

TheCode.new.little_helper