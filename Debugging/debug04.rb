def char_count(list)
  @letters = Hash.new(0)
  list.each { |word| word.split('').each { |letter| @letters[letter] += 1 } }
  
  puts "The list #{list} contains these letters:"
  @letters.each_pair{|key, value| puts "#{key.upcase}: #{value}"}
  puts "Thank you for using char_count!"
end
 
# Why the long face(error)? 
# 1. This should return count of each letter in the list
 
puts char_count(['apples', 'oranges', 'hipsters', 'are', 'same'])
 
 
# 2. What are the improvements you can do to above code?
# Refactoring First Attempt 

def char_count2(list)
  letters = {}
  (:a..:z).each { |i| letters[i]= 0 }
 
  letters.each do |symbol, value|
    list.each do |word|
      word.split('').each do |letter|
        if letter == symbol.to_s
          letters[symbol] +=1
        end
      end
    end
  end
  puts "The list #{list} contains these letters:"
  letters.each_pair{|key, value| puts "#{key.upcase}: #{value}" if value > 0}
  puts "Thank you for using char_count!"
end

puts char_count2(['apples', 'oranges', 'hipsters', 'are', 'same'])

#################################################################
# Refactoring Second Attempt

def char_count3(list)
  @letters = {}

  (:a..:z).each { |symbol| @letters[symbol] = 0 }
  string = list.join()

  @letters.each {|key, value| @letters[key] += string.count "#{key}" }

  puts "The list #{list} contains these letters:"
  @letters.each_pair{|key, value| puts "#{key.upcase}: #{value}" if value > 0}
  puts "Thank you for using char_count!"
end

puts char_count3(['apples', 'oranges', 'hipsters', 'are', 'same'])
