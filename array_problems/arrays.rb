require 'rubygems'
require 'pry-byebug'

module ArrayUtil
  def self.max(array)
    highest_number = array[0]
    array.each do |num|
      if highest_number < num
        highest_number = num
      end
    end
    highest_number
  end

  def self.middle_element(array)
    middle_number = nil
    if array.length == 0
      middle_number
    elsif array.length % 2 == 0
      x = array[(array.length / 2)]
      y = array[(array.length / 2) - 1]
      middle_number = (x + y) / 2.0
    elsif array.length % 2 == 1
      number = (array.length / 2)
      middle_number = array[number]
    end
    middle_number
  end

=begin
    
  Patrick's answer:

  def self.middle_element(array)
    return nil if array.empty?
    midpoint = array.length /2
    if array.length % 2 ==0
      (array[midpoint] + array [midpoint -1]) / 2.0
    else
      array[midpoint]
    end
    
=end

  def self.sum_arrays(array1, array2)
    new_array = []
    (0...array1.length).each do |num|
      new_array << ((array1[num]) + (array2[num]))
    end
    new_array
  end
end
