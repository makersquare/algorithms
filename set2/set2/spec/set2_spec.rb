require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../set2.rb'

describe "Set2" do
  describe ".find_intersection" do
    it "will return empty array for 3 empty arrays" do
      expect(Set2.find_intersection([],[],[])).to eq([])
    end

    it "will return empty array for 3 empty arrays with no common elements" do
      expect(Set2.find_intersection([5],[6],[7])).to eq([])
      expect(Set2.find_intersection([5,10, 15, 20],[6, 12, 18, 24],[7, 14, 21, 28])).to eq([])
      expect(Set2.find_intersection([15, 20, 5, 10],[12, 24, 18, 6],[7, 14, 28, 21])).to eq([])
    end

    it "will return an array with 1 element if that's the only common one" do
      expect(Set2.find_intersection([7],[7],[7])).to eq([7])
      expect(Set2.find_intersection([15, 20, 7, 5, 10],[12, 7, 24, 18, 6],[7, 14, 28, 21])).to eq([7])
    end

    it "will return an array with all intersecting values" do
      intersection = Set2.find_intersection([24, 15, 20, 7, 5, 10],[12, 7, 24, 18, 6],[7, 24, 14, 28, 21]) 
      expect(intersection.include?(7)).to eq(true)
      expect(intersection.include?(24)).to eq(true)
      expect(intersection.size).to eq(2)
    end
    
    it "will not include values that are only present in 2 arrays" do
      expect(Set2.find_intersection([10],[10],[7])).to eq([])
    end

  end

  describe ".find_first_dup" do
    it "will return nil if there are no duplicates" do
      expect(Set2.find_first_dup([1, 2, 3, 4, 5])).to eq(nil)
    end

    it "will return the first duplicate in the array" do
      expect(Set2.find_first_dup([1, 1])).to eq(1)
      expect(Set2.find_first_dup([-1, -1])).to eq(-1)
      expect(Set2.find_first_dup([0, 7, -1,8, 21, 2, -1])).to eq(-1)
      expect(Set2.find_first_dup([0, 7, -1,8, 21, 0, 2, -1])).to eq(0)
    end
  end

  describe ".find_mode" do
    it "will return nil if there are no elements" do
      expect(Set2.find_mode([])).to eq(nil)
    end

    it "will return the mode of the array" do
      expect(Set2.find_mode([1, 1])).to eq(1)
      expect(Set2.find_mode([-1, -1])).to eq(-1)
      expect(Set2.find_mode([5, 10, 15, 20, 5, 10, 10, 5, 10])).to eq(10)
    end
  end
end
