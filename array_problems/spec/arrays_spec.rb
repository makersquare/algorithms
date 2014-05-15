require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../arrays.rb'

describe "ArrayUtil" do
  describe ".max" do
    it "should return nil for an empty array" do
      expect(ArrayUtil.max([])).to eq(nil)
    end

    it "should return the only element if the array has 1 element" do
      expect(ArrayUtil.max([-1])).to eq(-1)
      expect(ArrayUtil.max([0])).to eq(0)
      expect(ArrayUtil.max([1])).to eq(1)
    end

    it "should return the larger element if the array has 2 elements" do
      expect(ArrayUtil.max([-1, 1])).to eq(1)
      expect(ArrayUtil.max([0, -10])).to eq(0)
      expect(ArrayUtil.max([1, 10])).to eq(10)
    end

    it "should find the largest number in a large array" do
      expect(ArrayUtil.max([100, 50, 200, 73, 4.2, 80])).to eq(200)
    end

    it "should not break when you have duplicates" do
      expect(ArrayUtil.max([10, 10])).to eq(10)
      expect(ArrayUtil.max([1, 10, 10])).to eq(10)
      expect(ArrayUtil.max([10, 10, 20])).to eq(20)
    end

    it "should not break when you have negative numbers" do
      expect(ArrayUtil.max([-1, -5, -10, -2])).to eq(-1)
    end
  end

  describe ".middle_element" do
    it "should return nil for an empty array" do
      expect(ArrayUtil.middle_element([])).to eq(nil)
    end

    it "should return the only element for array of size 1" do
      expect(ArrayUtil.middle_element([1])).to eq(1)
    end

    it "should return the middle element for arrays of odd size" do
      expect(ArrayUtil.middle_element([1])).to eq(1)
      expect(ArrayUtil.middle_element([1, 2, 3])).to eq(2)
      expect(ArrayUtil.middle_element([1, 3, 5, 7, 9])).to eq(5)
    end

    it "should average the 2 middle elements for arrays of even size" do
      expect(ArrayUtil.middle_element([1, 3])).to eq(2)
      expect(ArrayUtil.middle_element([1, 3, 5, 7, 9, 11])).to eq(6)
    end

    it "should return floats when the middle elements average to a decimal" do
      expect(ArrayUtil.middle_element([1, 2, 3, 4])).to eq(2.5)
    end
  end

  describe ".sum_arrays" do
    it "should return an empty array if the inputs are empty" do
      expect(ArrayUtil.sum_arrays([], [])).to eq([])
    end

    it "should return an array with the sum of two arrays with arrays size 1" do
      expect(ArrayUtil.sum_arrays([5], [6])).to eq([11])
    end

    it "should return an array with the sum of two arrays with larger arrays" do
      expect(ArrayUtil.sum_arrays([5, 6, 7, 8], [6, 9, 12, 15])).to eq([11, 15, 19, 23])
    end
  end
end
