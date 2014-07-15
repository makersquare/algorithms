require 'rubygems'
require 'rspec'
require 'pry-debugger'
require_relative '../set1.rb'

describe "Set1" do
  describe ".swap_small" do
    it "should return the same array if there is 1 element" do
      expect(Set1.swap_small([1])).to eq([1])
    end

    it "should move the smallest element to the front in 2 element arrays" do
      expect(Set1.swap_small([5, 10])).to eq([5, 10])
      expect(Set1.swap_small([10, 5])).to eq([5, 10])
    end

    it "should not change arrays that have the smallest element at the front" do
      expect(Set1.swap_small([5, 10, 6, 8])).to eq([5, 10, 6, 8])
    end

    it "should swap positions between smallest element and first element" do
      expect(Set1.swap_small([4, 10, 200, -1])).to eq([-1, 10, 200, 4])
    end
  end

  describe ".find_sum_2" do
    it "should return false for an empty array" do
      expect(Set1.find_sum_2([])).to eq(false)
    end

    it "should return true for an array with just the number 0" do
      expect(Set1.find_sum_2([0])).to eq(true)
    end

    it "should return true for an array with the number 0 in it" do
      expect(Set1.find_sum_2([5, 2, 0, -100])).to eq(true)
    end

    it "should return true if a number and it's negative are in the arrray" do
      expect(Set1.find_sum_2([5, 20, -5, 100])).to eq(true)
      expect(Set1.find_sum_2([5, 20, -3, 100, -20, 2])).to eq(true)
    end

    it "should return false if none of the numbers add to 0" do
      expect(Set1.find_sum_2([5, 6, 7, 8, -1, -2, -3, -4])).to eq(false)
    end
  end

  describe ".find_sum_3" do
    it "should return false for an empty array" do
      expect(Set1.find_sum_3([])).to eq(false)
    end

    it "should return true for an array with just the number 0" do
      expect(Set1.find_sum_3([0])).to eq(true)
    end

    it "should return true for an array with the number 0 in it" do
      expect(Set1.find_sum_3([5, 2, 0, -100])).to eq(true)
    end

    it "should return true if 3 numbers in the array add to 0" do
      expect(Set1.find_sum_3([10, 2, 100, -200, -102, 5])).to eq(true)
      expect(Set1.find_sum_3([10, -51, 100, -201, 102, 5])).to eq(true)
      expect(Set1.find_sum_3([10, 51, 100, -201, -102, 5])).to eq(true) # 51, 51, -102
    end

    it "should return false if no 3 numbers in the array add to 0" do
      expect(Set1.find_sum_3([10, 51, 100, 201, 102, 5])).to eq(false)
    end
  end
end
