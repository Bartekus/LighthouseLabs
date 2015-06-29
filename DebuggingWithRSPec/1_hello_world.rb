### SETUP
require 'rspec'

RSpec.configure do |config|
  config.color = true
end

### LOGIC (fix me)

def hello(who)
  "hello #{who}!"
end

### TEST CODE (don't touch me)

describe "#hello" do
  it "returns 'hello world!' when 'world' is passed in" do
    result = hello('world')
    result.should eq('hello world!')
  end
end
