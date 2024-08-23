class Minmaxstack
  attr_accessor :min_max_stack, :stack
  
  def initialize
    @min_max_stack = []
    @stack = []
  end

  def peek
    @stack[@stack.length - 1]
  end

  def pop
    @min_max_stack.pop
    @stack.pop
  end

  def push(number)
    new_min_max = { 'min' => number, 'max' => number }
    if @min_max_stack.any?
      last_min_max = @min_max_stack[@min_max_stack.length - 1]
      new_min_max['min'] = [last_min_max['min'], number].min
      new_min_max['max'] = [last_min_max['max'], number].max
    end

    @min_max_stack.append(new_min_max)
    @stack.append(number)
  end

  def get_min(number)
    @min_max_stack[@min_max_stack.length - 1]['min']
  end

  def get_max(number)
    @min_max_stack[@min_max_stack.length - 1]['max']
  end
end

# O(1) time | O(1) space for all methods