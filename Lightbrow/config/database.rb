require 'active_record'
require 'sqlite3'

@db_path = './db/database.sqlite3'

def establish_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: @db_path
  )
end
