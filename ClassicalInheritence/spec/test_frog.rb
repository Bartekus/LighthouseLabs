require_relative 'spec_helper'

describe 'Frog' do

  before :each do
    @frog = Frog.new('Frog', true, nil, true, true, true)
  end

  describe '#new' do
    it "is a animal" do
      expect(Frog.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@frog.name).to eq('Frog')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect(@frog.backbone).to eq("I'm a Frog and I've got backbone!")
    end
  end

  describe '#flight' do
    it "can not access flight module" do
      expect{@frog.fly}.to raise_error(NoMethodError)
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect(@frog.swim).to eq("I'm a Frog, I'm Swimming!")
    end
  end

end



