# O(n) time | O(n) space
def zigzag_traverse(array)
  height = array.length - 1
  width = array[0].length - 1
  result = []
  row, col = 0, 0
  going_down = true

  until is_out_of_bounds?(row, col, height, width)
    result.append(array[row][col])
    if going_down
      if col == 0 || row == height
        going_down = false
        if row == height
          col += 1
        else
          row += 1
        end
      else
        row += 1
        col -= 1
      end
    else
      if row == 0 || col == width
        going_down = true
        if col == width
          row += 1
        else
          col += 1
        end
      else
        row -= 1
        col += 1
      end
    end
  end

  result
end

def is_out_of_bounds?(row, col, height, width)
  row < 0 || row > height || col < 0 || col > width