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

  def my_any?
    self.my_each do |element|
      bool = yield(element)
      return true if bool == true
    end
    return false
  end

  def my_none?
    self.my_each do |element|
      bool = yield(element)
      return false if bool == true
    end
    return true
  end

  def my_count
    count = 0
    if block_given?
      self.my_each do |element|
        count += 1 if yield(element)
      end
      count
    else
      self.size
    end
  end

  def my_map
    result = []
    self.my_each do |element|
      result << yield(element)
    end
    result
  end

  def my_inject(initial_value, &block)
    self.my_each do |element|
      initial_value = block.call(initial_value, element)
    end
    initial_value
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
