
# 1)
Get user input of two integers
  -add two integers together
  -return sum


START

GET integer_1
GET integer_2

sum = integer_1 + integer_2

END

# 2)
Given a coolection of strings.

Iterate through collection one by one  
- save first value 
- add each subsequent string value including a space.

After iterating through collection, return the completed value

START

# Given an array of strings called "strings"

SET iterator = 0
SET full_sentence = ""

WHILE iterator < length of strings
  full_sentence.push(value within string collection at space "iterator" + " ")
  
  iterator = iterator + 1

PRINT full_sentence

END

# 3)

Given a collection of integers.

Iterate through collection one by one
  - save first value as the starting value.
  - for each iteration check if space in collection is an odd number
  - if odd, skip value and move to next 
  - if not odd, add value 

START

# Given a collections integers called "numbers"

SET iterator = 1
SET every_other = first value of collection

WHILE iterator <= length of numbers
    IF iterator % 2 == 0
      every_other.push(value at space "iterator")
    
    iterator = iterator + 1

END


