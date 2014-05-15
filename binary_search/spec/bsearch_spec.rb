require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../bsearch.rb'

describe "ArrayUtil" do
  describe ".bsearch" do
    it "should return false for empty arrays" do
      expect(ArrayUtil.bsearch([], nil)).to eq(false)
    end

    it "should return true for arrays with 1 element equal to input" do
      expect(ArrayUtil.bsearch([1], 1)).to eq(true)
    end

    it "should return false for arrays with 1 element not equal to input" do
      expect(ArrayUtil.bsearch([2], 1)).to eq(false)
    end

    it "should return true for an array that has the element in it" do
      expect(ArrayUtil.bsearch([2, 5, 8, 10], 5)).to eq(true)
      expect(ArrayUtil.bsearch([-10, 3, 8, 19], 5)).to eq(false)
      expect(ArrayUtil.bsearch([2, 3, 5, 8, 10], 5)).to eq(true)
      expect(ArrayUtil.bsearch([-10, 0, 3, 8, 19], 5)).to eq(false)
    end
  end
end
