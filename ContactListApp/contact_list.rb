require_relative 'contact'
require_relative 'database'
require 'yaml'

class ContactList
  attr_reader :contacts

  def initialize
    @contacts = []
    open
  end

  def open
      @contacts = Database.open unless Database.open.nil?
  end

  def save
      Database.save(contacts)
      formatted = []
      contacts.each { |contact| formatted << contact.to_a }
      Database.csv_save(formatted)
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
        when 's'
          print 'Search term: '
          search = gets.chomp
          find_by_name(search)
          find_by_phone_number(search)
          find_by_address(search)
        when 'e'
          save
          break
        else
          puts 'Wrong key!'
      end
      puts "\n"
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
          print 'Address Kind (Home, Work, etc): '
          address.kind = gets.chomp
          print 'Address line 1: '
          address.street_1 = gets.chomp
          print 'Address line 2: '
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
    @contacts.push(contact)
  end

  def print_results(search, results)
    puts search
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
    contacts.each { |contact| results.push(contact) if contact.full_name.downcase.include?(search) }
    print_results("\nName search results (#{search})", results)
  end

  def find_by_phone_number(number)
    results = []
    search = number.gsub('-', '')
    contacts.each { |contact| contact.phone_numbers.each { |phone_number| (results.push(contact) unless results.include?(contact)) if phone_number.number.gsub('-', '').include?(search) } }
    print_results("\nPhone search results (#{search})", results)
  end

  def find_by_address(query)
    results = []
    search = query.downcase
    contacts.each { |contact| contact.addresses.each { |address| (results.push(contact) unless results.include?(contact)) if address.to_s('long').downcase.include?(search) } }
    print_results("\nAddress search results (#{search})", results)
  end

  def print_contact_list
    puts "\nContact List"
    contacts.each { |contact| puts contact.to_s('last_first') }
  end
end

contact_list = ContactList.new
contact_list.run
