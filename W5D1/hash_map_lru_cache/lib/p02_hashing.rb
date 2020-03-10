class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    return 0 if self.length == 0
    sum = 0
    self.each_with_index {|ele, i| sum += ele.hash * (i + 1)}
    sum
  end
end

class String
  def hash
    alpha = ("a".."z").to_a

    sum = 0
    self.each_char.with_index { |char,i| sum += (alpha.find_index(char)).hash * (i + 1) }
    sum
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
