require_relative 'spec_helper'

# Introduce a SiegeEngine Unit.
# The SiegeEngine is very effective against buildings such as the Barracks.
# It is however ineffective against other units (can't attack them, as though they were dead).

# So unlike with Footman (whose attacks do a fraction of the damage they normally would),
# the SiegeEngine does 2x the damage against the Barracks

# Also, Siege Engines can attack other siege engines even though
# they cannot attack any other units (such as Peasants or Footmen)

# Stats:  AP: 50
#         HP: 400
#       Cost: 200 gold, 60 lumber, 3 food
#
# Notes: You will need to require the seige_engine.rb file in spec_helper.rb

describe SiegeEngine do

  before :each do
    @siege_engine = SiegeEngine.new
  end

  it "has and knows its HP (health points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "has and knows its AP (attack power)" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  describe '#damage' do
    context 'when attacking buildings' do
      before do
        @building = Barracks.new
        @siege_engine = SiegeEngine.new
      end

      it "should reduce the building's health_points by the attack_power x2" do
        expect(@building).to receive(:damage).with(100).and_call_original
        @siege_engine.attack!(@building)
        expect(@building.health_points).to eq(400)
      end
    end

    context 'when attacking siege unit' do
      before do
        @siege_engine = SiegeEngine.new
        @enemy_siege_engine = SiegeEngine.new
      end

      it "should be able to deal regular damage" do
        expect(@enemy_siege_engine).to receive(:damage).with(50).and_call_original
        @siege_engine.attack!(@enemy_siege_engine)
        expect(@enemy_siege_engine.health_points).to eq(350)
      end
    end

    context 'when attacking other non-siege units' do
      before do
        @siege_engine = SiegeEngine.new
        @enemy_unit = Footman.new
      end

      it 'raises an error' do
        expect { @siege_engine.attack!(@enemy_unit) }.to raise_error(Unit::InvalidTarget, "Cannot attack non-siege unit!")
      end
    end

  end

end

describe Barracks do

  before :each do
    @barracks = Barracks.new
  end

  describe "#train_siege_engine" do
    it "costs 200 gold" do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800)
    end

    it "costs 3 food" do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77)
    end

    it "costs 60 lumber" do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440)
    end

    it "produces a siege_engine unit" do
      siege_engine = @barracks.train_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end
  end

  describe "#can_train_siege_engine?" do
    it "returns true if there are enough resources to train a siege_engine" do
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do

      expect(@barracks).to receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      expect(@barracks).to receive(:gold).and_return(199)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      expect(@barracks).to receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end
  end

  describe "#train_siege_engine" do
    it "does not train a siege engine if there aren't enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(false)
      expect(@barracks.train_siege_engine).to be_nil
    end
    it "trains a siege engine if there are enough resources" do
      expect(@barracks).to receive(:can_train_siege_engine?).and_return(true)
      expect(@barracks.train_siege_engine).to be_a(SiegeEngine)
    end
  end

end
