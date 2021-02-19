# Practice Problems: Sorting, Nested Collections and Working with Blocks

1. `arr.sort { |a, b| b.to_i <=> a.to_i }`

2. `books.sort_by {|book| book[:published] }`

3. `arr1[2][1][3]`
   
   `arr2[1][:third][0]`

   `arr3[2][:third][0][0]`

   `hsh1['b'][1]`

   `hsh2[:third].key(0)`

4. `arr1[1][1] = 4`

   `arr2[2] = 4`

   `hsh1[:first][2][0] = 4`

   `hsh2[['a']][:a][2] = 4`

5. ```ruby
   total_male_age = 0
   munsters.each_value do |details|
     total_male_age += details["age"] if details["gender"] == "male"
   end

   total_male_age

6. ```ruby
   munsters.each do |munster, details|
     puts "#{munster} is a #{details["age"]}-year-old #{details["gender"]}"
   end
   
7. a = 2
   b = [3, 8]

8. ```ruby
   vowels = 'aeiou'

   hsh.each do |_, value|
     value.each do |string|
       string.chars.each do |char|
         puts char if vowels.include?(char)
       end
     end
   end

9. ``` ruby
   arr.map do |array|
     array.sort do |a, b|
       b <=> a
     end
   end

10. ```ruby
    [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
      incremented_hash = {}
      hash.each do |key, value|
        incremented_hash[key] = value + 1
      end
      incremented_hash
    end

11. ``` ruby
    arr.map do |array|
      array.select do |number|
        number % 3 == 0 
      end
    end

12. ```ruby
    hash = {}
    arr.each do |sub_array|
      hash[sub_array[0]] = sub_array[1]
    end
    
    hash

13. ```ruby
    arr.sort_by do |array|
      array.select { |number| number.odd? }
    end

14. ```ruby
    arr = []
    hsh.each do |produce, details|
      if details[:type] == 'fruit'
        arr << details[:colors].map { |color| color.capitalize } 
      elsif details[:type] == 'vegetable'
        arr << details[:size].upcase
      end
    end

15. ```ruby
    arr.select do |hash|
      hash.all? do |_, value|
        value.all? do |number|
          number.even?
        end
      end
    end

16. ```ruby
    def generate_UUID
      characters = []
      (0..9).each { |character| characters << character.to_s }
      ('a'..'f').each { |character| characters << character }

      uuid = ''
      sections = [8, 4, 4, 4, 12]
      sections.each_with_index do |section, index| 
        section.times { uuid += characters.sample }
        uuid += '-' unless index >= sections.size - 1
      end 

      uuid 
    end

