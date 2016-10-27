# input given a increasing array and a value
# output index of value in array equal with value
# -1 if not found
require 'pry'
module BinarySearch
	def binary_search arr, key
		throw ArgumentError unless arr.kind_of?(Array)
		throw ArgumentError unless arr != nil
		#throw ArgumentError unless arr.length > 0
		bn_search arr, 0, arr.length - 1, key
	end

	def bn_search arr, left, right, key
		return -1 unless arr.any?

		if left > right
			return -1
		end

		if left == right && arr[left] == key
			return left
		end

		m = (left + right)/2
		if arr[m] == key
			return m
		elsif arr[m] > key
			right = m -1
			return bn_search arr, left, right, key
		else
			left = m + 1
			return bn_search arr, left, right, key
		end	
	end
end
