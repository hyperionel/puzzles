# (([]()()){})
# Output: true

# O(n) time | O(n) space
def balanced_brackets(string)
   opening_brackets = '([{'
   closing_brackets = ')]}'
   matching_brackets =  { ')' => '(', ']' => '[', '}' => '{' }

   stack = []

  (0..string.length - 1).each do |i|
    if opening_brackets.include?(string[i])
      stack.append(string[i])
    elsif closing_brackets.include?(string[i])
      if stack.empty?
        return false
      elsif stack[-1] == matching_brackets[string[i]]
        stack.pop
      else
        return false
      end
    end
  end

  return stack.size == 0
end