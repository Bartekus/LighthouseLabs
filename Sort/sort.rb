require 'benchmark'

# Sort the arrayay from lowest to highest

###############################################################################################
### Original sort #############################################################################
###############################################################################################
puts Benchmark.measure {

def sort(array)
 array.sort
end


# Find the maximum 
def maximum(array)
  sort(array).last
end

def minimum(array)
  sort(array).first
end

puts "Now testing Orginal sort."
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty arrayay is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

sort = Array.new(10000) {|number| number = rand(1...1000) }
result = maximum(sort)
result = minimum(sort)
puts "Here are the results of the benchmark:"
}
puts "\n"


###############################################################################################
### Bubble Sort ###############################################################################
############################################################################################### 
puts Benchmark.measure {

def bubblesort(array)
  return array if array.size <= 1
  operator = array.first
  sorted = []
  array.each do |i|
    if i > operator
      operator = i
    end
    sorted.push(operator)
  end
  sorted
end


# Find the maximum 
def maximum(array)
  bubblesort(array).last
end

def minimum(array)
  bubblesort(array).first
end

puts "Now testing Bubble Sort #1."
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty arrayay is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

sort = Array.new(10000) {|number| number = rand(1...1000) }
result = maximum(sort)
result = minimum(sort)
puts "Here are the results of the benchmark:"
}
puts "\n"

###############################################################################################
### Radix Sort ###############################################################################
############################################################################################### 
puts Benchmark.measure {

def make_buckets
  Array.new(10,[])
end

def get_digit(n, i)
  n % (10 ** (i + 1)) / (10 ** i)
end

def radix_sort(array)
  return array if array.size <= 1

  passes = (array.max == 0) ? 1 : Math.log10(array.max).to_i + 1
  new_array = []
  passes.times do |integer|
    buckets = make_buckets
    array.each do |number|
      digit = get_digit(number, integer)
      buckets[digit] += [number]
    end
    new_array, buckets = buckets.flatten, make_buckets
  end
  new_array
end



# Find the maximum 
def maximum(array)
  radix_sort(array).last
end

def minimum(array)
  radix_sort(array).first
end

puts "Now testing Radix Sort"
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty arrayay is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

sort = Array.new(10000) {|number| number = rand(1...9) }
result = maximum(sort)
result = minimum(sort)
puts "Here are the results of the benchmark:"
}
puts "\n"

###############################################################################################
### Bubble Sort #2 ############################################################################
############################################################################################### 
puts Benchmark.measure {

def bubblesort1(array)
  return array if array.size <= 1
  swapped = false
  until swapped
    swapped = false
    0.upto( array.size - 2 ) do |number|
      if array[ number ] > array[ number + 1 ]
        array[ number ], array[ number + 1 ] = array[ number + 1 ], array[ number ]
        swapped = true
      end
    end
  end
  array
end


# Find the maximum 
def maximum(array)
  bubblesort1(array).last
end

def minimum(array)
  bubblesort1(array).first
end

puts "Now testing Bubble Sort #2."
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty arrayay is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

sort = Array.new(10000) {|number| number = rand(1...1000) }
result = maximum(sort)
result = minimum(sort)
puts "Here are the results of the benchmark:"
}
puts "\n"

###############################################################################################
### Merge Sort ################################################################################
############################################################################################### 
puts Benchmark.measure {

def mergesort(array)
  return array if array.size <= 1
  middle = array.size / 2
  left  = array[ 0, middle ]
  right = array[ middle, array.size ]
  merge( mergesort(left), mergesort(right) )
end
def merge(left, right)
  sorted = []
  until left.empty? or right.empty?
      (left.first <= right.first) ? (sorted << left.shift) : (sorted << right.shift)
  end
  sorted.concat(left).concat(right)
end

# Find the maximum 
def maximum(array)
  mergesort(array).last
end

def minimum(array)
  mergesort(array).first
end

puts "Now testing Merge Sort"
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty arrayay is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

sort = Array.new(10000) {|number| number = rand(1...1000) }
result = maximum(sort)
result = minimum(sort)
puts "Here are the results of the benchmark:"
}
puts "\n"

###############################################################################################
### Quick Sort ################################################################################
############################################################################################### 
puts Benchmark.measure {

def quicksort(array)
  return array if array.size <= 1

  #select random pivot and remove it from the array
  pivot = array.sample
  array.delete_at(array.index(pivot))

  #divide the array into two along the pivot line
  less = []
  greater = []
  array.each {|number| (number <= pivot) ? (less << number) : greater << number }

  #recombine and flatten splintered arrays, starting with less array, then pivot and following up with greater array
  (sort(less) << pivot << sort(greater)).flatten
end


# Find the maximum 
def maximum(array)
  quicksort(array).last
end

def minimum(array)
  quicksort(array).first
end

puts "Now testing Quick Sort"
# expect it to return 42 below
result = maximum([2, 42, 22, 02])
puts "max of 2, 42, 22, 02 is: #{result}"

# expect it to return 2 below
result = minimum([2, 42, 22, 02])
puts "min of 2, 42, 22, 02 is: #{result}"

 
# expect it to return nil when empty arrayay is passed in
result = maximum([])
puts "max on empty set is: #{result.inspect}"
result = minimum([])
puts "min on empty set is: #{result.inspect}"
 
result = maximum([-23, 0, -3])
puts "max of -23, 0, -3 is: #{result}"
 
result = maximum([6])
puts "max of just 6 is: #{result}"

sort = Array.new(10000) {|number| number = rand(1...1000) }
result = maximum(sort)
result = minimum(sort)
puts "Here are the results of the benchmark:"
}
puts "\n"