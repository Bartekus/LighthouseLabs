require_relative 'database'
require_relative 'email'
require_relative 'phone_number'
require_relative 'address'

class Contact

  attr_accessor :id, :first_name, :middle_name, :last_name
  attr_reader :emails, :phone_numbers, :addresses

  def initialize(id = nil, first_name, middle_name, last_name)
    @id = id
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    @emails = []
    @phone_numbers = []
    @addresses = []
  end

  def save #Finish the save function to enable saving od emails, phones and addresses
    if @id
      $connection.exec_params("UPDATE contacts SET first_name = $1, middle_name = $2, last_name = $3 WHERE id = $4", [@first_name, @middle_name, @last_name, @id])
    else
      result = $connection.exec_params("INSERT INTO contacts (first_name, middle_name, last_name) VALUES ($1, $2, $3) RETURNING id", [@first_name, @middle_name, @last_name])
      @id = result[0]['id']
      puts "\n\nThe contact for #{@first_name} #{@middle_name} #{@last_name} has been added to the database with ID##{@id}."
    end
  end

  def delete
    $connection.exec_params("DELETE FROM contacts WHERE id = $1", [id])
  end

  class << self

    def list
      pg_result = $connection.exec("SELECT DISTINCT contacts.id, contacts.first_name, contacts.middle_name, contacts.last_name, emails.email_type, emails.email, phone_numbers.phone_type, phone_numbers.number, addresses.address_type, addresses.street_1, addresses.street_2, addresses.city, addresses.province, addresses.postal_code, addresses.country FROM contacts LEFT JOIN emails ON (contacts.id = emails.contact_id) LEFT JOIN phone_numbers ON (contacts.id = phone_numbers.contact_id) LEFT JOIN addresses ON (contacts.id = addresses.contact_id);")
      result = to_array(pg_result)
      format(result)
    end

    def find(id)
      pg_result = $connection.exec_params("SELECT * FROM contacts WHERE id = $1", [id])
      to_array(pg_result).first
    end

    # Finish the search features

    # def find_all_by_lastname(lastname)
    #   pg_result = $connect.exec_params("SELECT * FROM contacts WHERE lastname = $1", [lastname])
    #   to_array(pg_result)
    # end
    #
    # def find_all_by_firstname(firstname)
    #   pg_result = $connect.exec_params("SELECT * FROM contacts WHERE firstname = $1", [firstname])
    #   to_array(pg_result)
    # end
    #
    # def find_by_email(email)
    #   pg_result = $connect.exec_params("SELECT firstname, lastname, email, id FROM contacts WHERE email = $1", [email])
    #   to_array(pg_result)
    # end

    def to_array(pg_result)
      result = []
      pg_result.each do |row|
        contact = Contact.new(row['id'], row['first_name'], row['middle_name'], row['last_name'])
        contact.emails.push(Email.new(row['email_type'], row['email'])) if row['email_type']
        contact.phone_numbers.push(PhoneNumber.new(row['phone_type'], row['number'])) if row['phone_type']
        contact.addresses.push(Address.new(row['address_type'], row['street_1'], row['street_2'], row['city'], row['province'], row['postal_code'], row['country'])) if row['address_type']
        result << contact
      end
      result
    end

    def format(result)
      puts 'Contacts:'
      puts 'ID'.ljust(10) + 'Full Name'.rjust(10)
      result.each do |contacts|
        print "\n #{contacts.id} #{contacts.first_name} #{contacts.middle_name} #{contacts.last_name}"
        (contacts.emails.each { |email| print " #{email.email_type} #{email.email}"}) if contacts.emails
        (contacts.phone_numbers.each { |phone| print " #{phone.phone_type} #{phone.number}"}) if contacts.phone_numbers
        (contacts.addresses.each { |address| print " #{address.address_type} #{address.street_1} #{address.street_2} #{address.city} #{address.province} #{address.postal_code} #{address.country}"}) if contacts.addresses
      end
    end

  end
end


# def to_s
#   "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
# end
#
# def print_register
#   puts "\n" * 1
#   puts "Register"
#   puts "-" * 40
#   puts "#{name}'s Bank Account"
#   puts "-" * 40
#   puts "Description".ljust(30) + "Amount".rjust(10)
#   @transactions.each do |transaction|
#     puts transaction[:description].ljust(30) + sprintf("%0.2f", transaction[:amount]).rjust(10)
#   end
#   puts "-" * 40
#   puts "Balance:".ljust(30) + sprintf("%0.2f", balance).rjust(10)
#   puts "-" * 40
# end

