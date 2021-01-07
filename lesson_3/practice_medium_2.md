## Practice Problems : Medium 2

1. The object id of the number value will be the same if another variable has the same value. 
   Even though the array has only one value which is the same as a and d, the object id will be different.
   The object ids of the _outer variables will stay the same inside the block.
   The object ids of the _outer variables will change when their values are reassigned.
   The _inner variable will have the same object ids as the _outer variables.

2. Within the main method, the object ids will stay the same.
   Within the second method the object ids will stay the same until reassignment, because Ruby
   reuses the same objects.

3. My string looks like this now: pumpkins
   My array looks like this now: ["pumpkins", "rutabaga"]

   This is because `Array#<<` is mutating and will alter the original object, while `String#+=` will create a new
   object which `my_string` will not be pointing to.  

4. My string looks like this now: pumpkinsrutabaga
   My array looks like this now: ["pumpkins"]

   This is because `String#<<` will mutate the original object, but `Array#=` will create a new object and assign
   it to `an_array_param`, which will not mutate the original.

5. ```ruby
   def tricky_method(a_string_param, an_array_param)
     a_string_param += "rutabaga"
     an_array_param << "rutabaga"
     return a_string_param, an_array_param
   end

   my_string = "pumpkins"
   my_array = ["pumpkins"]
   my_string, my_array = tricky_method(my_string, my_array)

   puts "My string looks like this now: #{my_string}"
   puts "My array looks like this now: #{my_array}"
   ```

6. ```ruby
   def color_valid(color)
     color == "blue" || color == "green"
   end
   ```
