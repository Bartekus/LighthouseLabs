# # Method to count occurences of each unique character present in the input string.
# def count_letters(string)
#  @letters = Hash.new(0)
#  (string.delete (" ")).each_char { |letter| @letters[letter] += 1 }
#  @letters
# end

# puts "Letter count:"
# puts count_letters("lighthouse in the house...")


# # Method to collect a list of index positions for each unique character present within the input string.
# def locate_letters(string)
#  @letters = Hash.new { |letter, index| letter[index] = [] }
#  string.split('').each_with_index { |letter, index| @letters[letter] << index }
#  @letters
# end

# puts "Character indices (including whitespace):"
# puts locate_letters("lighthouse in the house...")


# Refactored to streamlined 
def count_letters(list)
  counter = {}
  list.delete(' ').split('').each do |letter|
    counter.include?(letter) ? counter[letter] += 1 : counter[letter] = 1
  end

  puts "{"
  counter.each {|key, value| print "'#{key}' => #{value},\n"}
  print "}\n"
end


# Why the long face(error)?
# 1. This should return count of each letter in the list

count_letters("lighthouse in the house...")