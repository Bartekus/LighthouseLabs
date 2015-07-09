require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store1.employees.create(first_name: "Doug", last_name: "Plab", hourly_rate: 24)
@store1.employees.create(first_name: "Paul", last_name: "Duran", hourly_rate: 54)
@store1.employees.create(first_name: "Martin", last_name: "Hashan", hourly_rate: 43)
@store2.employees.create(first_name: "Ashley", last_name: "Moose", hourly_rate: 12)
@store2.employees.create(first_name: "Anieta", last_name: "Alton", hourly_rate: 23)
@store2.employees.create(first_name: "Dorothy", last_name: "Beresh", hourly_rate: 34)
@store2.employees.create(first_name: "Kate", last_name: "Tukan", hourly_rate: 28)
