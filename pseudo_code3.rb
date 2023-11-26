# A method that takes an array of integers, and returns a new array 
# with every other element from the original array, starting with 
# the first element. For instance:

# every_other([1,4,7,2,5]) # => [1,7,5]

# ********Casual*******

# Given an array of integers

# Iterate over each integer in the array.
# Retrieve the index of the integer
# If the index is 0 or an even number, add it to the new array. Otherwise, skip it.
# Return the new array

# ********Formal*******


# SET ary = [array containing integers]

# DEFINE every_other(ary)

# SET iterator = 0
# SET new_ary
# SET val

    # WHILE iterator <= length of ary
      # IF iterator == 0 or is even 
        # val = value at index which is equal to iterator
        # PASS val into new_ary
      # ELSE
        # Skip to next iteration
      # END IF STATEMENT
    
    # iterator = iterator + 1

# END METHOD

# CALL every_other(ary)