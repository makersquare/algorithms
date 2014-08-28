def max(array)
	return "No array provided." if array.length == 0
	highest = array[0]
	array[1..-1].each {|x| highest = x if highest < x }
	return highest
end


