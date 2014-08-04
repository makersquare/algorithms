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

  end
end