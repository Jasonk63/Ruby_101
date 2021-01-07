## Practice Problems : Hard 1

1. `My answer` : I expect that there will be an undefined method/variable error.
   There is no condition for `greeting` to be declared or assigned a value.  

   `Correct Answer` : No error is thrown because when you initialize a local variable within
      an `if` block, even if that `if` block doesn't get executed, the local variable is 
      initialized to `nil`.

2. { a: 'hi there' }

3. A. one is: one
      two is: two
      three is: three
   
   B. one is: one
      two is: two
      three is: three
  
   C. one is: two
      two is: three
      three is: one

4. ```ruby
   def dot_separated_ip_address?(input_string)
     dot_separated_words = input_string.split(".")
     return false unless dot_separated_words.size == 4
     while dot_separated_words.size > 0 do
       word = dot_separated_words.pop
       return false unless is_an_ip_number?(word)
     end
     true
   end
   ```
