# input given a increasing array and a value 
# output index of value in array equal with value
# -1 if not found
module BinarySearch
	def binary_search arr, key
		throw ArgumentError unless arr.kind_of?(Array)
		throw ArgumentError unless arr != nil
		#throw ArgumentError unless arr.length > 0

		if arr.length == 0
			-1
		end

		if arr.length == 1
			key == arr[0] ? 0 : -1
		end

		index = 0
		if key == arr[arr.length/2]
			length/2
		end

		if key > arr[arr.length/2]
			index += arr.length/2
			return -1 unless binary_search arr[arr.length/2, arr.length-1] > 0
			index += binary_search arr[arr.length/2, arr.length-1]	
		end

		if key < arr[arr.length/2]
			index += binary_search arr[0, arr.length/2]
		end
		index
	end
end