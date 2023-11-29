=begin

a method that takes two arrays of numbers and returns the result of merging 
the arrays. The elements of the first array should become the elements at 
the even indexes of the returned array, while the elements of the second array 
should become the elements at the odd indexes. For instance:

merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]


********Casual*******

Given 2 arrays of numbers
- Set a counter at 0
- Iterate through the first array
- For each iteration: 
    - assign the number to the variable num
    - add num to the second array at the index position that corresponds with the counter
- Add 2 to the counter
- Repeat the process until each number in the first array has been added to the second array.

********Formal*******



def merge_arrays(arr1, arr2)
  counter = 0
  
  break if counter > 4
  
  num = arr1[counter]
  Add num to arr2[counter]
  
  counter +=2

end

arr1 = [1, 2, 3]
arr2 = [4, 5, 6]


=end

 