require_relative 'spec_helper'

describe 'Primate' do

  before :each do
    @primate = Primate.new('Primate', true, nil, true, true, true)
  end

  describe '#new' do
    it 'takes three parameters and returns a Animal object' do
      expect(Primate.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@primate.name).to eq('Primate')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect(@primate.backbone).to eq("I'm a Primate and I've got backbone!")
    end
  end

  describe '#flight' do
    it "can not access flight module" do
      expect{@primate.fly}.to raise_error(NoMethodError)
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect{@primate.swim}.to raise_error(NoMethodError)
    end
  end

end
