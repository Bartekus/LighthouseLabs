require_relative 'contact'
require 'yaml'
require 'csv'
#customers = CSV.read('contacts.csv')

class Database

  def self.open
    if File.exist?('contacts.yml')
      return YAML.load_file('contacts.yml')
    end

  end

  def self.save(contacts)
    File.open('contacts.yml', 'w') do |file|
      file.write(contacts.to_yaml)
    end




    CSV.open('contacts.csv', 'w') do |csv_object|
      contacts.each do |contact|
        csv_object << contact.to_a
      end


    end
  end

end
