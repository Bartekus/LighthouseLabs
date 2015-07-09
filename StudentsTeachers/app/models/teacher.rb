class Teacher < ActiveRecord::Base
  has_many :students

  validates :name,     uniqueness: true, presence: true


  #Implement unique names and email addresses

end
