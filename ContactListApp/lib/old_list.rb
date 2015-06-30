require_relative 'contact'
require_relative 'database'
require 'pry'

ARGV << 'help' if ARGV.empty?

aliases = {
    "n"  => "new",
    "l"  => "list",
    "s"  => "show",
    "f"  => "find",
    "h" => "help"
}

command = ARGV.shift
command = aliases[command] || command

def help
  puts "Here is a list of available commands:"
  puts "new or n - Create a new contact"
  puts "list or l - List all contacts"
  puts "show or s - Show a contact"
  puts "find or f- Find a contact"
end

def new
  print "Please enter the contacts email: "
  email = gets.chomp!

  Contact.all.select do |contact|
    if contact[2].downcase.include? email
      puts "Duplicated name found, the email #{email} already exists!"
      return
    else
      print "Please enter the first and the last name of the contact: "
      name = gets.chomp!
      Contact.create(name, email)
      puts "Name: #{name} with email: #{email} is being added to the contact list "

    end
    return
  end
end

def list
  count = 0
  puts "Here is the List of all your current contacts:"
  Contact.all.each_with_index do |contact, id|
  print "#{id+1}: "
    contact.each_with_index { |value, index| print "#{value} "}
    print "\n"
    count +=1
  end
  puts "---"
  puts "#{count} records total"
end

def show
  puts "Show a contact"
  contact_id = ARGV[0].to_i - 1
  result = []
  Contact.all.each_with_index do |contact, id|
    if contact_id == id
      result << contact
    end
  end
  if result.empty?
    puts "No contact with ID# #{contact_id + 1} has been found."
  else
    puts result
  end
end

def find
  puts "Find a contact"
  got_contact = ARGV[0].downcase
  result = []
  Contact.all.select do |contact|
    if contact[0].downcase.include? got_contact
      result << contact.each {|cell| print "#{cell} "}
    end
  end
end

case command
  when "new" then new
  when "list" then list
  when "show" then show
  when "find" then find
  when "help" then help
  else puts "No Command or Command Invalid. Please type 'ruby contact_list help' for more information."
end
