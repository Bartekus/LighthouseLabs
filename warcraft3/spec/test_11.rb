require_relative 'spec_helper'

# In most strategy games, like Warcraft III, buildings can also be attacked by units.
# Since a barracks is a building, it has substantial more HP (500)
# To make matters worse, a Footman does only HALF of its AP as damage to a Barracks.
# This is because they are quite ineffective against buildings.

# Note: The damage amount should be an integer (Fixnum). Take the ceil division result.

describe 'Barracks' do

  before do
    @building = Barracks.new
    @unit = Footman.new
  end

  it "has and knows its HP (health points)" do
    expect(@building.health_points).to equal(500)
  end

  describe '#damage' do
    it "should reduce the building's health_points by the attack_power divided by two" do
      expect(@building).to receive(:damage).with(5).and_call_original
      @unit.attack!(@building)
      expect(@building.health_points).to eq(495)
    end
  end

end
