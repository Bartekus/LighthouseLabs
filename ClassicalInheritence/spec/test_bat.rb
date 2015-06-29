require_relative 'spec_helper'

describe 'Bat' do

  before :each do
    @bat = Bat.new('Bat', true, nil, true, true, true)
  end

  describe '#new' do
    it "is a animal" do
      expect(Bat.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@bat.name).to eq('Bat')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect(@bat.backbone).to eq("I'm a Bat and I've got backbone!")
    end
  end

  describe '#flight' do
    it "can not access flight module" do
      expect(@bat.fly).to eq("I'm a Bat, I'm flying!")
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect{@bat.swim}.to raise_error(NoMethodError)
    end
  end

end




