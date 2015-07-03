require './spec_helper'

describe Robot do
  before :each do
    @robot = Robot.new
    @item = BoxOfBolts.new
    @enemy = Robot.new
  end

  # Robot#attack! should raise an exception if the target being attacked is not a robot.
  # A user should not be able to attack an Item or anything other than a Robot.

  describe "#attack!" do

    it "can attack other robots" do
      expect { @robot.attack(@enemy) }.not_to raise_error
    end

    it "can not attack non-robot targets" do
      expect { @robot.attack(@item) }.to raise_error(Robot::InvalidTarget, "Cannot attack non-robot targets")
    end
  end

end
