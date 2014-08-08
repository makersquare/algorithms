require_relative '../maps.rb'

describe Map do
  it "exists" do
    expect(Map).to be_a(Class)
  end

  it "can be instantiated" do
    expect(Map.new).to be_a(Map)
  end

  describe "#find_path" do
    let(:map) {Map.new}
    before do
      map.add_city("c1")
      map.add_city("c2")
      map.add_city("c3")
      map.add_city("c4")
      map.add_city("c5")
      map.add_city("c6")
      map.add_city("c7")
      map.add_city("c8")
      map.add_city("c9")
    end

    context "cities that are disconnected" do
      it "returns nil" do
        distance = map.find_path("c1", "c2")
        expect(distance).to eq(nil)
      end
    end

    context "start and end point are the same" do
      it "returns 0" do
        distance = map.find_path("c1", "c1")
        expect(distance).to eq(0)
      end
    end

    context "cities that are directly connected" do
      before do
        map.add_road("c1", "c2", 100)
        map.add_road("c1", "c3", 200)
        map.add_road("c2", "c3", 150)
      end

      it "returns the distance between the cities" do
        expect(map.find_path("c1", "c2")).to eq(100)
        expect(map.find_path("c2", "c3")).to eq(150)
      end

      it "connects cities in the reverse order" do
        expect(map.find_path("c3", "c2")).to eq(200)
      end
    end
  end
end
