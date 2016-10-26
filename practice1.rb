# pivot is a value, this function return index of pivot in array
require 'pry'
def partition arr, left, right
=begin
# using random pivot to optimize runtime
  rand_index = rand(left..right)
  pivot = arr[rand_index]
# swap pivot to end
  arr[rand_index], arr[right] = arr[right], arr[rand_index]
=end
    pivot = arr[right]
    # puts "pivot:" + pivot.to_s
    i = left
    #for j in left..right-1 => remove for and use .each
    (left..right-1).each{|j|
        if arr[j] <= pivot
            arr[j], arr[i] = arr[i], arr[j]
            i += 1
        end
    }
    arr[i], arr[right] = arr[right], arr[i]
    binding.pry
    i
end

def quicksort arr, left, right       # From min to max
      binding.pry
    if left < right
        pivot_index = partition arr, left, right
        quicksort arr, left, pivot_index-1
        quicksort arr, pivot_index+1, right
    end
    arr
end

arr = gets   # Input something like "1 2 3 4" or "3, 5, 6, 1"
arr = arr.split(" ").map{|x| x.to_i }
puts "input" + arr.to_s
quicksort arr, 0, arr.length-1
puts "output" + arr.to_s
