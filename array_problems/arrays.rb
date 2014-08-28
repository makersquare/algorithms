require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    if array.empty?
      return nil
    else
      array.sort.last
    end
  end

  def self.middle_element(array)
  end

  def self.sum_arrays(array1, array2)
  end
end
