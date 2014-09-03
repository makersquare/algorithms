module Set1
  def self.swap_small(array) #=> O(n)
    first_number = array.first
    smallest_number = nil
    position = nil
    (0...array.length).each do |index|
      if smallest_number == nil || smallest_number > array[index]
        smallest_number = array[index]
        position = index
      end
    end

    # This is inefficient.
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

=begin

  Patrick's answer:
  
  def self.swap_small(array) #=> O(n)
    min_index = 0
    array.each_index do |index|
      if array[index] < array[min_index]
        min_index = index
      end
    end

    holder = array[min_index]
    array[min_index] = array[0]
    array[0] = holder

  end
  
=end

  # def self.find_sum_2(array, sum = 0) #=> O(n**2)
  #   array.each do |num|
  #     array.each do |num2|
  #       if num + num2 == sum
  #         return true
  #       end
  #     end
  #   end
  #   false
  # end


  
  # More efficient way:

  def self.find_sum_2(array, sum = 0) #=> O(2n)
      hash = {}
      array.each do |ele1|
        hash[ele1] = true
      end

      array.each do |ele1|
        if hash[sum - ele1]
          return true
        end
      end
      false
  end



  def self.find_sum_3(array) #=> O(n**3)
      array.each do |num|
        array.each do |num2|
          array.each do |num3|
            if num == 0 || num + num2 + num3 == 0
              return true
            end
          end
        end
      end
    false
  end

end
