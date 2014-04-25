require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
  end

  def self.middle_element(array)
  end

  def self.sum_arrays(array1, array2)
    array1.zip(array2).map { |x| x.inject(:+)}
  end
end
