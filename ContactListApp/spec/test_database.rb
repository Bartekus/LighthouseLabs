require_relative 'spec_helper'


describe Amphibian do

  before :each do
    @amphibian = Amphibian.new('Amphibian', true, nil, true, true)
  end

  it "is a animal" do
    expect(Amphibian.ancestors).to include(Animal)
  end

  it "has and knows its name" do
    expect(@amphibian.name).to eq('Amphibian')
  end

  it "can access backbone module" do
    expect(@amphibian.backbone).to eq("I'm a Amphibian and I've got backbone!")
  end

  it "can not access flight module" do
    expect{@amphibian.fly}.to raise_error(NoMethodError), "undefined method `flight' for #<Amphibian:0xa7ef84c>"
  end

  it "can access swim module" do
    expect(@amphibian.swim).to eq("I'm a Amphibian, I'm Swimming!")
  end

end
