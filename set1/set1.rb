module Set1
  def self.swap_small(array)
    # reminder: solve it naively first
    # find minimum
    return array if array.length == 1
    smallest = array.first
    array.each do |x|
      smallest = x if smallest > x
      smallest
    end
    #store position of minimum
    position_of_minimum = array.index(smallest)
    #store original first number
    first_element = array[0]
    #replace first element with minimum
    array[0] = smallest
    #replace minimum's position with stored first number
    array[position_of_minimum] = first_element
    array
  end


# Given an array of numbers, find out if 
# there are two numbers in the array that add up to 0 (just return true or false). 
# You can use the same number multiple times.
  def self.find_sum_2(array, sum = 0)
    return false if array == []
    return true if array.count(0) > 0
    array.each { |x| return true if array.count(-x) > 0 }
    false
  end
# Same problem as above except check if 
# there are 3 numbers in the array that add up to 0. 
# You can use the same number multiple times.
  def self.find_sum_3(array)
    return false if array == []
    return true if array.count(0) > 0
    array.each do |x|
      array.each do |y|
        array.each do |z|
          return true if x + y + z == 0
        end
      end
    end
    false
  end

end
