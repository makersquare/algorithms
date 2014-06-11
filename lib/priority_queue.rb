class PriorityQueue
  def initialize
    @arr = []
    @loc = {}
  end

  def push(item, value)
    @arr.push({payload: item, value: value})
    index = @arr.length - 1
    while index > 0
      par_index = parent_for_index(index)
      if @arr[index][:value] < @arr[par_index][:value]
        swap_loc_in_arr(par_index, index)
        index = par_index
      else
        index = 0
      end
    end
    item
  end

  def unshift
    return nil if @arr.empty?
    value = @arr[0][:payload]
    @arr.length > 1 ? @arr[0] = @arr.pop : @arr.pop
    _unshift(0)
    value
  end

  def _unshift(index)
    child1_loc, child2_loc = children_for_index(index)
    if child2_loc #automatically a child1 if a child2 exists

      if @arr[index][:value] > @arr[child2_loc][:value] && @arr[child1_loc][:value] >= @arr[child2_loc][:value]
        swap_loc_in_arr(index, child2_loc)
        return _unshift(child2_loc)
      end
    end

    if child1_loc
      if @arr[index][:value] > @arr[child1_loc][:value]
        swap_loc_in_arr(index, child1_loc)
        _unshift(child1_loc)
      end
    end
  end

  def swap_loc_in_arr(index, child_index)
    @arr[index], @arr[child_index] = @arr[child_index], @arr[index]
  end

  def children_for_index(index)
    child1 = 2 * index + 1
    child2 = 2 * index + 2
    child1 = nil if child1 >= @arr.length
    child2 = nil if child2 >= @arr.length
    [child1, child2]
  end

  def parent_for_index(index)
    (index - 1) / 2
  end
end
