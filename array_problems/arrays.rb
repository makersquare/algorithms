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

  def self.sum_uneven_arrays(array1,array2)
    adder_array, base_array = ( array1.length > array2.length ? [array2, array1] : [array1, array2] )
    adder_array.each_index {|ind| base_array[ind] += adder_array[ind]}
    base_array
  end
end
