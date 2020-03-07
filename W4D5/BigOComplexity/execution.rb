require "benchmark"

def my_min(array) 

  smallest = false  
  smallest_val = nil 

  array.each do |ele1| 
    smallest = true 
    smallest_val = ele1
    array.each  do |ele2| 
      if ele2 < ele1 
        smallest = false 
      end 
    end
    return smallest_val if smallest 
  end

  nil 
end

def my_min_fast(array)
  array.min 
end

def largest_contiguous_subsum(list)
  subarrs = []
  (0...list.length).each do |start| # 5
    subarrs << [list[start]] # 
    (start+1...list.length).each do |last| # 1 
      subarrs << list[start..last]
    end
  end

  subarrs.max_by(&:sum).sum
end

def linear_largest_contiguous_subsum(list)
  current_sum = 0 
  largest_sum = 0 

  (0...list.length).each do |i| 
    current_sum += list[i] 
    largest_sum = current_sum if current_sum > largest_sum  
    if i < list.length - 1 
     current_sum = 0 if current_sum + list[i] + list[i+1] < current_sum + list[i] 
    end 
  end

  largest_sum
end 

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

p my_min(list)  # =>  -5
p my_min_fast(list)  # =>  -5
p largest_contiguous_subsum([5,3,-7])
p linear_largest_contiguous_subsum([5,3,-7])

def first_anagram(str1, str2)
  permuatations = str1.split("").permutation(str1.length) 
  
  permuatations.include?(str2)
end 




def second_anagram(str1, str2)
 
  str2 = str2.split("")
  str1.each_char do |char|
    
    idx = str2.find_index(char)
    str2.delete_at(idx)
    
  end
  return str2.empty?
end



def third_anagram(str1, str2)
  str1.sort == str2.sort
end

p second_anagram('dictionaryabvd', 'indicatoryabvd')

def fourth_anagram(str1, str2) 
  hash1 = Hash.new(0) 
  hash2 = Hash.new(0) 

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char { |char| hash2[char] += 1 }

  hash1 == hash2
end 

def bonus(str1, str2)
  hash1 = Hash.new(0) 
  

  str1.each_char { |char| hash1[char] += 1 }
  str2.each_char do |char| 
    hash1[char] -= 1 
  end


  hash1.all? { |k,v| v == 0 }
end

p bonus('dictionaryabd', 'indicatoryabvd')

def two_sum?(arr, target_sum) 
  hash = Hash.new(0) 

  arr.each do |ele| 
    hash[ele] += 1 
  end

  arr.each do |ele|
    if target_sum - ele != ele 
      return true if hash[target_sum - ele] > 0 
    else 
      return true if hash[target_sum - ele] > 1
    end 
  end

  false 
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false

def bad_two_sum?(arr, target_sum)
  arr.each_with_index do |ele1, i1|
    arr.each_with_index do |ele2, i2|
      if i2 > i1 
        return true if ele1 + ele2 == target_sum
      end
    end
  end
  false
end

p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr, target_sum)
  arr.sort!
  # each loop w index
    # check for existing index where it sums to target (using bsearch)
      # check if the index is the same as the current each index
      # if so, check the "each index" + 1 and -1 to see if the number has multiple instances
        # double check that "each index" plus and minus one exists
      # if not, use normal logic

  arr.each_with_index do |ele, i|
    idx = arr.bsearch_index {|x| x == target_sum - ele}
    if idx == i
      if arr[i-1] == arr[i] || arr[i] == arr[i+1]
        return true
      end
    elsif idx != nil
      return true
    end
  end
  false
end

p okay_two_sum?(arr, 6) # => should be true
p okay_two_sum?(arr, 10) # => should be false

def four_sum?(arr, target_sum)
   permuatations = arr.permutation(4)
   permuatations.each do |subarr|
    return true if subarr.sum == target_sum
   end
   false
end

arr = [1,2,3,4]
ohgodno = (1..1000).to_a

p four_sum?(ohgodno, 10000)