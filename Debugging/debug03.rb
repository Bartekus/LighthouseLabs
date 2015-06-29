def sum(list)
  sum = 0
  list.each do |number|
    sum += number.to_i
  end
  sum
end

list1 = [16,21,31,42,55]

# 1. The following should return 165 instead of an error
puts sum(list1)

# 2. How would you refactor it using an enumerable method other than each? Examples of enumerables: map, select, inject, reject, detect.

def sum2(list)
  list.inject() {|sum, value| sum += value}
end

puts sum2(list1)
