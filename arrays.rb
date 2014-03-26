require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)

    if array.empty? 
      nil
    elsif array.count == 1 
      array[0]
    else
    largest = 0
    array.each do |x|
      if x > largest 
        largest = x
      end
    end
    largest
  end
end

  def self.middle_element(array)
      if array.empty?
        nil
      elsif 
        array.count == 1
        array[0]
      elsif 
        array.count % 2 == 0
        index = array.count/2
        (array[index].to_f + array[index-1]).to_f / 2
      elsif 
        array.count % 2 == 1
        index = array.count/2
        array[index]
      end


  end

  def self.sum_arrays(array1, array2)
      if array1.empty? || array2.empty?
        []
      else 
          newray = [array1, array2]
          newray.transpose.map{|arr| arr.inject{|sum,element| sum+=element }}
    end
  end
end
