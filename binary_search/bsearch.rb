require 'rubygems'
require 'pry-debugger'
module ArrayUtil
  def self.bsearch(array, element)
    # If the array is empty return a result
    # Otherwise call your helper _bsearch method
    # array = [3, 4, 6, 1, 12, 22, 9, 10]
    return false if element == nil || array.size == 0
    array.sort!
    mid = array.length / 2
    if array[mid] == element
      true
    elsif element > array[mid]
      ArrayUtil.bsearch(array.drop(mid + 1), element)
    elsif element < array[mid]
      ArrayUtil.bsearch(array.take(mid), element)
    end


  end

  def self._bsearch(array, element, start_index, end_index)
    # If the start and end indeces are the same, search
    # that element and return
    #
    # Otherwise, find the midpoint
    #   midpoint = start_index + (end_index - start_index) / 2
    #
    # If the element is greater than the one at midpoint, call
    #   _bsearch on the right half of the remaining array
    # Otherwise, call _bsearch on left half of the remaining array
  end
end
