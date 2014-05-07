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
