require 'rubygems'


module ArrayUtil
  def self.max(array)
  	array = ArrayUtil.eleminate_nonnumbers(array)
  	largest_num = 0
  	array.each do |x| 
  		largest_num = x if x > largest_num
  	end
  	largest_num
  end

  def self.middle_element(array)
  	array = ArrayUtil.eleminate_nonnumbers(array)
  	x = array.length
  	if x % 2 == 1
  		return array[x/2]
  	else
  		y = array[x/2] + array[(x/2)-1]
  		return (y.to_f)/2
  	end

  end

  def self.sum_arrays(array1, array2)
  	array1 = ArrayUtil.eleminate_nonnumbers(array1)
  	array2 = ArrayUtil.eleminate_nonnumbers(array2)
  	new_array = []
  	array1.each_index do |i|
  		new_array << (array1[i] + array2[i])
  	end
  	new_array
  end

  def self.eleminate_nonnumbers(array)
  	array = array.select {|x| x.is_a? Integer}
  end
end

my_array = [3, 5, 9, 8, 6, "blue"]
my_other_array = [1, 8, 9, 14]
another_array = [7, 9, 11, 1]
puts ArrayUtil.max(my_array)
puts ArrayUtil.middle_element(my_array)
puts ArrayUtil.middle_element(my_other_array)
p ArrayUtil.sum_arrays(my_other_array, another_array)

