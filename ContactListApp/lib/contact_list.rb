require './contact'
require 'yaml'

class ContactList

  attr_reader :contacts

  def initialize
    @contacts = []
    open
  end

  def open
    if File.exist?('contacts.yml')
      @contacts = YAML.load_file('contacts.yml')
    end
  end

  def save
    File.open('contacts.yml', 'w') do |file|
      file.write(contacts.to_yaml)
    end
  end

  def run
    loop do
      puts 'Address Book'
      puts 'a: Add Contact'
      puts 'p: Print Address Book'
      puts 's: Search'
      puts 'e: Exit'
      print 'Enter your choice: '
      input = gets.chomp.downcase
      case input
        when 'a' then add_contact
        when 'p' then print_contact_list
        when 's' then
          print 'Search term: '
          search = gets.chomp
          find_by_name(search)
          find_by_phone_number(search)
          find_by_address(search)
        when 'e' then
          save
          break
        else
          puts 'Wrong key!'
      end
    end
  end

  def add_contact
    contact = Contact.new
    print 'First name: '
    contact.first_name = gets.chomp
    print 'Middle name: '
    contact.middle_name = gets.chomp
    print 'Last name: '
    contact.last_name = gets.chomp
    contacts.push(contact)

    loop do
      puts 'Add phone number or address? '
      puts 'p: Add phone number'
      puts 'a: Add address'
      puts '(Any other key to go back)'
      response = gets.chomp.downcase
      case response
        when 'p'
          phone = PhoneNumber.new
          print 'Phone number kind (Home, Work, etc): '
          phone.kind = gets.chomp
          print 'Number: '
          phone.number = gets.chomp
          contact.phone_numbers.push(phone)
        when 'a'
          address = Address.new
          print 'Address kind (Home, Work, etc): '
          address.kind = gets.chomp
          print 'Address line1: '
          address.street_1 = gets.chomp
          print 'Address line2: '
          address.street_2 = gets.chomp
          print 'City: '
          address.city = gets.chomp
          print 'Province: '
          address.province = gets.chomp
          print 'Postal Code: '
          address.postal_code = gets.chomp
          contact.addresses.push(address)
        else
          print "\n"
          break
      end
    end
  end

  def print_results(search, results)
    puts search
    puts "Name search results (#{search})"
    results.each do |contact|
      puts contact.to_s('full_name')
      contact.print_phone_numbers
      contact.print_addresses
      puts "\n"
    end
  end

  def find_by_name(name)
    results = []
    search = name.downcase
    contacts.each do |contact|
      if contact.full_name.downcase.include?(search)
        results.push(contact)
      end
    end
    print_results("Name search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub('-', '')
    contacts.each do |contact|
      contact.phone_numbers.each do |phone_number|
        if phone_number.number.gsub('-', '').include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Phone search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each do |contact|
      contact.addresses.each do |address|
        if address.to_s('long').downcase.include?(search)
          results.push(contact) unless results.include?(contact)
        end
      end
    end
    print_results("Address search results (#{search})", results)
  end

  def print_contact_list
    puts 'Contact List'
    contacts.each do |contact|
      puts contact.to_s('last_first')
    end
  end

end

address_book = AddressBook.new
address_book.run

# bart = Contact.new
# bart.first_name = 'Bart'
# bart.middle_name = 'Paul'
# bart.last_name = 'Kus'
# bart.add_phone_number('Home', '123-456-7890')
# bart.add_phone_number('Work', '476-789-0123')
# bart.add_address('Home', '123 Main St.','', 'Vancouver', 'British Columbia', 'A0A-0A0')
#
# mart = Contact.new
# mart.first_name = 'Mart'
# mart.middle_name = 'Doug'
# mart.last_name = 'Hall'
# mart.add_phone_number('Home', '342-567-2452')
# mart.add_phone_number('Work', '762-893-1783')
# mart.add_address('Home', '145 Main St.','', 'Vancouver', 'British Columbia', 'A1A-1A1')
#
#
# address_book.contacts.push(bart)
# address_book.contacts.push(mart)
# address_book.find_by_phone_number('56')
# address_book.find_by_name('ar')
# address_book.find_by_address('main')
