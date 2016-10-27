require 'pry'

module MergeSort
  def merge(arr1, arr2)
    merged_arr = Array.new
    
    while arr1.length > 0 && arr2.length > 0 do
      if arr1[0] > arr2[0]
        merged_arr.push arr2.delete_at(0)
      else
        merged_arr.push arr1.delete_at(0)
      end
    end

    arr1.each { |x| merged_arr << x } if arr1.length > 0
    arr2.each { |x| merged_arr << x } if arr2.length > 0
    
    merged_arr
  end

  def merge_sort(arr)
    throw ArgumentError unless arr.kind_of?(Array)
    return arr if arr.length < 2

    arr1 = merge_sort(arr[0, arr.length / 2])
    arr2 = merge_sort(arr[arr.length / 2, arr.length - 1])

    merge arr1, arr2
  end
end
