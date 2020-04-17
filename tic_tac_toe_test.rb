require_relative 'tic_tac_toe.rb'
require 'minitest/autorun'

# position map:
# 1 |  2 |  3
# -----------
# 4 |  5 |  6
# -----------
# 7 |  8 |  9

class TestBoard < Minitest::Test
  def setup
    @blank_board = Board['--- --- ---']
    @board_ignores_strange_characters = Board["-abc123--\n -\n\n-- \n -xo"]
    @board_state_one = Board['--- -o- x-x']
    @board_state_two = Board['o-- --- --x']
  end

  def test_raw
    assert_equal @blank_board.raw, '---------'
    assert_equal @board_ignores_strange_characters.raw, '-------xo'
    assert_equal @board_state_one.raw, '----o-x-x'
    assert_equal @board_state_two.raw, 'o-------x'
  end

  def test_move
    @blank_board.move(:x, 9)
    assert_equal @blank_board.raw, '--------x'
    @board_state_two.move(:o, 4)
    assert_equal @board_state_two.raw, 'o--o----x'
  end

  def test_position_open?
    1.upto(9) { |n| assert @blank_board.position_open?(n) }
    [1, 2, 3, 4, 6, 8].each { |n| assert @board_state_one.position_open?(n) }
    [5, 7, 9].each { |n| refute @board_state_one.position_open?(n) }
  end
end
