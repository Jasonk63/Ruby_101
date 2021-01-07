## Practice Problems : Medium 1

1. 10.times { |number| puts (" " * number) + "The Flintstones Rock!"}

2. The error is because the statement is trying to concatenate two different types, a string and an integer.
   One fix is to convert (40 + 2) to a string with `Integer#to_s`. 
    (40 + 2).to_s 
   Another is string interpolation. 
    #{40 + 2}

3. while divisor > 0 do
     factors << number / divisor if number % divisor == 0
     divisor -= 1
   end

   Bonus 1: The purpose is the ensure the result is an integer. 
   Bonus 2: The purpose is to make sure that the method returns the correct data.

4. The difference is that the `rollingbuffer2` will not add to the original array.

5. The limit variable is not initialized within the method, therefore it is out of scope.
   You can fix it by defining `limit` within the method.

6. 34

7. The original hash was iterated through and modified due to the method, because the method points
   to the original's object id.

8. paper

9. no

