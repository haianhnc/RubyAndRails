# input given a increasing array and a value
# output index of value in array equal with value
# -1 if not found
require 'pry'
module BinarySearch
	def binary_search arr, key
		throw ArgumentError unless arr.kind_of?(Array)
		throw ArgumentError unless arr != nil
		#throw ArgumentError unless arr.length > 0

		if [] == arr
			binding.pry
			 return "not found!"
			 # binding.pry
		end

		if arr.length == 1
			if key == arr[0]
				return 0
			else
				return "not found!"
			end
			#key == arr[0] ? 0 : "not found!"
		end

		index = 0
		if key == arr[(arr.length -1)/2]
			return (arr.length -1)/2
		end

		if key > arr[(arr.length -1)/2]
			index += (arr.length -1)/2
			return  "not found!" unless (binary_search arr[(arr.length -1)/2, arr.length-1]).is_a? Integer
			index += binary_search arr[(arr.length -1)/2, arr.length-1]
		end

		if key < arr[(arr.length -1)/2]
			index += binary_search arr[0, (arr.length -1)/2]
		end
		index
	end
end
