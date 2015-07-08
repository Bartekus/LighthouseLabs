require 'pg'
class Database

  def self.initiate
    puts "Connecting to the database...\n\n"
    $connection = PG.connect(
      host: 'ec2-107-21-114-132.compute-1.amazonaws.com',
      dbname: 'd2qpoehl2ace1j',
      user: 'mksniqccdggjun',
      password: '6dedigdzrvcthCBdEGVeW4rP8l'
    )
  end

  def self.terminate
    puts "\n\nClosing the connection..."
    $connection.close
    puts 'DONE'
  end
end
