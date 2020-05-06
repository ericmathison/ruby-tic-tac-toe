require_relative 'board'
require_relative 'ui'

board = Board.new
input = nil

until board.game_over? || input == 'q'
  puts UI.output(board)
  print "Enter a move (from 1-9) or quit (q): "
  input = STDIN.gets.strip
  board.move(board.current_player, input.to_i)
  puts
end
puts UI.output(board)
