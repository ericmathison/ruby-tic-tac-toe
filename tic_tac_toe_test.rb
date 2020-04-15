require_relative 'tic_tac_toe.rb'
require 'minitest/autorun'

class TestBoard < Minitest::Test

    # position map:
    # 1 |  2 |  3
    # -----------
    # 4 |  5 |  6
    # -----------
    # 7 |  8 |  9

  def setup
    @board = Board['---
                    ---
                    ---']
  end

  def test_to_s
    board_output = "---\n---\n---"
    assert_equal @board.to_s, board_output

    board = Board['o--
                   ---
                   --x']
    board_output = "o--\n---\n--x"
    assert_equal board.to_s, board_output
  end

  def test_move
    @board.move(:x, 9)
    expected_board = Board['---
                            ---
                            --x']
    assert_equal @board.to_s, expected_board.to_s
  end
end
