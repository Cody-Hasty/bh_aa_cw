class Array
  def my_uniq
    arr = []
    self.each do |ele|
      arr << ele if !arr.include?(ele)
    end
    arr
  end

  def two_sum
    arr = []
    self.each_with_index do |el1,i1|
      self.each_with_index do |el2,i2|
        if el1 + el2 == 0 && i2 > i1
          arr << [i1,i2]
        end
      end
    end
    arr
  end
end

def my_transpose(arr)
  return arr if arr.none?{|ele| ele.is_a?(Array)}
  len = arr.length
  new_arr = Array.new(len){Array.new}
  (0...len).each do |i|
    (0...len).each do |j|
      new_arr[j] << arr[i][j]
    end 
  end
  new_arr
end

def stock_picker(ticker)
  pairs = []
  ticker.each_with_index do |el1,i1|
    ticker.each_with_index do |el2,i2|
      if el1 < el2 && i2 > i1
        pairs << [i1,i2]
      end
    end
  end

  return nil if pairs.empty?
  pairs.max_by{|pair| ticker[pair[1]] - ticker[pair[0]]}
end