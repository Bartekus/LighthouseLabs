require_relative 'spec_helper'

describe 'Amphibian' do

  before :each do
    @amphibian = Amphibian.new('Amphibian', true, nil, true, true)
  end

  describe '#new' do
    it 'takes three parameters and returns a Animal object' do
      expect(Amphibian.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it 'has and knows its name' do
      expect(@amphibian.name).to eq('Amphibian')
    end
  end

  describe '#backbone' do
    it 'can access backbone module' do
      expect(@amphibian.backbone).to eq("I'm a Amphibian and I've got backbone!")
    end
  end

  describe '#flight' do
    it 'can not access flight module' do
      expect{@amphibian.fly}.to raise_error(NoMethodError), "undefined method `flight' for #<Amphibian:0xa7ef84c>"
    end
  end

  describe "#swimming" do
    it 'can access swim module' do
      expect(@amphibian.swim).to eq("I'm a Amphibian, I'm Swimming!")
    end
  end

end
