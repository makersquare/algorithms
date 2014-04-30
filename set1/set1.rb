require 'benchmark'

module Set1
	#from benchmark, method is O(n)
	def self.swap_small(array)
		return array if array.size == 1

		smallest_value = array[0]
		smallest_index = 0
		array.each_index do |x|
			if array[x] < smallest_value
				smallest_value = array[x] 
				smallest_index = x
			end
		end

		# array[smallest_index] = array[0]
		# array[0] = smallest_value
		array[0], array[smallest_index] = array[smallest_index], array[0]

		return array

	end

	def self.find_sum_2(array, sum = 0)
		# 10x size == 100x longer
		# method is O(n^2)

		return false if array.size == 0
		return true if array.size == 1 && array[0] == sum

		for i in 0..array.size-1
			for j in 0..array.size-2
				if array[j] + array[i] == sum
					return true 
				end
			end
		end

		return false
	end

	def self.find_sum_3(array, sum=0)
		# 10x size == 1,000x longer!
		# method is O(n^3)

		return false if array.size == 0
		return true if array.size == 1 && array[0] == sum

		for i in 0..array.size-1
			for j in 0..array.size-2
				for k in 0..array.size-2
					if array[j] + array[i] + array[k] == sum
						return true 
					end
				end
			end
		end

		return false
	end
end

def test_swap_small

	array_10 = (1..10).to_a
	array_100 = (1..100).to_a
	array_1000 = (1..1000).to_a
	array_10000 = (1..10000).to_a
	array_100000 = (1..100000).to_a
	array_1000000 = (1..1000000).to_a
	array_10000000 = (1..10000000).to_a
	# array_100000000 = (1..100000000).to_a

	puts Benchmark.measure { Set1.swap_small(array_1000000) } #1M = 0.14s
	puts Benchmark.measure { Set1.swap_small(array_10000000) } #1M = 1.23s
	# puts Benchmark.measure { Set1.swap_small(array_100000000) } #10M = 12.75s
end

def test_sum_2
	array_10 = (1..10).to_a
	array_100 = (1..100).to_a
	array_1000 = (1..1000).to_a
	array_10000 = (1..10000).to_a
	array_100000 = (1..100000).to_a
	array_1000000 = (1..1000000).to_a
	array_10000000 = (1..10000000).to_a

	puts Benchmark.measure { Set1.find_sum_2(array_1000) } #1k = 0.16s
	puts Benchmark.measure { Set1.find_sum_2(array_10000) } #10k = 16.6s
end

def test_sum_3
	array_10 = (1..10).to_a
	array_100 = (1..100).to_a
	array_1000 = (1..1000).to_a
	array_10000 = (1..10000).to_a
	array_100000 = (1..100000).to_a
	array_1000000 = (1..1000000).to_a
	array_10000000 = (1..10000000).to_a

	puts Benchmark.measure { Set1.find_sum_3(array_10) } #10 = 0.00023s
	puts Benchmark.measure { Set1.find_sum_3(array_100) } #100 = 0.203s
end

# test_sum_3