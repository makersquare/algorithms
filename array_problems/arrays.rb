require 'rubygems'
require 'pry-byebug'

module ArrayUtil



  def self.max(array)

  	x = array[0]

  	array.each_with_index do |item, index| 
  		if (array[index] > x)
        x = array[index]
      end
  	end

    x

  end








  def self.middle_element(array)

    mid_index_neg_length = array.length / 2
    mid_neg_value = array[mid_index_neg_length]

    if array.empty?
      nil
    elsif array.length.odd?
      mid_neg_value
    else
      (mid_neg_value + array[(mid_index_neg_length-1)]) / 2.0
    end

  end










  def self.sum_arrays(array1, array2)
    
    array3 = []

    array1.each_with_index do |x,y|
      array3 << (x + array2[y])
    end

    array3

  end

end
