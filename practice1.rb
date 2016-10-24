#pivot is a value, this function return index of pivot in array
def partition(arr,left,right)   
=begin
using random pivot to optimize runtime
    rand_index = rand(left..right)
    pivot = arr[rand_index]
    #swap pivot to end
    arr[rand_index],arr[right] = arr[right],arr[rand_index]      
=end
    pivot = arr[right]
    #puts "pivot:" + pivot.to_s
    i = left
    for j in left..right-1
    #puts "i:" + i.to_s
    #puts "j:" + j.to_s
        if arr[j] <= pivot  then 
            #puts "array updated!"
            arr[j],arr[i] = arr[i],arr[j]
            i=i+1 
            #puts arr.to_s
        else
            #puts arr[j].to_s
            #puts "pivot:" + pivot
            #puts "skip"
        end
    #puts "--------------"
    end
    #puts "array updated 2!"
    arr[i],arr[right]=arr[right],arr[i]
    #puts arr.to_s
    #puts "pivot index:" + i.to_s
    return i    
end

def quicksort(arr,left,right)       #From min to max
    if(left < right)
        pivot_index = partition(arr,left,right)
        quicksort(arr,left,pivot_index-1)
        quicksort(arr,pivot_index+1,right)
    end
    return arr
end

arr = gets   # Input something like "1 2 3 4" or "3, 5, 6, 1"
arr = arr.split(" ").map{|x| x.to_i}
puts "input" + arr.to_s
quicksort(arr,0,arr.length-1)
puts "output" + arr.to_s