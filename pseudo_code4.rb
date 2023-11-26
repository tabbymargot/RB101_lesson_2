# a method that determines the index of the 3rd occurrence of a given 
# character in a string. For instance, if the given character is 'x' and 
# the string is 'axbxcdxex', the method should return 6 (the index of the 
# 3rd 'x'). If the given character does not occur at least 3 times, return nil.



# ********Casual*******

# Given a string of characters

  # - Iterate through the characters, comparing the given character with the 
  #   character at each index
  # - In 2 variables, keep a running tally of the number of occurences along with their indexes
  # - If there are at least 3 occurences, once that tally is equal to 3, 
  #   return the index of the last occurences
  # - Otherwise, return nil.


# ********Formal*******

# DEFINE METHOD third_occurence(given_character)
# SET iterator == 0
# SET occurences == 0

# WHILE iterator <= number of characters
  # SET current_character = value of character within collection at index "iterator"
  
  # IF current_character == given_character
    # current_index == iterator
    # occurences += 1
    # BREAK if occurences == 3
  # ELSE
    # skip to next iteration
  # END IF
  
# END WHILE

# IF occurences == 3
  # RETURN current_index
# ELSE
  # RETURN nil






# END METHOD