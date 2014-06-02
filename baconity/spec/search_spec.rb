require './lib/search.rb'

describe ActorSearcher do
  let(:as) {ActorSearcher.new}
  let(:id) {1155}

  it "should exist" do
    expect(ActorSearcher).to be_a(Class)
  end

  describe "#initialize" do
    it "initializes with empty nodes hash and empty queue hash" do
      expect(as.nodes).to eq({})
      expect(as.queue).to eq([])
    end
  end

  describe "#grab_actor" do
    it "grabs an actor from the localhost api" do
      actor = as.grab_actor(id)
      expect(actor['id']).to eq(id)
    end
  end

  describe "#add_node" do
    it "takes a name, id, movies array and weight and returns a Node instance" do
      name = "Meg Ryan"
      movies = []
      weight = 0
      node = as.add_node(name, id, movies, weight)
      expect(as.nodes[id]).to eq(node)
    end
  end

  describe "#add_actor" do
    it "takes an id of the actor and a weight and returns the created node" do
      weight = 0
      # expect(:as).to receive(:grab_actor).with(id).ordered
      # expect(:as).to receive(:add_node).ordered
      node = as.add_actor(id, 0)
      expect(as.nodes[id]).to eq(node)
    end
  end

  describe "#connect_actors" do
    it "takes two nodes and a weight and connects the two nodes" do
      node1 = as.add_node("Meg Ryan", id, [], 0)
      node2 = as.add_node("Kevin Bacon", 1, [], 1)

      as.connect_actors(node1, node2)

      expect(as.nodes[node1.id].connections[node2.id]).to eq(node1.connections[node2.id])
      expect(as.nodes[node2.id].connections[node1.id]).to eq(node1.connections[node2.id])

    end
  end

  describe "#"

end
