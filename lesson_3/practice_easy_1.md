## Practice Problems : Easy 1

1. 1
   2
   2
   3

2. ! is the Logical NOT Operator.  Used to reverse the logical state of its operand.
   ? is a conditional expression.  Ternery operator.
    1. != is 'not equal to'.  It should be used during comparisons in conditionals.
    2. ! before something is used to turn any object into the opposite of their boolean equivalent.
    3. ! at the end of the method is only part of method name, not Ruby syntax.
    4. ? before something preceded by a condition would make a ternery expression.
    5. ? after something would be a naming convention.
    6. !! is used to turn any object into their boolean equivalent.

3. advice.gsub!('important', 'urgent')

4. numbers.delete_at(1) will delete the value at location numbers[1], 
   while numbers.delete(1) will delete the value that is equal to 1.

5. (10..100).cover?(42)

6. famous_words = "Four score and " << famous_words
   famous_words = "Four score and " + famous_words

7. flintstones.flatten!

8. flintstones.to_a
   flintstones.keep_if { |person| person == "Barney" }
   > Launch School correct answer :
      >flintstones.assoc("Barney")

