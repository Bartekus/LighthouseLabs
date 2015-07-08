class Email

  attr_accessor :email_type, :email

  def initialize(email_type, email)
    @email_type = email_type
    @email = email
  end
end
