require 'rubygems'

module ArrayUtil
  def self.max(array)
      return nil if array.empty?
      array.reject { |num| array.any? { |int| int > num } }.pop
  end

  def self.middle_element(array)
      return nil if array.empty?
      array.count.even? ? array.inject(:+).to_f/array.count : array[array.count/2]
  end

  def self.sum_arrays(array1, array2)
      array1.each_with_index.map {|num, i| num + array2[i]}
  end
end
