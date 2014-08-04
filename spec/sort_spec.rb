require 'rubygems'
require 'rspec'
require_relative '../sort.rb'

describe 'Sort' do
  describe '.selection_sort' do

    context 'when the argument is empty' do
      it "returns an empty array" do
        expect(Sort.selection_sort([])).to eq([])
      end
    end

    context 'when the array includes negative numbers' do
      it "correctly sorts negative numbers" do
        array = [6, 9, 8, -2, 100, 0, -44]
        result = [-44, -2, 0, 6, 8, 9, 100]
        expect(Sort.selection_sort(array)).to eq(result)
      end
    end

    context 'when the array includes duplicate numbers' do
      it "correctly sorts duplicate numbers" do
        array = [6, 9, 9, -2, 100, 0, 0]
        result = [-2, 0, 0, 6, 9, 9, 100]
        expect(Sort.selection_sort(array)).to eq(result)
      end
    end

    context 'when the array is large' do
      it "correctly sorts arrays of any size" do
        array = [6, 9, 8, -2, 100, 0, -44, 4, 5, 8, 1000, -900, -50, 75, 75, 99, 1000]
        result = [-900, -50, -44, -2, 0, 4, 5, 6, 8, 8, 9, 75, 75, 99, 100, 1000, 1000]
        expect(Sort.selection_sort(array)).to eq(result)
      end
    end

    context 'when the array includes decimals' do
      it "correctly sorts decimals" do
        array = [6, 9, 8, -2, 100, 0, 8.5, 42.42]
        result = [-2, 0, 6, 8, 8.5, 9, 42.42, 100]
        expect(Sort.selection_sort(array)).to eq(result)
      end
    end

    context 'when non-numbers are included' do
      it "returns nil" do
        array = [6, 9, 8, -2, "dog", 0, -44]
        result = nil
        expect(Sort.selection_sort(array)).to eq(result)
      end
    end



  end
end