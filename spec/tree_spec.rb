require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../tree.rb'

describe "Tree" do
  before(:each) do
    @house = @door = Node.new("door")
    @l_room = @house.add_child("living room")
    @kitchen = @l_room.add_child("kitchen")
    @tv = @l_room.add_child("TV")
    @couch = @l_room.add_child("Couch")
    @stairs = @l_room.add_child("Stairs")
    @refrigerator = @kitchen.add_child("refrigerator")
    @microwave = @kitchen.add_child("microwave")
    @food = @kitchen.add_child("food")
    @l_room2 = @stairs.add_child("2nd living room")
    @bedroom1 = @l_room2.add_child("bedroom1")
    @bedroom2 = @l_room2.add_child("bedroom2")
    @bedroom3 = @l_room2.add_child("bedroom3")
  end

  describe "#dfs" do
    it "should be able to find the root node" do
      expect(@house.dfs("door")).to eq(@door)
    end

    it "should be able to find directly connected nodes" do
      expect(@house.dfs("kitchen")).to eq(@kitchen)
      expect(@house.dfs("living room")).to eq(@l_room)
      expect(@house.dfs("TV")).to eq(@tv)
      expect(@house.dfs("Couch")).to eq(@couch)
    end

    it "should be able to find nodes further away" do
      expect(@house.dfs("food")).to eq(@food)
      expect(@house.dfs("bedroom2")).to eq(@bedroom2)
      expect(@house.dfs("bedroom1")).to eq(@bedroom1)
      expect(@house.dfs("Stairs")).to eq(@stairs)
    end
  end

  describe "#bfs" do
    it "should be able to find the root node" do
      expect(@house.bfs("door")).to eq(@door)
    end

    it "should be able to find directly connected nodes" do
      expect(@house.bfs("kitchen")).to eq(@kitchen)
      expect(@house.bfs("living room")).to eq(@l_room)
      expect(@house.bfs("TV")).to eq(@tv)
      expect(@house.bfs("Couch")).to eq(@couch)
    end

    it "should be able to find nodes further away" do
      expect(@house.bfs("food")).to eq(@food)
      expect(@house.bfs("bedroom2")).to eq(@bedroom2)
      expect(@house.bfs("bedroom1")).to eq(@bedroom1)
      expect(@house.bfs("Stairs")).to eq(@stairs)
    end
  end
end
