def max(array)
	return "No array provided." if array.length == 0
	highest = array[0]
	array[1..-1].each {|x| highest = x if highest < x }
	return highest
end


def middle_element(array)
	return "No array provided." if array.length == 0
	length = array.sort!.length
	p array
	p length
	if length % 2 == 0
		return (array[length/2-1] + array[length/2])/2.0
	else
		return array[length/2]
	end
end

def sum_arrays(array1, array2)
	arr = []
	l = array1.length
	0.upto(l-1) {|x| arr[x] = array1[x]+array2[x]}
	return arr
end