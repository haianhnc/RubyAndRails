require_relative 'merge_sort.rb'
require_relative 'merge_sort'

include MergeSort
arr = gets   # Input something like "1 2 3 4" or "3, 5, 6, 1"
arr = arr.split(" ").map{|x| x.to_i }
puts "input" + arr.to_s
arr = merge_sort arr
puts arr.to_s
