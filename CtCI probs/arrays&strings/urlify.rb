# Write a method to replace all spaces in a string with '%20'. You may assume the string has
# sufficient space at the end to hold the additional characters and that you are given the "true"
# length of the string

def urlify(string)
  (0..string.length).each do |i|
    if string[i] == ' '
      if string[i + 1] != ' ' && !string[i + 1].nil?
        string[i] = ''
      else
        string[i] = '%20'
      end
    end
  end

  string
end