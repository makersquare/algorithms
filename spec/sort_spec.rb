require 'rubygems'
require 'rspec'
require_relative '../sort.rb'


describe 'Sort' do |variable|
  describe '.selection_sort' do
    it "returns an empty array" do
      expect(Sort.selection_sort([])).to eq([])
    end
  end

  describe '.selection_sort' do
    it "successful with duplicates" do
      expect(Sort.selection_sort([4,5,2,3,8,9,1,2,2])).to eq([4,5,2,3,8,9,1,2,2].sort)
    end
  end

  describe '.selection_sort' do
    it "works with negatives" do
      expect(Sort.selection_sort([-1,-5,2,6,44,95,-4])).to eq([-1,-5,2,6,44,95,-4].sort)
    end
  end

  describe '.selection_sort' do
    rand_arr = (0..20000).to_a.map!{|x| x = (rand()*1000).to_i }

    it "works for large unordered arrays." do
      expect(Sort.selection_sort(rand_arr)).to eq(rand_arr.sort)
    end
  end

end