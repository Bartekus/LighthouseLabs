require_relative 'spec_helper'

describe 'Mammal' do

  before :each do
    @mammal = Mammal.new('Mammal', true, nil, true, true)
  end

  describe '#new' do
    it "is a animal" do
      expect(Mammal.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@mammal.name).to eq('Mammal')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect(@mammal.backbone).to eq("I'm a Mammal and I've got backbone!")
    end
  end

  describe '#flight' do
    it "can not access flight module" do
      expect{@mammal.flight}.to raise_error(NoMethodError)
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect{@mammal.swim}.to raise_error(NoMethodError)
    end
  end

end
