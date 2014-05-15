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

    context 'when an array contains a negative integer' do
      it 'returns a sorted array' do
        expect(Sort.selection_sort([4, 7, 6, -2])).to eq([-2, 4, 6, 7])
      end
    end

    context 'when an array contains duplicate integers' do
      it 'returns a sorted array' do
        expect(Sort.selection_sort([3, 4, 1, 3])).to eq([1, 3, 3, 4])
      end
    end

    context 'when an array contains only negative integers' do
      it 'returns an array of sorted negtive integers' do
        expect(Sort.selection_sort([-2, -3, -9])). to eq([-9, -3, -2])
      end
    end

    context 'when an array contains one element' do
      it 'return the original array' do
        expect(Sort.selection_sort([4])).to eq([4])
      end
    end

    context 'when an array contains floats' do
      it 'returns a sorted array' do
        expect(Sort.selection_sort([3, 1, -3, 2.2])).to eq([-3, 1, 2.2, 3])
      end
    end

    context 'when an array contains 0' do
      it 'retrurns a sorted array' do
        expect(Sort.selection_sort([3, 5, 6, 0, 1])).to eq([0, 1, 3, 5, 6])
      end
    end

  end

  describe '.merge' do
    context 'when the arguments are empty' do
      it "returns an empty array" do
        expect(Sort.merge([], [])).to eq([])
      end
    end

    context 'when one of the arguments is empty' do
      it "returns the other array" do
        a = [5, 7, 9]
        expect(Sort.merge(a, [])).to eq(a)
        expect(Sort.merge([], a)).to eq(a)
      end
    end

    context 'when each array has 1 element' do
      it "returns an array with both elements sorted" do
        expect(Sort.merge([5], [2])).to eq([2, 5])
      end
    end

    context 'when you have 2 large sorted arrays' do
      it "returns a sorted array that is the combination of the two" do
        a = [2, 6, 10, 26, 58, 89, 103]
        b = [1, 5, 11, 13, 15, 19, 60, 61, 62]
        expect(Sort.merge(a, b)).to eq((a+b).sort)
      end
    end
  end

  describe '.mergesort' do
    context 'when the argument is empty' do
      it "returns an empty array" do
        expect(Sort.mergesort([])).to eq([])
      end
    end

    context 'when the argument has 1 number' do
      it "returns the same array" do
        expect(Sort.mergesort([1])).to eq([1])
      end
    end

    context 'when the argument has sorted elements' do
      it "returns the same array" do
        expect(Sort.mergesort([1, 2, 3])).to eq([1, 2, 3])
      end
    end

    context 'when the argument has unsorted elements' do
      it "returns a sorted array" do
        expect(Sort.mergesort([2, 1, 3])).to eq([1, 2, 3])
      end
    end

    context 'when the argument has repeating elements' do
      it "returns a sorted array" do
        expect(Sort.mergesort([3, 2, 3])).to eq([2, 3, 3])
      end
    end

    context 'when the argument is large and randomized' do
      it "returns a sorted array" do
        large_array = []
        100.times {large_array << rand(1000)}
        sorted_array = large_array.sort
        expect(Sort.mergesort(large_array)).to eq(sorted_array)
      end
    end
  end


  end

    describe ".sort" do

    context 'when the array is empty' do
      it "returns an empty array" do
        expect(Sort.sort([])).to eq([])
      end
    end

    context 'when an array contains a negative integer' do
      it 'returns a sorted array' do
        expect(Sort.sort([5, 2, 9, 11, 4, 7, 6, -2])).to eq([[2, 5, 9, 11], [-2, 4, 6, 7]])
      end
    end

    context 'when an array contains duplicate integers' do
      it 'returns a sorted array' do
        expect(Sort.sort([7, 5, 9, 3, 4, 1, 3])).to eq([[5, 7, 9], [1, 3, 3, 4]])
      end
    end

    # context 'when an array contains only negative integers' do
    #   it 'returns an array of sorted negtive integers' do
    #     expect(Sort.sort([-2, -3, -9], [-4, -11])). to eq([-11, -9, -4, -3, -2])
    #   end
    # end

    # context 'when an array contains one element' do
    #   it 'return the original array' do
    #     expect(Sort.sort([7], [4])).to eq([4, 7])
    #   end
    # end

    # context 'when an array contains floats' do
    #   it 'returns a sorted array' do
    #     expect(Sort.sort([2, 7, 5.5], [3, 1, -3, 2.2])).to eq([-3, 1, 2, 2.2, 3, 5.5, 7])
    #   end
    # end

    # context 'when an array contains 0' do
    #   it 'retrurns a sorted array' do
    #     expect(Sort.sort([0, 12, 23], [3, 5, 6, 0, 1])).to eq([0, 0, 1, 3, 5, 6, 12, 23])
    #   end
    # end

  end

  # describe ".merge" do

  #   context 'when the array is empty' do
  #     it "returns an empty array" do
  #       expect(Sort.merge([], [])).to eq([])
  #     end
  #   end

  #   context 'when an array contains a negative integer' do
  #     it 'returns a sorted array' do
  #       expect(Sort.merge([5, 2, 9, 11], [4, 7, 6, -2])).to eq([-2, 2, 4, 5, 6, 7, 9, 11])
  #     end
  #   end

  #   context 'when an array contains duplicate integers' do
  #     it 'returns a sorted array' do
  #       expect(Sort.merge([7, 5, 9], [3, 4, 1, 3])).to eq([1, 3, 3, 4, 5, 7, 9])
  #     end
  #   end

  #   context 'when an array contains only negative integers' do
  #     it 'returns an array of sorted negtive integers' do
  #       expect(Sort.merge([-2, -3, -9], [-4, -11])). to eq([-11, -9, -4, -3, -2])
  #     end
  #   end

  #   context 'when an array contains one element' do
  #     it 'return the original array' do
  #       expect(Sort.merge([7], [4])).to eq([4, 7])
  #     end
  #   end

  #   context 'when an array contains floats' do
  #     it 'returns a sorted array' do
  #       expect(Sort.merge([2, 7, 5.5], [3, 1, -3, 2.2])).to eq([-3, 1, 2, 2.2, 3, 5.5, 7])
  #     end
  #   end

  #   context 'when an array contains 0' do
  #     it 'retrurns a sorted array' do
  #       expect(Sort.merge([0, 12, 23], [3, 5, 6, 0, 1])).to eq([0, 0, 1, 3, 5, 6, 12, 23])
  #     end
  #   end

  # end

end
