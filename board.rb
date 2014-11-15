require './cell'

class Board
  attr_reader :size
  attr_accessor :cells
  
  def initialize(size = 10)
    @size = size
    initialize_board
  end
  
  def initialize_board
    @cells = []
    (0..size-1).each_with_index do |row|
      (0..size-1).each_with_index do |col|
        @cells << Cell.new(self, row, col, false)
      end
    end
  end
  
  def cell_at(row, col)
    cells[row * size + col]
  end
  
  def load(data)
    data = data.split("\n")
    data.each_with_index do |input, row|
      cols = input.gsub("|",'').split('')
      cols.each_with_index do |cell, col|
        cell_at(row, col).alive = cell != ' '
      end
    end
  end
  
  def draw_html
    File.open('board.html', 'w') do |f|
      f.puts "<html><head><title>Play God</title><meta http-equiv='refresh' content='0.01'></head><body>"
    	f.puts "<table style='border-collapse: collapse; border: 1px solid black'>"
      (0..size-1).each_with_index do |row|
        f.puts "<tr>"
        (0..size-1).each_with_index do |col|
          if cell_at(row, col).alive?
            f.puts"<td style='background-color: blue; border: 1px solid #555; width:22px; height: 22px'>&nbsp;</td>"
          else
            f.puts"<td style='background-color: white; border: 1px solid #555; width:22px; height: 22px'>&nbsp;</td>"
          end
        end
    	  f.puts "</tr>"
  	  end
      f.puts "</body></html>"
    end
  end
  
  def draw
    print %x{clear}
    (0..size-1).each_with_index do |row|
      output = ["|"]
      (0..size-1).each_with_index do |col|
        cell = cell_at(row, col)
        output << (cell.dying? ? 'd' : cell.alive? ? '*' : ' ')
      end
      output << "|"
      puts output.join
    end
  end
  
  def play_god
    @cells_to_die = []
    @cells_to_birth = []
    cells.each do |cell|
      @cells_to_die << cell if cell.alive? and cell.neighbors.count < 2
      @cells_to_die << cell if cell.alive? and cell.neighbors.count > 3
      @cells_to_birth << cell if !cell.alive? and cell.neighbors.count == 3
    end
    cells.each do |cell|
      cell.death_unto_you if cell.dying?
    end  
    @cells_to_die.each{|cell| cell.dying = true}
    @cells_to_birth.each{|cell| cell.alive = true}
  end
end