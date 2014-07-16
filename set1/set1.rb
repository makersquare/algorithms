module Set1
  def self.swap_small(array)
  	other = array.map {|x| x}
  	other[array.index(array.min)], other[array.index(array.max)] = array.max, array.min
  	other
  end

# O notation is linear because it has to go through each element of the array thus taking longer it you had more elements

  def self.find_sum_2(array, sum = 0)
   	arr.combination(2).any? {|a, b| (a + b).zero? }
  end

# this would be a constant (if it works). My brain is fried mostly from traveling and not sleeping. Will get better at this in a few days.


  def self.find_sum_3(array)
  	arr.combination(3).any? {|a, b, c| (a + b + c).zero? }
  end
end
# constant again, and again that's if it works. spec is acting wonky. Think it's a Linux issue.
