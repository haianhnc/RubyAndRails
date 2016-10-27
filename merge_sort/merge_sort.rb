require 'pry'
module MergeSort
  def merge arr1, arr2
    merged_arr = Array.new
    # collect smaller element of 2 arrays until one of array become empty
    while 0 < arr1.length && 0 < arr2.length do
      if arr1[0] > arr2[0]

        merged_arr.push arr2.delete_at(0)
      else
        merged_arr.push arr1.delete_at(0)
      end
    end

    # shilf remaining array2 into merged_arr
    arr2.each{|x| merged_arr << x} if arr2.length > 0
    # shilf remaining array1 into merged_arr
    arr1.each{|x| merged_arr << x} if arr1.length > 0

    merged_arr
  end


  def merge_sort arr
    throw ArgumentError unless arr.kind_of?(Array)
    throw ArgumentError unless arr != nil
    return arr if arr.length < 2

    arr1 = arr[0, arr.length/2]
    arr2 = arr[arr.length/2,arr.length-1]
    arr1 = merge_sort arr1
    arr2 = merge_sort arr2
    arr = merge arr1, arr2
    arr
  end

end
