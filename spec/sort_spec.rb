require 'rubygems'
require 'rspec'
require 'pry-byebug'
require_relative '../sort.rb'


describe "Sort" do
  describe '.selection_sort' do
    it "should return a sorted array containing the same elements" do
      
      expect(Sort.select_sort([])).to eq([])
      expect(Sort.select_sort([-1,-4,-5,-2,-44,5,6,-100])).to eq([-1,-4,-5,-2,-44,5,6,-100].sort)
      expect(Sort.select_sort([9,9,9,9,9,3,3,3,3,6,6,6,6,4,4,4,3,3,3])).to eq([9,9,9,9,9,3,3,3,3,6,6,6,6,4,4,4,3,3,3].sort)
      expect(Sort.select_sort([1,5,88,3,5,7,66,-1,400,0,5,4,3,8,7,1,3,0,0,7])).to eq([1,5,88,3,5,7,66,-1,400,0,5,4,3,8,7,1,3,0,0,7].sort)
    end
  end

  describe '.bubble_sort' do
    it "should return a sorted array containing the same elements" do
      expect(Sort.bubble_sort([])).to eq([])
      expect(Sort.bubble_sort([-1,-4,-5,-2,-44,5,6,-100])).to eq([-1,-4,-5,-2,-44,5,6,-100].sort)
      expect(Sort.bubble_sort([9,9,9,9,9,3,3,3,3,6,6,6,6,4,4,4,3,3,3])).to eq([9,9,9,9,9,3,3,3,3,6,6,6,6,4,4,4,3,3,3].sort)
      expect(Sort.bubble_sort([1,5,88,3,5,7,66,-1,400,0,5,4,3,8,7,1,3,0,0,7])).to eq([1,5,88,3,5,7,66,-1,400,0,5,4,3,8,7,1,3,0,0,7].sort)
    end
  end

    describe '.bubble_sort' do
    it "should return a sorted array containing the same elements" do
      expect(Sort.bubble_sort2([])).to eq([])
      expect(Sort.bubble_sort2([-1,-4,-5,-2,-44,5,6,-100])).to eq([-1,-4,-5,-2,-44,5,6,-100].sort)
      expect(Sort.bubble_sort2([9,9,9,9,9,3,3,3,3,6,6,6,6,4,4,4,3,3,3])).to eq([9,9,9,9,9,3,3,3,3,6,6,6,6,4,4,4,3,3,3].sort)
      expect(Sort.bubble_sort2([1,5,88,3,5,7,66,-1,400,0,5,4,3,8,7,1,3,0,0,7])).to eq([1,5,88,3,5,7,66,-1,400,0,5,4,3,8,7,1,3,0,0,7].sort)
    end
  end

end