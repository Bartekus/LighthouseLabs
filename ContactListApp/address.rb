class Address

  attr_accessor :kind, :street_1, :street_2, :city, :province, :postal_code

  def initialize(kind = '', street_1 = '', street_2 = '', city = '', province = '', postal_code = '')
    @kind = kind
    @street_1 = street_1
    @street_2 = street_2
    @city = city
    @province = province
    @postal_code = postal_code
  end

  def to_s(format = 'short')
    address = ''
    case format
    when 'long'
      address += street_1 + "\n"
      address += street_2 + "\n" if !street_2.nil?
      address += "#{city}, #{province}, #{postal_code}"
    when 'short'
      address += "#{kind}: "
      address += street_1
      address += ' ' + street_2 if !street_2.nil?
      address += ", #{city}, #{province}, #{postal_code}"
    end
    address
  end
end
