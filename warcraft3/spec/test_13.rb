require_relative 'spec_helper'

# A dead unit cannot attack another unit.
# Conversely, an alive unit will also not attack another unit that is already dead.

describe 'Unit' do
  describe '#dead?' do
    context 'when dead unit is attacked' do
      before do
        @alive_unit = Unit.new(100, 0)
        @dead_unit = Unit.new(0, 0)
      end

      it 'raises an error' do
        expect { @alive_unit.attack!(@dead_unit) }.to raise_error(Unit::InvalidTarget, "Cannot attack dead unit!")
      end
    end

    context 'when dead unit tries to attack' do
      before do
        @alive_unit = Unit.new(100, 0)
        @dead_unit = Unit.new(0, 0)
      end

      it 'raises an error' do
        expect { @dead_unit.attack!(@alive_unit) }.to raise_error(Unit::InvalidCommand, "Cannot issue commands to a dead unit!")
      end
    end

  end
end
