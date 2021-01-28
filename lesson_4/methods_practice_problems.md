# Practice Problems : Methods and More Methods

1. => [1, 2, 3]
   Because 'hi' is always the return value and is truthy.
   Select returns anything that is considered truthy.

2. "If a block is given, counts the number of elements for which the block returns a true value."
   We can find out by consulting the documentation for `Array#count`.

3. => [1, 2, 3]
   Because `reject` returns a new array containing items where the block's return value is falsey.  
   `puts` will return `nil` for every value.

4. { "a"=>"ant", "b"=>"bear", "c"=>"cat" }
   Because `each_with_object` iterates the block for each element with an object given, and returns
   the given object.  The given object was `{}`, therefore it would return a hash.
   `hash[value[0]] = value` would set the key as the index 0 of each string, meaning the first letter, 
   and the value as the value of each index in the given array.

5. It would destructively remove the first key value pair in the hash and return [:a, "ant"]
   "Removes a key-value pair from hsh and returns it as the two-item array [ key, value ], or the 
   hash's default value if the hash is empty."
   We can find out by consulting the documentation for `Hash#shift`.

6. => 11
   `pop` would destructively remove and return the last index value from the array, and then 
   `size` would be called on that value and give the length of the value `caterpillar`.

7. The block's return value will be `=> true`, because it would return the return value
   of the last expression, which is `num.odd?`.  
   The return value of `any?` would be `=> true`, because if the block returns a truthy value for 
   any element in the collection, the method will return `true`.
   `puts num` is only invoked once, since `any?` will stop iterating the first time the block returns `true`.

8. `take` "Returns first `n` elements from the array." according to the documentation.
   We can find out if it is destructive by testing it in `irb`.
   ```ruby
   2.7.0 :001 > arr = [1, 2, 3, 4, 5]
   2.7.0 :002 > arr.take(2)
    => [1, 2]
   2.7.0 :003 > arr
    => [1, 2, 3, 4, 5]
   ```
   Which it is not.

9. The return value would be `=> [nil, 'bear']` because `map` returns a new array that is transformed
   by the return value of the block. The block would return values with a size greater than 3.
   For `'ant'` the condition would evaluate to `false` and the `if` statement would return `nil`.
   For `'bear'` the condition would evaluate to `true` and `map` would return `bear` to the array.

10. `=> [1, nil, nil]`
   The `else` condition would return the first number (1), while the `if` condition would evaluate to `true`
   on the next two (2,3), and map would return the value.  It would be the return value of `puts` which is
   `nil`.   
