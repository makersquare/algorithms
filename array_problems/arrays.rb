require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    curr_max = array[0]
    array.each do |x|
      if x > curr_max
        curr_max = x
      end
    end
    curr_max
  end

  def self.middle_element(array)
    length = array.length
    mid_index = (length-1)/2
    if length == 0
      nil
    elsif length.odd?
      middle = array[mid_index]
    else
      middle = (array[mid_index] + array[mid_index + 1])/2.0
    end
    middle
  end

  def self.sum_arrays(array1, array2)
    sum = []
    if array1.empty? && array2.empty?
      sum
    else
      i = 0
      while i < array1.length
        sum << (array1[i] + array2[i])
        i += 1
      end
    end
    sum
  end
end
