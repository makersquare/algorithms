require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    return nil if array.empty?
    max = array[0]
    array.each_index { |ind| max > array[ind] ? max : max = array[ind] }
    max
  end

  def self.middle_element(array)
    return nil if array.empty?
    middle = array.length/2
    if array.length.even?
      result = (array[middle] + array[middle-1])/2.0
    else
      result = array[middle]
    end
    result
  end

  def self.sum_arrays(array1, array2)
    return [] if array1.empty? && array2.empty?
    summed_array = []
    array1.each_index { |ind| summed_array[ind] = array1[ind] + array2[ind] }
    summed_array
  end
end
