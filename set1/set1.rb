module Set1
  def self.swap_small(array) #=> O(n)
    first_number = array.first
    smallest_number = nil
    position = nil
    (0...array.length).each do |num|
      if smallest_number == nil || smallest_number > array[num]
        smallest_number = array[num]
        position = num
      end
    end
    if smallest_number != first_number
      array.delete(smallest_number)
      array.delete(first_number)
      array.unshift(smallest_number)
      array.insert(position, first_number)
    else
      array.delete(smallest_number)
      array.unshift(smallest_number)
    end
  end

  def self.find_sum_2(array, sum = 0) #=> O(n**2)
    bool = false
    array.each do |num|
      array.each do |num2|
        if num + num2 == 0
          bool = true
        end
      end
    end
    bool
  end

  def self.find_sum_3(array) #=> O(n**3)
    bool = false
      array.each do |num|
        array.each do |num2|
          array.each do |num3|
            if num == 0 || num + num2 + num3 == 0
              bool = true
            end
          end
        end
      end
    bool
  end
end
