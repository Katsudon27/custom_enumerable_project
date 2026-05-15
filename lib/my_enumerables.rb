module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    self.length.times do |index|
      yield(self[index], index)
    end

    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?
    match = []

    self.my_each do |element|
      match << element if yield(element)
    end

    match
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.my_each do |element|
      return false if !yield(element)
    end

    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    self.my_each do |element|
      return true if yield(element)
    end

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    self.my_each do |element|
      return false if yield(element)
    end

    true
  end
  
  def my_count
    return self.length unless block_given?

    count = 0

    self.my_each do |element|
      count += 1 if yield(element)
    end

    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?
    mapped_array = []

    self.my_each do |element|
      mapped_array << yield(element)
    end

    mapped_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    self.length.times do |index|
      yield(self[index])
    end

    self
  end
end
