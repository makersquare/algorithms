module Sort_method

  def self.on_2!(array)

    # array = array_paran 
    # puts array_paran
    for i in 0...array.size
      puts i
      lower = array[i]
      lower_i = i
      # puts 'lower = ' + lower.to_s
      # puts 'lower_i = ' + lower_i.to_s
      for j in (i+1)...array.size
        if lower > array[j]
          lower = array[j]
          lower_i = j
        end
      end

      if lower_i != i
        array[lower_i]=array[i]
        array[i] =lower
      end
    end
    # return array
  end
end