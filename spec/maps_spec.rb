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
        expect(map.find_path("c3", "c1")).to eq(200)
      end
    end

    context "cities with complex connections" do
      before do
        map.add_road("c1", "c2", 100)
        map.add_road("c1", "c3", 100)
        map.add_road("c1", "c4", 100)
        map.add_road("c2", "c5", 100)
        map.add_road("c2", "c6", 100)
        map.add_road("c3", "c7", 100)
        map.add_road("c3", "c8", 100)
        map.add_road("c8", "c9", 100)
      end

      context "cities connected with no cycles" do
        it "finds all existing connections" do
          expect(map.find_path("c1", "c9")).to eq(300)
          expect(map.find_path("c1", "c6")).to eq(200)
          expect(map.find_path("c9", "c6")).to eq(500)
        end

        it "finds new paths" do
          map.add_city("c10")
          map.add_city("c11")
          map.add_road("c10", "c11", 150)
          expect(map.find_path("c10", "c11")).to eq(150) # 150
          expect(map.find_path("c1", "c11")).to eq(nil) # nil
          map.add_road("c4", "c10", 200)
          expect(map.find_path("c1", "c11")).to eq(450) # 450
        end
      end

      context "cities with cycles" do
        before do
          map.add_city("c10")
          map.add_city("c11")
          map.add_city("c12")
          map.add_city("c13")
          map.add_road("c8", "c7", 50)
          map.add_road("c10", "c1", 50)
          map.add_road("c10", "c3", 50)
          map.add_road("c4", "c11", 50)
          map.add_road("c12", "c11", 50)
          map.add_road("c12", "c13", 50)
          map.add_road("c13", "c2", 50)
          map.add_road("c11", "c13", 75)
        end

        it "finds best paths" do
          expect(map.find_path("c5", "c9")).to eq(500)
          expect(map.find_path("c12", "c8")).to eq(150)
        end

        it "finds best path after alterations" do
          map.add_road("c1", "c12", 25)
          map.add_road("c2", "c12", 25)
          expect(map.find_path("c5", "c9")).to eq(450)
          expect(map.find_path("c12", "c8")).to eq(125)
        end
      end
    end
  end
end
