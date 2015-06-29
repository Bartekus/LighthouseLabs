require_relative 'spec_helper'

describe 'Parrot' do

  before :each do
    @parrot = Parrot.new('Parrot', true, nil, true, true)
  end

  describe '#new' do
    it "is a animal" do
      expect(Parrot.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@parrot.name).to eq('Parrot')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect(@parrot.backbone).to eq("I'm a Parrot and I've got backbone!")
    end
  end

  describe '#flight' do
    it "can access flight module" do
      expect(@parrot.fly).to eq("I'm a Parrot, I'm flying!")
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect{@parrot.swim}.to raise_error(NoMethodError)
    end
  end

end
