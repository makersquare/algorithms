module Set1
  def self.swap_small(array) #
    return array if array.length == 1
      smallest = array.first
      array.each do |x|
        smallest = x if smallest > x
        smallest
        end
    smallindex = array.index(smallest)
    array.insert(array.index(smallest), array.first) #copy first right before smallest
    array.delete_at(0) #delete first
    array.insert(0, smallest) #copy smallest to first index
    array.delete_at(smallindex+1)  #need to delete second smallest
    return array
  end
#O(n) - second part is constant because it knows where to look, but finding the smallest is a loop

  def self.find_sum_2(array, sum = 0)
    return false if array == []
    return true if array == [0]
    array.each {|x| return true if array.count(-x) > 0} 
    false
  end
#O(n) - linear because it searches for x and -x, not exponentially

  def self.find_sum_3(array)   
    return false if array == []
    return true if array.count(0) > 0
    array.each do |x|
      array.each do |y|
        array.each do |z|
          return true if x+y+z == 0
        end
      end
    end
    false
  end
end
#O(n^3) ~ so slow