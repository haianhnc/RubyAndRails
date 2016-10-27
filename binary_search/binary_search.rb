# input given a increasing array and a value
# output index of value in array equal with value
# -1 if not found
require 'pry'
module BinarySearch
	def binary_search arr, key
		throw ArgumentError unless arr.kind_of?(Array)
		throw ArgumentError unless arr != nil
		bn_search arr, 0, arr.length - 1, key
	end

	def bn_search arr, left, right, key
		return -1 unless arr.any?
		return -1 if left > right
		return left if left == right && arr[left] == key

		m = (left + right)/2
		return m if arr[m] == key
		if arr[m] > key
			right = m -1
			return bn_search arr, left, right, key
		else
			left = m + 1
			return bn_search arr, left, right, key
		end
	end
end
