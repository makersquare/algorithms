require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    biggest= array[0]
    array.each_with_index do |x, i| 
      if array[(i+1)] > biggest
        biggest = x
        binding.pry
      end
    end
    biggest
  end

  def self.middle_element(array)
    if array.length % 2 == 0
      #array is even length
      array.each_with_index do |x,i|
        
      end

  end

  def self.sum_arrays(array1, array2)
  end
end
