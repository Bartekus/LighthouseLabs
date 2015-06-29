require_relative 'spec_helper'

describe 'Chimpanzee' do

  before :each do
    @chimpanzee = Chimpanzee.new('Chimpanzee', true, nil, true, true, true, true)
  end

  describe '#new' do
    it "is a animal" do
      expect(Chimpanzee.ancestors).to include(Animal)
    end
  end

  describe '#name' do
    it "has and knows its name" do
      expect(@chimpanzee.name).to eq('Chimpanzee')
    end
  end

  describe '#backbone' do
    it "can access backbone module" do
      expect(@chimpanzee.backbone).to eq("I'm a Chimpanzee and I've got backbone!")
    end
  end

  describe '#flight' do
    it "can not access flight module" do
      expect{@chimpanzee.flight}.to raise_error(NoMethodError)
    end
  end

  describe "#swimming" do
    it "can access swim module" do
      expect{@chimpanzee.swim}.to raise_error(NoMethodError)
    end
  end

end




