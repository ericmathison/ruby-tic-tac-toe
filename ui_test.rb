require_relative 'board'
require_relative 'ui'
require 'minitest/autorun'

class TestUI < Minitest::Test
  def test_output_with_empty_board
    board = Board['--- --- ---']
    empty_board = <<~BOARD
      Turn: Player X

         │   │  
      ───┼───┼───
         │   │  
      ───┼───┼───
         │   │  
    BOARD
    assert_equal UI.output(board), empty_board
  end

  def test_output_mid_game
    board = Board['xox xo- ---']
    mid_game_board = <<~BOARD
      Turn: Player O

       X │ O │ X
      ───┼───┼───
       X │ O │  
      ───┼───┼───
         │   │  
    BOARD
    assert_equal UI.output(board), mid_game_board
  end

  def test_winning_game
    board = Board['xo- oo- xxx']
    mid_game_board = <<~BOARD
      Game Over
      Player X won!

       X │ O │  
      ───┼───┼───
       O │ O │  
      ───┼───┼───
       X │ X │ X
    BOARD
    assert_equal UI.output(board), mid_game_board
  end
end
