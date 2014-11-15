class Cell
  attr_reader :board
  attr_reader :row, :col
  attr_accessor :alive
  attr_accessor :dying

  def inspect
    "Cell[#{row},#{col}]"
  end
  
  def initialize(board, row, col, alive=false)
    @board = board
    @row = row
    @col = col
    @alive = alive
    @dying = false
  end
  
  def alive?
    alive
  end
  
  def dying?
    dying
  end
  
  def death_unto_you
    @alive = false
    @dying = false
  end
  
  def neighbors
    row_above = row - 1
    row_below = row + 1
    col_to_left = col - 1
    col_to_right = col + 1
    
    results = []
    # look above for neighbors
    if row_above >= 0
      if board.cell_at(row_above, col).alive?
        results << board.cell_at(row_above, col)
      end
      if col_to_left >= 0 
        if board.cell_at(row_above, col_to_left).alive?
          results << board.cell_at(row_above, col_to_left)
        end
      end
      if col_to_right < board.size 
        if board.cell_at(row_above, col_to_right).alive?
          results << board.cell_at(row_above, col_to_right)
        end
      end
    end
      
    # look below for neighbors
    if row_below < board.size
      if board.cell_at(row_below, col).alive?
        results << board.cell_at(row_below, col)
      end
      if col_to_left >= 0 
        if board.cell_at(row_below, col_to_left).alive?
          results << board.cell_at(row_below, col_to_left)
        end
      end
      if col_to_right < board.size 
        if board.cell_at(row_below, col_to_right).alive?
          results << board.cell_at(row_below, col_to_right)
        end
      end
    end
    
    # look to left and right for neighbors
    if col_to_left >= 0 
      if board.cell_at(row, col_to_left).alive?
        results << board.cell_at(row, col_to_left)
      end
    end
    if col_to_right < board.size 
      if board.cell_at(row, col_to_right).alive?
        results << board.cell_at(row, col_to_right)
      end
    end
    return results 
  end
end
