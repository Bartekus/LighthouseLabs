require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  # Create a new instance method in the Robot class called heal!.
  # This method will be slightly different than the previously defined heal (without a bang) method, in that this one is more aggressive in how it behaves.

  # Robot#heal! should raise an exception if the robot is already at 0 health or less.
  # In other words, once a robot is dead, it cannot be revived.

  describe "#heal!" do
    it "doesn't increases dead robot's health" do
      @robot.wound(100)
      @robot.heal(20)
      expect { @robot.heal! }.to raise_error(Robot::InvalidTarget, "Cannot heal a dead target!")
    end

    it "doesn't increase health over 100" do
      @robot.heal(20)
      expect { @robot.heal! }.to raise_error(Robot::InvalidCommand, "Target already at maximum health!")
    end
  end

end
