require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    if array.count > 0  
      max = array[0]
      array.each_index do |index|
        if array[index] > max
          max = array[index]
        end
      end
      max
    end
  end

  def self.middle_element(array)
    if array.count == 1
      array[0]
    elsif array.count > 1
      length = array.count
      if length % 2 == 0
        first_middle = (length / 2).to_i - 1
        second_middle = first_middle + 1
        (array[first_middle] + array[second_middle]) / 2.0
      else
        array[length / 2]
      end
    end
  end

  def self.sum_arrays(array1, array2)
  end
end
