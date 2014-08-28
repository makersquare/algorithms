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
  end

  def self.sum_arrays(array1, array2)
  end
end
