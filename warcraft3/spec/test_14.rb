require_relative 'spec_helper'

# Aside from gold and food, there is also the concept of lumber.
# Add lumber as a resource that the barracks can handle.

# A Barracks can start off with 500 lumber.

describe 'Barracks' do

  before do
    @building = Barracks.new
  end

  it "has and knows its lumber value" do
    expect(@building.lumber).to equal(500)
  end

end
