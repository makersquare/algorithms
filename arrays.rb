require 'rubygems'
require 'pry-debugger'

module ArrayUtil
  def self.max(array)
    max = nil

    if array.empty?
      return nil
    elsif
      array.count == 1
      array[0]
    elsif
      array.count == 2
      if array[0]>array[1]
        array[0]
      else
        array[1]
      end
    elsif
      max = 0
      array.each do |x|
        if x > max
          max = x
        end
      end
      max

    end
  end

  def self.middle_element(array)
    if array.empty?
      return nil
    elsif
      array.count == 1
      array[0]
    elsif
        array.length%2 == 0
        middle= (array[array.length/2-1].to_f + array[array.length/2].to_f)/2
        middle.to_f
    else
      array[array.length/2]
    end
  end

  def self.sum_arrays(array1, array2)
    if array1.empty? && array2.empty?
      return []
    elsif
      array1.length == 1 && array2.length ==1
      [array1[0] + array2[0]]
    else
      sum = []
      sum << array1
      sum << array2

      sum.transpose.map{|x| x.inject {|sum, y| sum+=y}}
    end
  end
end

ArrayUtil.max( [-1] )   # -1
