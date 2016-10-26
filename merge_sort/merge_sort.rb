require 'pry'
module MergeSort
  def merge arr1, arr2
  #  binding.pry
    puts arr1.to_s
    puts arr2.to_s
    merged_arr = Array.new
    # collect smaller element of 2 arrays until one of arry becam nil
    while 0 < arr1.length && 0 < arr2.length do
      if arr1[0] > arr2[0]
        puts "deleted :" + arr2[0].to_s
        merged_arr.push arr2.delete_at(0)
      else
        puts "deleted :" + arr1[0].to_s
        merged_arr.push arr1.delete_at(0)
      end
    end
    # shilf remaining array into merged_arr
    if arr2.length > 0
      arr2.each{|x| merged_arr << x }
    end
    if arr1.length > 0
      arr1.each{|x| merged_arr << x }
    end
    puts "merged :" + merged_arr.to_s
    merged_arr
  end
  def merge_sort arr
    throw ArgumentError unless arr.kind_of?(Array)
    throw ArgumentError unless arr != nil
    if arr.length < 2
      return arr
    end
    arr1  = arr[0, arr.length/2]
    arr2 = arr[arr.length/2,arr.length-1]
    arr1 = merge_sort arr1
    arr2 = merge_sort arr2
    arr = merge arr1, arr2
    arr
  end
end
