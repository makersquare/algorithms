module Set1
  def self.swap_small(array)
    small_index = 0
    array.each_index do |y| 
      small_index = y if array[y] < array[small_index]
    end
    array[small_index], array[0] = array[0], array[small_index]
    array
    #Big O is O(n) -- linear because each_index would require it to iterate through each entry.
    #Thus is would take more time for bigger arrays. 
  end


  def self.find_sum_2(array, sum = 0)
    return false if array.empty?

    array.each do |x|
      if x==0
        return true
      elsif x<0
        return true if array.include?(x*-1)
      end
    end
    false
  end
  #My BigO for find_sum_2 sometimes tend towards n-linear and sometimes squared.

  def self.find_sum_3(array)
    return false if array.empty?
    new_array = array.repeated_combination(3)
    new_array.each do |x|
      if x.inject(:+) == 0
        return true
      end
    end
    false
  end
  #I think this Big O is faster than the alternate below.  But I don't know if it's
  #linear or squared.
end

#ALTERNATE SUM 3 -- Big O is logarithmic because three each's are called.
#   def self.find_sum_3(array)
#     return false if array.empty?
#     array.each do |x|
#       array.each do |y|
#         array.each do |z|
#           return true if z == 0
#           return true if x+y+z==0
#         end
#       end
#     end
#     false
#   end
# end
Set1.swap_small([5, 8, 1, 2])
Set1.find_sum_2([9, 3, -1])
Set1.find_sum_2 ([1, 2, 3])
