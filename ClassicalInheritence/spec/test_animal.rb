require_relative 'spec_helper'

describe 'Animal' do

  before :each do
    @animal = Animal.new('Animal', true, nil)
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@animal.name).to eq('Animal')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect{@animal.backbone}.to raise_error(NoMethodError)
    end
  end

  describe '#flight' do
    it "can not access flight module" do
      expect{@animal.flight}.to raise_error(NoMethodError)
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect{@animal.swim}.to raise_error(NoMethodError)
    end
  end

end
