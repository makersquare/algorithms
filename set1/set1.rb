module Set1
  #O(n)
  def self.swap_small(array)
  	temp = 0
    array.each_index do |index|
      if array[index] < array[temp]
        temp = index
      end
    end
    array[0],array[temp] = array[temp], array[0]
    array
  end

  #0(n^2)
  def self.find_sum_2(array, sum = 0)
    if array.empty?
      return false
    end
    array.each do |i|
      array.each do |j|
        if i + j == 0
          return true
        end
      end
    end
    false
  end

  #(n^3)
  def self.find_sum_3(array)
    if array.empty?
      return false
    end
    array.each do |i|
      array.each do |j|
        array.each do |k|
          if i + j + k == 0
            return true
          end
        end
      end
    end
    false
  end
end

