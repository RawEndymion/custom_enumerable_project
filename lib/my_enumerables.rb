# frozen_string_literal: true

# buh
module Enumerable
  # Your code goes here
  def my_each_with_index
    return self unless block_given?

    for i in 0...self.length
      yield(self[i], i)
    end
    self
  end

  def my_select(&block)
    output = []
    self.my_each do |val|
      next unless block.call(val)

      output << val
    end
    output
  end

  def my_all?(&block)
    return true if self.my_select(&block) == self

    false
  end

  def my_any?(&block)
    return true unless self.my_select(&block).empty?

    false
  end

  def my_none?(&block)
    return true if self.my_select(&block).empty?

    false
  end

  def my_count(&block)
    return self.length unless block_given?

    self.my_select(&block).length
  end

  def my_map(&block)
    output = []
    self.my_each { |val| output << block.call(val) }
    output
  end

  def my_inject(initial = 0, &block)
    aggregator = initial
    self.my_each { |val| aggregator = block.call(aggregator, val) }
    aggregator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return self unless block_given?

    for i in self
      yield i
    end
    self
  end
end
