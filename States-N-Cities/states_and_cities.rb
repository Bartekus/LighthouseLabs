# States & Cities

@states = {
  OR: 'Oregon',
  FL: 'Florida',
  CA: 'California',
  NY: 'New York',
  MI: 'Michigan'
}


# Task #1 Adding to a hash @states
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task 1"
puts %q(
  @states = {:WA => 'Washington'}
  @states[:TX] = 'Texas'
)

@states = {:WA => 'Washington'}
@states[:TX] = 'Texas'


# Task #2 Creating cities{} 'hash' with values as another hash of cities.
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task2"
puts %q(
  @cities = {
    OR: ['Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro'],
    FL: ['Jacksonville', 'Miami', 'Tampa', 'Orlando', 'St. Petersburg'],
    CA: ['LA', 'San Diego', 'San Jose', 'San Francisco','Fresno'],
    NY: ['New York', 'Buffalo', 'Rochester', 'Yonkers', 'Syracuse'],
    MI: ['Detroit', 'Grand Rapids', 'Warren', 'Sterling Heights', 'Lansing']
  }
)

@cities = {
  OR: ['Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro'],
  FL: ['Jacksonville', 'Miami', 'Tampa', 'Orlando', 'St. Petersburg'],
  CA: ['LA', 'San Diego', 'San Jose', 'San Francisco', 'Fresno'],
  NY: ['New York', 'Buffalo', 'Rochester', 'Yonkers', 'Syracuse'],
  MI: ['Detroit', 'Grand Rapids', 'Warren', 'Sterling Heights', 'Lansing']
}


# Task #3 Defining a method describe_state that takes an input and returns details of that state.
# describe_state('CA') => 'CA is for California. It has 2 major cities: San Francisco, LA'
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task3"
puts %q(
  def describe_state(state)
  state   = state.to_sym
  result  = ''
  message = print "#{state.to_s.upcase} is for #{@states[state]}. It has these major cities: "
  result.concat(message.to_s)

  counter       = 0
  cities_length = @cities[state].length

  @cities[state].each do |city|

    result.concat("#{city}")
    counter += 1

    if cities_length == counter
      result.concat(".")
    else
      result.concat(", ")
    end
  end
  print "#{result}\n"
end

describe_state('CA')
)

def describe_state(state)
  state   = state.to_sym
  result  = ''
  message = print "#{state.to_s.upcase} is for #{@states[state]}. It has these major cities: "
  result.concat(message.to_s)

  counter       = 0
  cities_length = @cities[state].length

  @cities[state].each do |city|

    result.concat("#{city}")
    counter += 1

    if cities_length == counter
      result.concat(".")
    else
      result.concat(", ")
    end
  end
  print "#{result}\n"
end

describe_state('CA')

# Task #4 Declaring Hash taxes{}
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task4"
puts %q(
@taxes = {
  OR: 0.00,
  FL: 6.62,
  CA: 8.41,
  NY: 8.47,
  MI: 6.00
)

@taxes = {
  OR: 0.00,
  FL: 6.62,
  CA: 8.41,
  NY: 8.47,
  MI: 6.00
}

# Task #5 Define method calculate_tax that accepts state and amount as input and returns tax amount based on the indicated state and rounded to 2nd decimal place.
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task5"
puts %q(
def calculate_tax(state, amount)
  state       = state.to_s.to_sym
  amount      = amount.to_f
  calculation = 0
  rate        = @taxes[state]
  if rate != 'none'
    calculation = amount.send '*', (rate/100)
  end
  p calculation.round(2)
end

calculate_tax('CA', 123.49)
)

def calculate_tax(state, amount)
  state       = state.to_s.to_sym
  amount      = amount.to_f
  calculation = 0
  rate        = @taxes[state]
  if rate != 'none'
    calculation = amount.send '*', (rate/100)
  end
  p calculation.round(2)
end

calculate_tax('CA', 123.49)


# Task #6 Define method find_state_for_city that takes city name as input and returns the state code for where that city is located.
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task6"
puts %q(
def find_state_for_city(state_find)

  @cities.select do |states|
    if @cities[states].include? (state_find)
      puts states
    else
      nil
    end
  end
end

find_state_for_city('Tampa')
)
def find_state_for_city(state_find)

  @cities.select do |states|
    if @cities[states].include? (state_find)
      puts states
    else
      nil
    end
  end
end

find_state_for_city('Tampa')

# Task #7 Refactor
print "\n-------------------------------------------------------------------------------------------------\n"
puts "Task7"
puts %q(
@states_and_cities = {
  OR: ['Oregon', 'Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro', '0.00'],
  FL: ['Florida', 'Jacksonville', 'Miami', 'Tampa', 'Orlando', 'St. Petersburg', '6.62'],
  CA: ['California', 'LA', 'San Diego', 'San Jose', 'San Francisco', 'Fresno', '8.41'],
  NY: ['New_York', 'New York', 'Buffalo', 'Rochester', 'Yonkers', 'Syracuse', '8.47'],
  MI: ['Michigan', 'Detroit', 'Grand Rapids', 'Warren', 'Sterling Heights', 'Lansing', '6.00'],
  WA: ['Washington', 'Seattle', 'Spokane', 'Tacoma', 'Vancouver', 'Bellevue', '8.88'],
  TX: ['Texas', 'Houston', 'San Antonio', 'Dallas', 'Austin', 'Fort Worth', '8.15']
}

def describe_state2(state)
  state2 = state.to_sym
  print "\n#{state} is for #{ @states_and_cities[:CA][0] }. It has these major cities: "
  print "#{@states_and_cities[state2][1..5].join(', ')}"
  print ".\n"
end

describe_state2('CA')

def find_state_for_city2(state_find)
  hit =''
  @states_and_cities.select { |states| @states_and_cities[states].include? (state_find) ? hit = states : nil }
  p hit.to_s
end

find_state_for_city2('Tampa')
)

### Refactored ###
@states_and_cities = {
  OR: ['Oregon', 'Portland', 'Salem', 'Eugene', 'Gresham', 'Hillsboro', '0.00'],
  FL: ['Florida', 'Jacksonville', 'Miami', 'Tampa', 'Orlando', 'St. Petersburg', '6.62'],
  CA: ['California', 'LA', 'San Diego', 'San Jose', 'San Francisco', 'Fresno', '8.41'],
  NY: ['New_York', 'New York', 'Buffalo', 'Rochester', 'Yonkers', 'Syracuse', '8.47'],
  MI: ['Michigan', 'Detroit', 'Grand Rapids', 'Warren', 'Sterling Heights', 'Lansing', '6.00'],
  WA: ['Washington', 'Seattle', 'Spokane', 'Tacoma', 'Vancouver', 'Bellevue', '8.88'],
  TX: ['Texas', 'Houston', 'San Antonio', 'Dallas', 'Austin', 'Fort Worth', '8.15']
}

def describe_state2(state)
  state2 = state.to_sym
  print "\n#{state} is for #{ @states_and_cities[:CA][0] }. It has these major cities: "
  print "#{@states_and_cities[state2][1..5].join(', ')}"
  print ".\n"

end

describe_state2('CA')

def find_state_for_city2(state_find)

  hit =''
  @states_and_cities.select { |states| @states_and_cities[states].include? (state_find) ? hit = states : nil }
  p hit.to_s

end

find_state_for_city2('Tampa')