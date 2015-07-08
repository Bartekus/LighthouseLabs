class PhoneNumber

  attr_accessor :phone_type, :number

  def initialize(phone_type, number)
    @phone_type = phone_type
    @number = number
  end
end
