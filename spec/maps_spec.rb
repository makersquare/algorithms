require_relative '../maps.rb'

describe Map do
  it "exists" do
    expect(Map).to be_a(Class)
  end

  it "can be instantiated" do
    expect(Map.new).to be_a(Map)
  end
end
