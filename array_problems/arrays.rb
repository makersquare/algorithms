require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)

    # total_count = array.length
    max_value = array[0]
    counter = 0

    # until counter == total_count do
      array.each_index do |i|
        if array[i] > max_value
          max_value = array[i]
        end
      #   counter += 1
      end
    # end

    return max_value
  end

  def self.middle_element(array)
    #[3,2,1,4,5] = 1
    #[3,2,1,2,4,5] = 1.5
    if array.length == 0
      return nil
    end

    # array_length = array.length
    array_middle = array.length / 2 #middle for odd numbered arrays

    if array.length.even?
      average_val = (array[array_middle] + array[array_middle - 1]) / 2.0
      return average_val
    else
      return array[array_middle]
    end
  end

  def self.sum_arrays(array1, array2)
    array3 = [ ]
    array1.each_index do |i|
      # array2.each_index do |i|
        array3 << array1[i] + array2[i]
      # end
    end
    return array3
  end
end
