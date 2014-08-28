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
    array.sort!
    # length = array.length
    # if length.is_odd?
    #   array[(length - 1)/2]
    # end
  end

  def self.sum_arrays(array1, array2)
  end
end
