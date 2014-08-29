require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    curr_max = array[0]
    array.each {|x| x > curr_max ? curr_max = x : curr_max}
    curr_max
  end

  def self.middle_element(array)
    length = array.length
    mid_index = (length-1)/2
    if length == 0
      nil
    elsif length.odd?
      array[mid_index]
    else
      (array[mid_index] + array[mid_index + 1])/2.0
    end
  end

  def self.sum_arrays(array1, array2)
    sum = []
    # i = 0
    # while i < array1.length
    #   sum << (array1[i] + array2[i])
    #   i += 1
    # end
    array1.each_index do |index|
      sum << array1[index] + array2[index]
    end
    sum
  end
end
