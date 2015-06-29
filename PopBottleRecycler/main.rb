require_relative 'bottle'

#cash in pennies / $100 = 10,000

@purchase = []
@cash = 10000
@rec_bottles_cash = 0
@rec_caps_cash = 0

def x

end

def buy
  while @cash > 0
    @cash -= 200
    @purchase << Bottle.new
  end
end

def recycle
  while @purchase.count > 0
    @rec_bottles_cash += 100
    @rec_caps_cash += 50
    @purchase.delete_at(0)
  end
end

def cash_in
  @cash += @rec_bottles_cash
  @rec_bottles_cash = 0
  @cash += @rec_caps_cash
  @rec_caps_cash = 0
end


while x

end

buy
recycle
cash_in



p "\n\n\n\tCash: #{@cash} Recycled Bottles \n\tCash: #{@rec_bottles_cash} \n\tRecycled Caps Cash: #{@rec_caps_cash}\n\n\n"


