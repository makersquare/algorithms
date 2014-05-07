module Sort

  def self.selection_sort(array)
    array.length.times do |first|
      min = first
      first.upto(array.length-1) do |i|
        min = i if array[i] < array[min]
      end
      array[first], array[min] = array[min], array[first]
    end
    array
  end

  # def self.selection_sort(array)
  #    for i in 0..array.length - 1
  #     min = i
  #       for j in (i + 1)..(array.length - 1)
  #         if array[j] < array[min]
  #           min = j
  #         end
  #       end
  #     array[min], array[i] = array[i], array[min]
  #   end
  #   array
  # end

  def self.sort(array)
    if array.length <= 1
      return array
    else
      left = array[0...array.length/2]
      right = array[array.length/2...array.length]

      left.length.times do |first|
        min = first
        first.upto(left.length-1) do |i|
          min = i if left[i] < left[min]
        end
        left[first], left[min] = left[min], left[first]
      end

      right.length.times do |first|
        min = first
        first.upto(right.length-1) do |i|
          min = i if right[i] < right[min]
        end
        right[first], right[min] = right[min], right[first]
      end
    end
    result = []
    result << left << right

  end

  def self.merge(array1, array2)
    result = []
  end


end

# split array into 2, sort those and then merge the 2 together
# left = []
# left << array.length/2
# right = []
