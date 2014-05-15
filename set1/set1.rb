module Set1
  # this solution is O(n) because for every it inceases linearly
  def self.swap_small(array)
    small = 0
    for i in 0...array.length
      small = i if array[i] < array[small]
    end
    #this swaps the elements in the array
    array[0], array[small] = array[small], array[0]
    array
  end

  #this solution is O(n^2) becase you are running through the array n times twice, so ==n^2
  def self.find_sum_2(array, sum = 0)
    (0...array.length).each do |i|
      (i...array.length).each do |j|
        return true if array[i] + array[j] == sum
      end
    end
    return false
  end

  #the solution is O(n^3) becase we are going over it n times three times
  def self.find_sum_3(array, sum = 0)
    (0...array.length).each do |i|
      (i...array.length).each do |j|
        (j...array.length).each do |k|
          return true if array[i] + array[j] + array[k] == sum
        end
      end
    end
    false
  end
end
