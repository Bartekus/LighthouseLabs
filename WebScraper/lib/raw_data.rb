class RawData

  attr_reader :raw_data

  def initialize(url)
    begin
      @raw_data = Nokogiri::HTML(open(url))
    rescue Exception
      Interface.unable_to_load(url)
      exit
    end
  end

end
