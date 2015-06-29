############################################################################################################################
# Slim Version

@roman = {
   M: 1000,
  CM: 900,
   D: 500,
  CD: 400,
   C: 100,
   L: 50,
  XL: 40,
   X: 10,
  IX: 9,
   V: 5,
  IV: 4,
   I: 1
}

def to_roman(number)
  @result = ""
  @roman.each do |roman_letter, equivalent|
    ((number / equivalent).floor).times { @result << roman_letter.to_s }
    number = number % equivalent
  end
  @result
end

puts "-------------------------------------"
puts "Roman Numerals Test - New (Slim)     "
puts "-------------------------------------"
puts "input | expected      | actual       "
puts "------|---------------|--------------"
puts "1     | I             | #{to_roman(1)}"
puts "3     | III           | #{to_roman(3)}"
puts "4     | IV            | #{to_roman(4)}"
puts "6     | VI            | #{to_roman(6)}"
puts "9     | IX            | #{to_roman(9)}"
puts "13    | XIII          | #{to_roman(13)}"
puts "14    | XIV           | #{to_roman(14)}"
puts "44    | XLIV          | #{to_roman(44)}"
puts "944   | CMXLIV        | #{to_roman(944)}"
puts "1453  | MCDLIII       | #{to_roman(1453)}"
puts "1646  | MDCXLVI       | #{to_roman(1646)}"
puts "-------------------------------------"


############################################################################################################################
# Old Version - Easy Way

def old_roman_numeral(num)
  raise 'Must use positive integer' if num <= 0
  roman = ''
  roman << 'M' * (num / 1000)
  roman << 'D' * (num % 1000 / 500)
  roman << 'C' * (num % 500 / 100)
  roman << 'L' * (num % 100 / 50)
  roman << 'X' * (num % 50 / 10)
  roman << 'V' * (num % 10 / 5)
  roman << 'I' * (num % 5 / 1)
  roman
end


puts "-------------------------------------"
puts "Roman Numerals Test - OLD WAY        "
puts "-------------------------------------"
puts "input | expected      | actual       "
puts "------|---------------|--------------"
puts "1     | I             | #{old_roman_numeral(1)}"
puts "3     | III           | #{old_roman_numeral(3)}"
puts "4     | IIII          | #{old_roman_numeral(4)}"
puts "6     | VI            | #{old_roman_numeral(6)}"
puts "9     | VIIII         | #{old_roman_numeral(9)}"
puts "13    | XIII          | #{old_roman_numeral(13)}"
puts "14    | XIIII         | #{old_roman_numeral(14)}"
puts "44    | XXXXIIII      | #{old_roman_numeral(44)}"
puts "944   | DCCCCXXXXIIII | #{old_roman_numeral(944)}"
puts "1453  | MCCCCLIII     | #{old_roman_numeral(1453)}"
puts "1646  | MDCXXXXVI     | #{old_roman_numeral(1646)}"
puts "-------------------------------------"
