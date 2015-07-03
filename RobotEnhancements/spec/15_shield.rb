require './spec_helper'

# Robots can start with 50 shield points.
# When the robot is damaged it first drains the shield and then starts affecting actual health.

# You will likely also have to fix previous tests that will fail due to this enhancement.
# However, focus on running spec 16 until you are done, then rerun all your tests to find other failing tests and modify the tests to modify their expectations.


describe PowerShield do

  before :each do
    @robot = Robot.new
    @shield = PowerShield.new
  end

  it "should be a Item" do
    expect(@shield).to be_an(Item)
  end

  it "should be called 'Shield'" do
    expect(@shield.name).to eq('Power Shield')
  end

  it "should weight 0" do
    expect(@shield.weight).to eq(0)
  end

  it "should absorb 50 points of damage" do
    @robot.pick_up(@shield)
    expect(@shield).to receive(:absorb).with(50)
    # expect(@robot.health).to eq(100)
    @robot.wound(50)
  end

end
