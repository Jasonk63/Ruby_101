# Practice Problems: Additional Practice

```ruby
1. flintstones.to_h { |name| [name, flintstones.index(name)] }

2. ages.values.sum
   
   or
   
   total_ages = 0 
   ages.each { |_, age| total_ages += age }

3. ages.delete_if { |_, ages| ages >= 100 }

   or

   ages.keep_if { |_, ages| ages < 100 }

4. ages.values.min

5. flintstones.index { |name| name[0,2] == 'Be' }

6. flintstones.map! { |name| name[0,3] }
   
   or
   
   counter = 0
   loop do
     flintstones[counter] = flintstones[counter][0,3]
     counter += 1
     break if counter == flintstones.size
   end
   
7. statement = "The Flintstones Rock"

   letter_count = {}
   counter = 0

   loop do
     statement_no_spaces = statement.split.join
     frequency = 0
     current_letter = statement_no_spaces[counter]

     statement.each_char { |char| frequency += 1  if current_letter == char }
     letter_count[current_letter] = frequency

     counter += 1
     break if counter == statement_no_spaces.size
   end

   puts letter_count

8. 1  # Uses current length of array rather than original length
   3  # the Array#each iterators operate on the array in real time 

   1
   2

9. words = "the flintstones rock"
   words_array = words.split

   words_array.each { |word| word.capitalize! }

   words_array.join(' ')

   or

   words = "the flintstones rock"
   counter = 0
   words_array = words.split

   loop do
     words_array[counter].capitalize!
     counter += 1
     break if counter == words_array.size
   end

   words_array.join(' ')

   or

   words.split.map { |word| word.capitalize }.join(' ')

10. munsters.each do |name, info|
      case info["age"] 
      when (0...17)
        info["age_group"] = "kid"
      when (18...64)
        info["age_group"] = "adult"
      else
        info["age_group"] = "senior"
      end
    end

```
