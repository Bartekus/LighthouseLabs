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
  end





end
