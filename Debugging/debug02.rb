# def average(numbers)
#   sum = 0
#   numbers.each do |num|
#     sum += num.to_f
#   end
#   sum / numbers.size
# end
 
# # TEST HELPER METHOD
# # Considering the errorous nature of the test, this method works however it can be improved and streamlined 
# def test_average(array = [])
#     begin
#       print "avg of #{array.inspect}: "
#       return p array[0] if array.size <= 1 || array == [] || array == nil
#       result = average(array)
#       result.to_s.include?('.5') ? (p result) : (p result.to_s.to_i)
#     rescue
#       return p nil
#     end
# end

# TEST HELPER METHOD
# A more compact and streamlined version (work in progress)
def test_average(*array)

  prep = array.flatten.compact
  sum = prep.flatten.inject(){|sum, value| sum += value.to_f if prep != []}
  
  print "avg of #{array.inspect}: "
  if prep != []
    adj_sum = (sum / prep.size)
    adj_sum.to_s.include?('.5') ? (print adj_sum) : (print adj_sum.to_s.to_i)
  else
    print 'nil' if prep == []
  end
  print "\n"
end

## TEST CODE
test_average([4,5,6]) # => 5
test_average([15,5,10]) # => 10

# Should treat string like number
test_average([15,'5',10]) # => 10

# Should show decimal value
test_average([10, 5]) # => 7.5 instead of just 7

# Watch out! Even tests can have bugs!
test_average(9, 5, 7)

# Empty set should return nil, not throw an error
test_average([]) # => nil

# Non-existent set should return nil
test_average() # => nil

# BONUS: Should ignore nils in the set
test_average([9,6,nil,3]) # => 6
