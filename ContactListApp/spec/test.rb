require 'csv'
# customers = CSV.read('contacts.csv')

puts "Test1"
CSV.foreach('contacts.csv') do |row|
  puts row.inspect
end