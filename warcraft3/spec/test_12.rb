require_relative 'spec_helper'

# Units start off alive but they die if their HP hits 0 or lower.
# This is usually a result of receiving damage from combat.

# Implementation: Define a method dead? on the Unit class.
# We add it to Unit instead of Footman for example b/c all units can die, not just footman or peasants.


describe 'Unit' do
  describe '#dead?' do
    context 'before lethal damage' do
      before do
        @unit = Unit.new(100, 0)
      end

      it 'should return false when health points are above 0' do
        expect(@unit.health_points).to eq(100)
        expect(@unit.dead?).to eq(false)
      end
    end

    context 'after lethal damage' do
      before do
        @unit = Unit.new(100, 0)
      end

      it 'should return true when health points are at 0' do
        expect(@unit.health_points).to eq(100)
        @unit.damage(110)
        expect(@unit.dead?).to eq(true)
      end
    end
  end
end
