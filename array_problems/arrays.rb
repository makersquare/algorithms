require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    return nil if array.empty?
    max = array[0]
    array.each { |num| max = num if num > max}
    max
  end

  def self.middle_element(array)
    return nil if array.empty?
    if array.length.even?
      (array[array.length/2] + array[(array.length/2)-1])/2.0
    else
      array[array.length/2]
    end
  end

  def self.sum_arrays(array1, array2)
    summed_array = []
    array1.each_index { |ind| summed_array[ind] = array1[ind] + array2[ind] }
    summed_array
  end
end
