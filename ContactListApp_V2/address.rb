class Address

  attr_accessor :address_type, :street_1, :street_2, :city, :province, :postal_code, :country

  def initialize(address_type, street_1, street_2, city, province , postal_code, country)
    @address_type = address_type
    @street_1 = street_1
    @street_2 = street_2
    @city = city
    @province = province
    @postal_code = postal_code
    @country = country
  end
end
