require 'byebug'
class MaxIntSet

  attr_reader :store

  def initialize(max)
    @store = Array.new(max + 1)
  end
  
  def insert(num)
    raise "Out of bounds" if !(0...@store.length).include?(num)

    @store[num] = true

  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket = num % 20
    @store[bucket] << num
  end

  def remove(num)
    bucket = num % 20
    @store[bucket].delete(num)
  end

  def include?(num)
    sub = @store[num % 20]
    sub.each{|ele| return true if ele == num}
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :resize, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    bucket = num % @store.length
    if !@store[bucket].include?(num)
      @store[bucket] << num 
      @count += 1
      resize! if count > @store.length
    end
  end

  def remove(num)
    bucket = num % @store.length
    if @store[bucket].include?(num)
      @store[bucket].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    sub = @store[num % @store.length]
    sub.each{|ele| return true if ele == num}
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
  
  def resize!
    prev = @store.flatten
    @store.each {|ele| ele = Array.new}
    @store.length.times{@store << Array.new}
    prev.each {|el| insert(el)}
    @count = prev.length
  end
end

