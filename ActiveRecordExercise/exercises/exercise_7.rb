require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

puts "Lets create a store!"
print "Please enter the name of the store: "
name = gets.chomp
store = Store.create(:name => "#{name}")


store.errors.messages.each {|error| puts "#{error[0].capitalize} has caused an error: #{error[1]}"}
