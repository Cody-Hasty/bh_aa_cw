# unique el
# same rder
# already uniq remains same
# des not mutate
# require "./lib/ex.rb"
require "ex"
require "rspec"

describe "#my_uniq" do #Array#my_uniq?
  it "should only return unique elements" do
    expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
  end

  it "should return elements in the same order" do 
    expect([5, 5, 4, 4, 3, 2, 1].my_uniq).to eq([5,4,3,2,1])
  end

  it "unique arrays should not be changed" do
    expect([1,2,3].my_uniq).to eq([1,2,3])
  end

  it "should not mutate" do
    arr1 = [1,2,3]
    expect(arr1.object_id).to_not eq(arr1.my_uniq.object_id)
  end
end

describe "#two_sum" do 
  it "should return pairs that sum to 0" do
    expect([1,-1].two_sum).to eq([[0,1]])
  end

  it "should be sorted dictionary-wise" do
    expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
  end

  it "contains no duplicate pairs" do
    expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[0, 4], [2, 3],[3,2],[4,0]])
  end

  it "should return an empty array if there are no pairs" do
    expect([].two_sum).to eq([])
  end
end

describe "#my_transpose" do
  it "should invert the array" do
  rows = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]
  cols = [
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
    expect(my_transpose(rows)).to eq cols
  end

  it "should do nothing to a 1d array" do
    expect(my_transpose([1,2,3])).to eq([1,2,3])
  end

  it "should return empty if input is empty" do
    expect(my_transpose([])).to eq([])
  end

end

describe "#stock_picker" do
  ticker = [2,3,1,4,5]
  it "should buy before it sells" do
    res = stock_picker(ticker)
    expect(res[0]).to be < res[1]
  end

  it "should return the most profitable pair" do
    expect(stock_picker(ticker)).to eq([2,4])
  end

  it "should never purchase if the stock never goes up" do
    expect(stock_picker([5,4,3,2,1])).to be nil
  end

end

