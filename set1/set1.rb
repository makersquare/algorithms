module Set1
  def self.swap_small(array)
    #O(n)

    smallest = array[0]
    smallest_index = 0
    # first = array[0]

    # i = 0
    # while i < array.length
    #   if array[i] < smallest 
    #     smallest = array[i]
    #     smallest_index = i
    #   end
    #   i += 1
    # end

    array.each_index do |index|
      if array[index] < smallest
        smallest = array[index]
        smallest_index = index
      end
    end

    # array.insert(smallest_index, first)
    # array.delete_at(smallest_index + 1)

    # array.shift
    # array.unshift(smallest)
    
    array[smallest_index] = array[0]
    array[0] = smallest

    array
    
  end

  def self.find_sum_2(array, sum = 0)
    # my solution
    # result = []
    # if array.empty?
    #   result << false
    # elsif array.include? 0
    #   result << true
    # else
    #   array.each do |x|
    #     if array.include? (x * -1) 
    #       result << true
    #     else
    #       result << false
    #     end
    #   end
    # end
    
    # result.include? true ? true :  false

    # first solution
    # array.each do |ele1|
    #   array.each do |ele2|
    #     if ele1 + ele2 == sum
    #       return true #This will exit out of the method
    #     end
    #   end
    # end
    # false

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

  def self.find_sum_3(array)
    # my solution 
    #result = []
    # if array.empty?
    #   false
    # elsif array.include? 0
    #   true
    # elsif array.any?{|x| x < 0}
    #   true
    # else
    #   false
    # end

    array.each do |ele1|
      array.each do |ele2|
        array.each do |ele3|
          if ele1 + ele2 + ele3 == 0
            return true
          end
        end
      end
    end
    false
    
  end
end
