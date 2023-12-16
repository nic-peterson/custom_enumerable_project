module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
  end

  def my_select
    result = []
    self.my_each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    self.my_each do |element|
      bool = yield(element)
      return false if bool == false
    end
    return true
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |element|
      yield(element)
    end
  end
end
