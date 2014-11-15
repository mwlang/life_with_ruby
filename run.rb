require './app'

board = Board.new(40)

board.load(File.read('michaels_board.txt'))

10000.times do 
  board.draw_html
  board.draw 
  #sleep(0.01)
  board.play_god
end