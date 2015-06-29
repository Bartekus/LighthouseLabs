### SETUP
require 'rspec'

RSpec.configure do |config|
  config.color = true
end

### LOGIC (fix me)

# Returns the average of all the numbers in the array
def average(numbers)
  return 0 if numbers == []
  return nil if numbers == nil
  if numbers
    sum = 0.00
    numbers.each do |n|
      sum += n.to_s.to_f
    end
    sum / numbers.size
  end
end

### TEST CODE (don't touch me)

describe "#average" do
  it "returns nil for empty array" do
    result = average([])
    result.should eq(0)
  end
  it "returns nil when nil is passed in" do
    result = average(nil)
    result.should be_nil
  end
  it "returns 4 for 3,4,5" do
    result = average([3,4,5])
    result.should eq(4)
  end
  it "can handle numbers represented as strings" do
    result = average([10,'20',30])
    result.should eq(20)
  end
  it "can handle floats" do
    result = average([1.0,1.5,2.0])
    result.should eq(1.5)
  end
end
