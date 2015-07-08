require_relative 'database'
require_relative 'contact'

class ContactList
  attr_reader :contacts

  def initialize
    @contacts = []
    db_connect
  end

  def db_connect
    Database.initiate
  end

  def db_disconnect
    Database.terminate
  end

  def run
    system('clear')
    loop do
      print %q(
Contact List Application - Version 2

    Menu
l - List all contacts
f - Find an contact by either id, first name, middle name, last name email
c - Create a new contact
d - Delete a contact with id
e - Exit program

      )

      print 'Enter your choice: '
      input = gets.chomp.downcase
      case input
        when 'l' then list
        when 'f' then find
        when 'c' then add_contact
        when 'd' then delete_contact
        when 'e'
          db_disconnect
          break
      end
      puts "\n"
    end
  end

  def list
    Contact.list
  end

  def find_id
    print "Enter the ID# of the person you are trying to find"

    Contact.find(id)
  end

  def add_contact
    print "Enter first name: "
    first_name = gets.chomp
    print "Enter middle name: "
    middle_name = gets.chomp
    print "Enter last name: "
    last_name = gets.chomp
    contact = Contact.new(first_name, middle_name, last_name)

    loop do
      puts 'Add email, phone number or address? '
      puts 'e: Add email address'
      puts 'p: Add phone number'
      puts 'a: Add address'
      puts '(Any other key to go back)'
      response = gets.chomp.downcase
      case response
        when 'e' then contact.emails.push(add_email)
        when 'p' then contact.phone_numbers.push(add_phone)
        when 'a' then contact.addresses.push(add_address)
        else
          print "\n"
          break
      end
      contact.save
    end
  end

  def add_email
    print 'Email type (Personal, Business, etc): '
    email_type = gets.chomp
    print 'Number: '
    number = gets.chomp
    Email.new(email_type, number)
  end

  def add_phone
    print 'Phone type (Home, Work, etc): '
    phone_type = gets.chomp
    print 'Number: '
    number = gets.chomp
    PhoneNumber.new(phone_type, number)
  end

  def add_address
    print 'Address Kind (Home, Work, etc): '
    address_type = gets.chomp
    print 'Address line 1: '
    street_1 = gets.chomp
    print 'Address line 2: '
    street_2 = gets.chomp
    print 'City: '
    city = gets.chomp
    print 'Province: '
    province = gets.chomp
    print 'Postal Code: '
    postal_code = gets.chomp
    print 'Country: '
    country = gets.chomp
    Address.new(address_type, street_1, street_2, city, province, postal_code, country)
  end

  def delete_contact
    print "Enter the ID# of the contact that you wish to delete: "
    id = gets.chomp.to_s.to_i
    contact = Contact.find(id)
    contact.delete
  end

end

contact_list = ContactList.new
contact_list.run
