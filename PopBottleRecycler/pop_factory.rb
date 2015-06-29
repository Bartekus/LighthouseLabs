require_relative('bottle')
require_relative('cap')
require_relative('content')
require_relative('pop')

class PopFactory

def initialize
  @cash = 0
  @new_stock = [ ]
  @rec_stock = [ ]
  @bottles = [ ]
  @caps = [ ]
  @content = [ ]
end

def create_pop
  if @cash >= 200
    @cash -= 200
    @new_stock << Pop.new
  end
end

def sell
  unless @new_stock.empty?
    @new_stock.shift
  end
end

def buy_rec_stock(rec_pop)
  @rec_stock << rec_pop
end

def rec_pop
  unless @rec_stock.empty?
    recycled_pop = @rec_stock.shift
    if recycled_pop.include?(Bottle.class) || recycled_pop.include?(Cap.class)
      @bottles << recycled_pop.select{|x| x.is_a?(Bottle)}
      @caps << recycled_pop.select{|x| x.is_a?(Cap)}
    end

  end
end

def rec_cap

end

def refill

end

end
